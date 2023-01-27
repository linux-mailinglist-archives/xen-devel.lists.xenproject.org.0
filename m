Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430D067E436
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:53:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485533.752834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLNI6-00085q-Hq; Fri, 27 Jan 2023 11:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485533.752834; Fri, 27 Jan 2023 11:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLNI6-000849-DA; Fri, 27 Jan 2023 11:53:10 +0000
Received: by outflank-mailman (input) for mailman id 485533;
 Fri, 27 Jan 2023 11:53:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xsEI=5Y=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pLNI4-000843-D0
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 11:53:08 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 285b5aed-9e39-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 12:53:06 +0100 (CET)
Received: from DS7PR03CA0122.namprd03.prod.outlook.com (2603:10b6:5:3b4::7) by
 SN7PR12MB8148.namprd12.prod.outlook.com (2603:10b6:806:351::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.25; Fri, 27 Jan
 2023 11:53:00 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::ff) by DS7PR03CA0122.outlook.office365.com
 (2603:10b6:5:3b4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Fri, 27 Jan 2023 11:53:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.22 via Frontend Transport; Fri, 27 Jan 2023 11:53:00 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Jan
 2023 05:52:59 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Jan
 2023 03:52:59 -0800
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 27 Jan 2023 05:52:58 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 285b5aed-9e39-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwCDcd1VN0gR3Qq+MnTto6puKhcWRCMuWK1WprBgmPD5tZDhWNRdxK5e6PGrSL7WvZDzehFznFVCskebYGJXuBz0fM+Xqn24ZSaOySyN2GLLydXWlthjUXt5lS0K5o4Ni1sqxnf+CWbc5J/6RTxVEQ7xJGV2b7W4Ng5VNYIlKjy3+Rw6YNQTN+EDfC43GvMMHKIgQwUVxNkKRO5scfse+ick0+RT977VYnYV8LvBIXugEB91ga0/Qr2zlWhbhpwwlqdAVnTCliWRlJMyNPCffdxbArAV6Xuh4Z90NKvP9hhcPXxY+nN/k23xIc8pXuUHGP/OgnYARYTvDiomHFOmqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhijC0uOxXO1WKKXskNj09v5rtoISG0vbj8f9f9JMAM=;
 b=m75QuJxAbkUasDJcAbSfnC9M5TBMd2enT6nkONGv/s+hCxnsG1v6r/B28GzWo3+JoI3PYifYYk5GVMrv33nVRzdFOaoW6AVoggJXFvLueejS5HblYfYpkd7zIeNSdCLVreHk3pBjRYFEcesqrjVN1YAuFafi5+OQ4b6ovS4wjYPFLGiFTpHfLZnzh2qgM+rMIuQ/kwlaI+S9EaMwpT3goICwq3BXO/7JLDpvew9mmBaFn4aWF0J/yZpy5XK7qIqgZ8ZuAsYEW2Kcf1lCjaFpJObK5pJRiLJJoa3RQIrtUSqKtZStqlBif2X98xN87LWHwzNxTD5yRRVZSBctc0/aUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhijC0uOxXO1WKKXskNj09v5rtoISG0vbj8f9f9JMAM=;
 b=IIOOYWNgd2IKckj6ptiEFxNjW0K8HnOddyKQJR0AqOoIIruSFumk9mULD1TApOMSmVdJYIifcfRAU96WER2OnKL/ggvl8Oi4W3RX/P5apxwrGdPwGce22RvmZvWo8TxF7fWUs3hvrdtQUamOXjwECP9NQhmY35VX6hxyfTGY4Ek=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <06cc44e6-9ffc-aef1-9d32-66c8d87fae9b@amd.com>
Date: Fri, 27 Jan 2023 12:52:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] xen/arm: Defer GICv2 CPU interface mapping until the
 first access
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230116015820.1269387-1-Henry.Wang@arm.com>
 <20230116015820.1269387-3-Henry.Wang@arm.com>
 <b2822e36-0972-5c4b-90d9-aee6533824b2@amd.com>
 <AS8PR08MB79913487DBC6F434758EAE5A92CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <a729bf36-8c67-ccd4-c787-d62aaf7e24b2@xen.org>
 <AS8PR08MB799127D46D09BCFEF9A0392192CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <ed09cf44-cb7b-6713-6ea4-ac38e80b3549@xen.org>
 <AS8PR08MB7991EA180B325C6E58B0157F92CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB7991EA180B325C6E58B0157F92CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT050:EE_|SN7PR12MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e564f51-9a5b-443b-54ce-08db005d0a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+pwpkY4hforKbllIYfc/bIK+ByQpFlA7fJ13PPDyYzq7fkuM96u2B+PY4Kxn3QroyPPQZ36r3W4NTWPjl5r0wP8CTWUmmqEXKYUv/cmd9hdlctXOzLCDHBGWAQXW3+aXQs4dsIOGXZXv4Qkg06AjsjV0G075RdNdUeLxb4TWFs77lxidkYE6JBM5f+Mr5AEvF4TEKtHJonSjSk+QwTGYNbEjuNUhNyTghu+w0fSH3zoHWJcKKUx+a1G5xIDMED1VLE4fhz/pbtXuOXs3p79YTmqFyQhe4wXoUhb9ZfuG5JwkVYpKHughhGt/f1Qw1DJhv5dQpWS+xmz5TStOFcXAecerEPtT8WtnSORRyEMLKEApSLbrGgTf6z8WVPqcdXcd+uoAsnpTbusHQNeGIDMYs1dq3tExkKbnl1k4M4XkIsiUqS+LTasbRaBhEBTF0pGaWhUNv245/gL0/g4Yd5XmnYS2TCB4YhHz/mnPQWfEyan7gJM/mVNeG4EQj94Qhe51T8f6kj2xg/vuPIhfxAlqKDOq6xPqm6/6QCKl1VTH5IAdpxACQkNqwgBcCx6oY6tDp9guI6wpLVqUV0TTOLkMx00YBQfJYbU+ZdeV1GvPbCks0J3CSYSMod8V3BjfpoRNh7kWKpxybPgQt72u6cPaGDhY+ApbQrVe8PMoFmYfkh2ZaC7vbo09hz3T5pzwJIvr1sB1zqLlfozFMOtjCIP8p8qbYn+Xx/5IXXRrwbE8qR3CLJZkz5heC+rXGdjmYwsvqVScKnORgxEjyFz9etZ8lA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(16576012)(41300700001)(356005)(36756003)(316002)(53546011)(8936002)(31686004)(186003)(26005)(8676002)(40460700003)(2906002)(40480700001)(70586007)(6666004)(70206006)(83380400001)(4326008)(5660300002)(47076005)(426003)(54906003)(478600001)(110136005)(44832011)(86362001)(2616005)(336012)(31696002)(36860700001)(82740400003)(82310400005)(81166007)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 11:53:00.5763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e564f51-9a5b-443b-54ce-08db005d0a39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8148

