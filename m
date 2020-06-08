Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC161F32EE
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 06:17:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiVh4-0005xS-LN; Tue, 09 Jun 2020 04:16:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f2DJ=7V=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1jiO9s-0005QW-UY
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 20:14:13 +0000
X-Inumbo-ID: 9d7c8d9e-a9c4-11ea-b7bb-bc764e2007e4
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.117]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d7c8d9e-a9c4-11ea-b7bb-bc764e2007e4;
 Mon, 08 Jun 2020 20:14:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+ZeGgFAtjTDTjWHPkGnWoYGcy9lFbCdSFtCB8bXFRbgdRCEhglhSxAOHY6MFBQCiAwgFvytCRUtIS/OA0Dh7iODG4NV2y52W3b4kA8DihX2OGN21LyMPK64UbAN+Z8ShhdRiBUkHrqqjPTvVEJAmkq61KIWgq3Uo0/oLo14g7bBDKIGDQeCR7S53V58RSaCU/c569XBl/6nCqXbon+1XccvXAHQwdG6lXE2fHvBhYlF2vuRhFfoR0fh5Hzq5Xi/ZB/IQLOqSljOolZhsR4xLM7VIRCRh6cPHot/KmZy7q7fhhR9LHh98bcyhiCJf9P+LlI2m1zfSFiTUvDwG88YFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abgcg7OQU3BBnpx7ochP8a7Qo0siGKOUYttX8rYHZWA=;
 b=FXygQ/4cvJ8NI+hOPiaDc7geGapbgxxTBc1GdIxmM1TfkfmkEiKzaETM+rkMa6B2qZa9VE9bVxglQIBE89ay6V4Uo4rOgedbvz+sWP+nY6anpP3cpUDXDP0FiSjyUf/ptUbemVrmbip084I01w1xU22rqymrBwxvPb0RRtyt+SGaJdZ/WtIlQRM1egP7/MonpX6D5WmuSXDrHs8pTg3weE0IydBw9X3K8kLtx9sZXwJOYKxFbNcsf/AeHYGtogqDZei7XQNcz5F5HrEr9/A5L8ddD0NSWHF25uFXnRvVGODjJUC0OgU4+sn0nULTBciTl1hWvsLILbwDW+WEFbfrNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abgcg7OQU3BBnpx7ochP8a7Qo0siGKOUYttX8rYHZWA=;
 b=rwZuTM7lF3MqKJ2xSgsRUNmsCzZ9uEt+ToX2FgCjMKVbJq8MmPcLzV2NVETbBUxY4zURmTamGO45xHaxhxHzt2GrJXG8ibQtFMdJigitSkppoocJL6nzJuoK/Pqy/YybsQlx14z5OMYhhU1VRU0lLcEwDeRCj6jxiVetBOQjwsc=
Authentication-Results: bitdefender.com; dkim=none (message not signed)
 header.d=none;bitdefender.com; dmarc=none action=none
 header.from=bitdefender.com;
Received: from DB8PR02MB5434.eurprd02.prod.outlook.com (2603:10a6:10:e5::15)
 by DB8PR02MB5690.eurprd02.prod.outlook.com (2603:10a6:10:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.22; Mon, 8 Jun
 2020 20:14:09 +0000
Received: from DB8PR02MB5434.eurprd02.prod.outlook.com
 ([fe80::3c22:239a:7f84:7572]) by DB8PR02MB5434.eurprd02.prod.outlook.com
 ([fe80::3c22:239a:7f84:7572%5]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 20:14:09 +0000
Subject: Re: [PATCH v4 for-4.14] x86/monitor: revert default behavior when
 monitoring register write events
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20200603125237.100041-1-tamas@tklengyel.com>
 <20200603150721.GF1195@Air-de-Roger>
 <be627680-5ab2-d93d-b042-2b6aadbdcd8d@suse.com>
 <ffa44e09-a9fd-8fff-16af-e0991db3cb9b@bitdefender.com>
 <CABfawhnNC3yCuG+xNicyjA_Qo89qpvXKL-Cp9wAc4Cq=Xv8BYQ@mail.gmail.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <aded2ba0-3a16-bee5-d3e0-98bf5beb068d@bitdefender.com>
Date: Mon, 8 Jun 2020 23:14:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <CABfawhnNC3yCuG+xNicyjA_Qo89qpvXKL-Cp9wAc4Cq=Xv8BYQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0802CA0008.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::18) To DB8PR02MB5434.eurprd02.prod.outlook.com
 (2603:10a6:10:e5::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.228.119] (82.137.38.55) by
 VI1PR0802CA0008.eurprd08.prod.outlook.com (2603:10a6:800:aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Mon, 8 Jun 2020 20:14:08 +0000
X-Originating-IP: [82.137.38.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbc46b3d-d831-4e0e-0339-08d80be88081
X-MS-TrafficTypeDiagnostic: DB8PR02MB5690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR02MB569066C101A9BE0A97A4ABCDAB850@DB8PR02MB5690.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J0rG/TK6qoC5lcTaiUdksZfrKwiFz0M3gypvz/HJXzvtPQB8Ehpixphpvxm8M50Bn31mFrC5nMMEcTcc+l6HRPnG8p6mcCpHakiqo8fjsPebzyZPfBvZUa8oXYgtpkl27tTWhLbTf++ZegZJIhYvnp2FSzLKTxMB1tM+0ispp8puTX3Qw8DONk+13n8T270p+LQBQbI11AI2Jo4UoQn7w/VxG8xCjNl0wA59xoAakDuASxL6UMg3WaP06UJ9H+o9i2kEnmbYdamoLroqOKr4JrOhIMonHQS8fZgrt4Dabderd70S3oz4PIeVanjmv9+VGotstbC2URtKbvP/LPW2JIvvgqJzi3Eud3PL0ENMusDjFfDl1ObN6oOfCpKuKp9y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR02MB5434.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(366004)(396003)(39860400002)(136003)(52116002)(66476007)(54906003)(66556008)(53546011)(6666004)(2906002)(31686004)(31696002)(107886003)(86362001)(66946007)(2616005)(26005)(5660300002)(186003)(7416002)(4326008)(83380400001)(8936002)(6916009)(6486002)(956004)(8676002)(478600001)(16526019)(316002)(16576012)(36756003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: oQePTx0aGnwdGkXx/MjkU+aZuUQYma8v/YU3N5/QUf89X6nHPnxsXyVNooc83jUCLFLjfjs4688jc/QUX8ygxro4T9E80+Mq4rSS3WeeNK1TkhgmZdsILpQ5nPK1XjSQHwLCcXFxBxHxMUhN3FsojQrTONzlVic0jIKKJtlNO9SFLO9qDXieXAKOHwU/L3kuCFSP1LwywaJKzIAcbcY+e9r8FN+M0YKo/JiHYIdh9V1J2Cc6HHHoYXycxkcfQkc93xJy83rqWxx2+fjhhXNID2J4HYWgdfi7XDTO/nK4EB+WO0V/Dmdbz4/qr7fuXHnMMw2NVy3dEe6cSnvS+mgh/Kmr006dSapRXm2lSvVxQmyxTYTYlSXS1K1blHFvMx9llLNEBkbBf7qHs9ACZwOIA0FuO6B0PWd6dZwSMLUaJk0Gj3Ne0Xwu+69OU94rkYsWsu6cLBSCbREcN0mQ43hgrtK8V2JnoPjZiK9d8GXdeVk=
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc46b3d-d831-4e0e-0339-08d80be88081
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 20:14:09.0551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: It2zEvxQRdy/PNmviiFZu3ckuDzITwQiOHpOqS1wimUoSJVN6f/c8MrVGcN5VEgHua9PzRMJVBXIswH2btOZjPUswabkYwdSKG6JjWbDwU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5690
X-Mailman-Approved-At: Tue, 09 Jun 2020 04:16:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrei LUTAS <vlutas@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/8/20 10:54 PM, Tamas K Lengyel wrote:
> On Mon, Jun 8, 2020 at 12:58 PM Razvan Cojocaru
>> And last but not least, the proper sequence is: 1. unsubscribe from
>> register write events, 2. process all events "still in the chamber"
>> (keep checking the ring buffer for a while), 3. detach from the guest
>> (disable the vm_event subsystem). Not ideal perhaps (in that it's not
>> guaranteed that a VCPU won't resume after a longer period than our
>> timeout), but if the sequence is followed there should be no guest hangs
>> or crashes (at least none that we or our clients have observed so far).
> 
> Incorrect. That's not enough. You also have to wait for all the vCPUs
> to get scheduled before disabling vm_event or otherwise the emulation
> is skipped entirely. Please read the patch message. If the user
> decides to disable vm_event after getting a CR3 event delivered, the
> CR3 never gets updated and results in the guest crashing in
> unpredictable ways. Same happens with all the other registers.

I did read the patch message. As I've previously stated ("it's not
guaranteed that a VCPU won't resume after a longer period than our
timeout"), it's not ideal, and I've made no claim that the problem does
not exist or that it shouldn't be fixed - but really if you've got a
VCPU that will wait more than a couple of seconds to get scheduled then
you've got a bigger problem with the VM.

>> So in short, I think there's a better fix for this by simply not 
>> allocating the vm_event memory on-demand anymore and never having to
>> deal with lost pending emulations again. It should also decrease code
>> complexity by a tiny bit. Then again, as stated at the beginning of this
>> message, that's just a recommendation.is
> 
> Since only you guys use this feature I'm going to wait for a fix.
> Until then, the default behavior should be restored so this buggy
> behavior doesn't affect anyone else. You can still turn it on, its
> just not going to be on for vm_event by default. I don't particularly
> care what fix is there since only you guys use it. If you don't mind
> that there is this buggy behavior because you never disable vm_events
> once you activate it then that's that.

Indeed, our usual scenario is that vm_event is always on on the machine.
It's only rarely being disabled while the guest is running, and when it
is, it's always with waiting sufficiently long that we've not seen any
unexplainable hung VMs.

Fair enough, as long as the previous behaviour is optionally available I
see no reason why this patch shouldn't make it in - though, of course,
as also previously stated, I'm just trying to shed as much light as
possible on this from what I remember, and what happens next is not my
call. My colleagues should be able to chime in tomorrow.


Cheers,
Razvan