Hi Henry,

On 27/01/2023 12:39, Henry Wang wrote:
> 
> 
> Hi Julien,
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH 2/3] xen/arm: Defer GICv2 CPU interface mapping until
>> the first access
>>>>>>> @@ -153,6 +153,8 @@ struct vgic_dist {
>>>>>>>        /* Base address for guest GIC */
>>>>>>>        paddr_t dbase; /* Distributor base address */
>>>>>>>        paddr_t cbase; /* CPU interface base address */
>>>>>>> +    paddr_t csize; /* CPU interface size */
>>>>>>> +    paddr_t vbase; /* virtual CPU interface base address */
>>>>>> Could you swap them so that base address variables are grouped?
>>>>>
>>>>> Sure, my original thought was grouping the CPU interface related fields
>> but
>>>>> since you prefer grouping the base address, I will follow your suggestion.
>>>>
>>>> I would actually prefer your approach because it is easier to associate
>>>> the size with the base.
>>>>
>>>> An alternative would be to use a structure to combine the base/size. So
>>>> it is even clearer the association.
>>>>
>>>> I don't have a strong opinion on either of the two approach I suggested.
>>>
>>> Maybe we can do something like this:
>>> ```
>>> paddr_t dbase; /* Distributor base address */
>>> paddr_t vbase; /* virtual CPU interface base address */
>>> paddr_t cbase; /* CPU interface base address */
>>> paddr_t csize; /* CPU interface size */
>>> ```
>>>
>>> So we can ensure both "base address variables are grouped" and
>>> "CPU interface variables are grouped".
>>>
>>> If you don't like this, I would prefer the way I am currently doing, as
>>> personally I think an extra structure would slightly be an overkill :)
>>
>> This is really a matter of taste here.
> 
> Indeed,
> 
>> My preference is your initial
>> approach because I find strange to have virtual CPU interface
>> information the physical one.
> 
> then I will keep it as it is if there is no strong objection from Michal.
there are none. It was just a suggestion.

~Michal

