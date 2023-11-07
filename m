Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0517E3A56
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 11:52:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628753.980535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Jgs-0004oH-1B; Tue, 07 Nov 2023 10:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628753.980535; Tue, 07 Nov 2023 10:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Jgr-0004mR-Uk; Tue, 07 Nov 2023 10:52:13 +0000
Received: by outflank-mailman (input) for mailman id 628753;
 Tue, 07 Nov 2023 10:52:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KeYz=GU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r0Jgq-0004mL-9z
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 10:52:12 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20629.outbound.protection.outlook.com
 [2a01:111:f400:fe12::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3292f16-7d5b-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 11:52:10 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6788.eurprd04.prod.outlook.com (2603:10a6:208:18e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.17; Tue, 7 Nov
 2023 10:52:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.6977.017; Tue, 7 Nov 2023
 10:52:07 +0000
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
X-Inumbo-ID: b3292f16-7d5b-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfT6ETwHUOOkqXRhe8k42TF02XLgs8FemXGwqyCg6/lFJGazMIm1fZh8mkTdiYm4gzBp83hgzhqnXL4goPJTSnsnUPNjRBB74bwoUCT4k3mRSPB5CzLhHV8FJ5GkJbgNvMN+hUBBp2FZojDwpETb0LuLL3+hGyEWQJ0fg3GZUG2rs29yEb9D9hL35ThXo0gToEcOyuiJs6Zfrhq+dudY+m6sPbtssgxPBtWVrP3dSVipbCjV4v5LTVT6xpzJccmSMgbm/1g4cflNULoSpz6pO3w8CGCVGvFWQPEigGeZI4NH8aNpdZ8pdbF654/63W2fba8ynhcMZQxZXwQyFNdSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsAhqtdT5SM0DwnyAfC+mvIiD17IMVQpilAdUZ44mnU=;
 b=NEs6n549vnf32b26WQojg3LVpOZWzob+IscobPlKvlFEtC1EviPrHG/pqBPizm8reMGfgc0p9YqVBO++rI6LT1Qc9nUI2YG7jY6WPUQ4XWueKhAn0yCbH5CkXvk1homGKFerUQ5nLL2ydVV8wJ8DSbGDKlmgs+RlYI5DS7PohSbXD3jdllYs8GECGjM2ePfGOtzpXNQBsMng/Pg54DE5FjJROKhAyjT5zVtdCQI9Wmqff9hubxwxqf2VWC+ebubywPcq7ruTX1fJgIzoZnbXoHpWDkvi8NxswP9G4Ch9AGkpSdErL4Xz9Y3dL6PXKAUA1aHsLd8uCoY3unqMsCxe4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsAhqtdT5SM0DwnyAfC+mvIiD17IMVQpilAdUZ44mnU=;
 b=5BoMZTaSpFtFS5UT17125479pYuJJrW6EHCDjefo5B3JDIukqV0+LTs4rWQbPtLE4zvez+SO5xc5f5566IoSZ3Q/2BOVxNngJNhA5nmySTScblwIXGQi0hdxdaMfKsim4XW8UNqcdEoXPIc4bWTjuHSy5cyitxMw2rP0LN8l3wR38J3ZkJrw4B9uwfhPK0pPs4jnkMcBH72dUXmLFY9pOPsMI01Il9ZmEt0+NwFfdOYg+govqgyiOSaJZEm5QHP/gRALkzsIetJZLqMRgucfC1Q1tQo6ddJApq18WAfj8S5UvSqsxF5e3UyxuynI7T5wZPVzEF6XN0EwFFRAjdDXIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <88e164aa-4b7f-d86e-3ee6-0f720dcd21ed@suse.com>
Date: Tue, 7 Nov 2023 11:52:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH 0/4] address MISRA C:2012 Rule 15.2
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <cover.1699295113.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1699295113.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0253.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6788:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e7fa7c7-2cb9-45c8-f4d8-08dbdf7f9639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l6JE/gczgEggH3800p4KQ2ACY3NfLovg/P7Kth3iVJHo7BqqpATWXX3uBz+RTv9Zz8VIZnnPvete/I1mO73vogfbC3ttR3ZQKhYGXCAiIkuXefOysiFgM2C1J+Q0rxgeDkqJCUPelWpJqpjB9TGP1s6AEQTZeNUPGgeKJGMyYZ1KRRyyhRtQLuhCDinIZzNw6z1lOT2ljMSmLvJskcO43m7AFa3evFxuZ/WSkcZ1KSLn8cYmm1HNoooZPQScyDwtoNxG1txcyE0IK5pVP4k1CP1NHKadmNbFFSfaYE0lJ6sy88lHRweTDdJUqbM5A0GYMv7VSO11x0WrvFS/Cn+tOuv7GbYtmEBOjBggOdzxKigoHDtf8eU1/J0sh+gE+wLdqafQ5lUi7ucqUpAzHIOSswfn+qWG8sQNst/L4VOpzO8qJ8Gc8IxbvUWtJzxAH7lOtRV6TLv+p9tLbbHJrUnBJLFHJz341Sb7beECV3RiKNrqFspf4cDjpF2MimtLae68jyK4r4tUcqoU3lA27RMgaW6XeSMOOqt4XDHppBZNR1eBg9Yh+V5pvZFX+f71u7nNvuA2nLvWA/oPG1oOcn0mXLKsMh/ljIaN+s6XG4ptcwZ67I/Nx1velqPQgRXenDnNJp9R6DFaURDRW1FjnEB5BQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(346002)(376002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(478600001)(6486002)(66946007)(66476007)(66556008)(54906003)(26005)(53546011)(2616005)(6512007)(41300700001)(4326008)(6916009)(4744005)(2906002)(8936002)(316002)(8676002)(7416002)(5660300002)(31696002)(36756003)(86362001)(38100700002)(6506007)(66899024)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzZ3MEFuWEsvdnlLMzFRVmpFK2p4Zk9TUjA5OW1ZcVZ6ZzkvNDhvYVNzaWM4?=
 =?utf-8?B?enBjVWhhcHJUZ2RzV2lZdjV4NGIzSm8wSEtxcjRUbDVIZUdGZXBRanNNa0FG?=
 =?utf-8?B?Y2NHeU9RZHJVSnVTY0pxdmJIVjEydjJLMGU0ZWp2WURpVkkrcXBNMW0zbWNi?=
 =?utf-8?B?eDZVSUN2bzQ4U3VpZ1RQdk1WeFpaQlIwcWlWTEVRVmJxMWFZQms3L2lnVmJR?=
 =?utf-8?B?eVh2NE8zUG1rWGFpVWlhUGphcXFKeVVqSllxUmxzVnpOREw1ZXBUNXFBeWov?=
 =?utf-8?B?clZra1dPc0M5S2xOLy82Y3FqQ0J1UGtvdXNnei84K3pWWTd2eUhoVnM0WjNO?=
 =?utf-8?B?QU4zbFp0eEZDdlR3RTFkUm1WTWNFc3pEZVhBRUJ0TnlmUFlGQUFhMkFjWWtn?=
 =?utf-8?B?UTZMUEdpaEVpSmp3cDFiN1M2SmFZNkRkVVJHdHJiY3VuWDBjVHA4cXh2N1pH?=
 =?utf-8?B?NVRFMzlJNk9INzd5YU5HeldGSmpCU0doTUFvcjkwRFp3NXhXald2OEdZdzVq?=
 =?utf-8?B?Y3lSaUNBZEtMMEFVT2lReVRHV2V2VG1TUVliVXZyYUhNbUExSVpYc0IyOGUw?=
 =?utf-8?B?M05WR3BBS1pzbkhNK2ZpRXE4dGk2OEVCQW9wU0FQTjA1Z3BpNk85LzhUSHVR?=
 =?utf-8?B?N1lXbVlBTVhvM2xjUkoxaXN0NTN5RVRiS3d1eGNkTHFEcEtNSGZQd2dDR1JJ?=
 =?utf-8?B?b2d0WENiaDJOWlJQNnN3SkVvWEdwZ2haei9VM2s5UGNxNDJvc09YMzhoSk40?=
 =?utf-8?B?Ym9JZzRmUEhhdWZuazgxUTZXeW9ybERSQW1rWDRpK0oyNlVKYVlBSjZpVDhL?=
 =?utf-8?B?UGp5dlBxeGloMFp5aXdWclJ1cWtXYmNLd2VHNGdvZWpXNUkvY1M1R1VhYTQv?=
 =?utf-8?B?TmpUdlhzQ3ZYT1I2L3pqd1VWTW1oK1JFQ1o1WDNrb2oySlloQUU3NG1vOUQ5?=
 =?utf-8?B?ajBEOEF4bnhFNjhXUDBqZnBiZGJLVTZhOUZCcWdwanR1ZytFUmYvMjErSVFn?=
 =?utf-8?B?TGIvaXFGVDV2a2dZWjBXdDQ5eUg1UlZPTGk0MnZna1B5MXNoOUdrQzNtYkZq?=
 =?utf-8?B?dW05SyszRVRrTVFkQlZMeDQ1a1NyclI1SndHZWFUMDJ3ZW1MUTRqTGFzWlNU?=
 =?utf-8?B?bSszTnBLSENUakhqUS9lcWVSM1lTakZSNk8vaVZnYUVjeStJWDFiZDlBV3Uz?=
 =?utf-8?B?QXR0b3VpOEZKZWVqM1lJWDllN3FrbzZNK09tTmlVZ0U1WWdzeGU1dzRPbnY2?=
 =?utf-8?B?QkViY05DZk1RWjkvOVd3Tk12aVhMYUZpOHZaVnRKYTdWN1VKZVhoVmVrT0la?=
 =?utf-8?B?R09wM1lBS3Y3aDB5WjIrV3ptMkl3TVM0Nkt2dTBXelQwTCtJYUZsOEdBeUgz?=
 =?utf-8?B?Ri80UElrWDVnNHg0VHRndW5pdE5wZFFQM2YzR3ZWVXVHOVM3MjgyS1JWWmho?=
 =?utf-8?B?dmVKUEhOcjUzWVZMaWNBakswa0Fta0RxL012RjhqZjlCOVlxWkRWNFRLN2JI?=
 =?utf-8?B?bURQdWNVeVkzUlpwalQ0TUxacEJYcmIvVVFSOUE4L3VvdkJhQ0cxWUs2Yi9h?=
 =?utf-8?B?NnJRYXhiY2VUU3ozYVhxNTFmd1pPcEpubzBsSFJoRmZXR0ZBMzNSNTEzTU0y?=
 =?utf-8?B?MHlrcU93Um9KVE1OLzdKSUx2M1l6MmZtS0ZkWmdrUERGeEVNN3dRMjFTd1p6?=
 =?utf-8?B?eEtXVEdkeG5sUHowUklnbkF5VThWMlhUQnJ1VDh2UDlXUlkyTGpCS3VqdVNt?=
 =?utf-8?B?dU8xa3RoVXJ4cFVqUGMyU2srd2M3RnV3VmUwNEVZdjIzRVkxcXpldlVvQlU0?=
 =?utf-8?B?SlA0OWtUejRWQksvb2V2N05FVUJKSU0rQTQ4aFp6QTVNYnNKVVhhbFZxbFZP?=
 =?utf-8?B?MlRWaDZVYUtUTkJxQ3oycWNHMmtlamlYaGJBQmZDZ21TdEMrdTBES2RqWGta?=
 =?utf-8?B?YmZIWDF6R2ZqQm5RQ1lOUXl0K0tVMEJaeWZnVG04OVg2SlRZcG40RkpQQ3dE?=
 =?utf-8?B?SmVpZTF6TXJsOENKaHY1UU05SUZDNUxXVHUvdWFyNFlJb3liN1poT1JoL3RF?=
 =?utf-8?B?KytPRjc0dVhDdkVwa29BeUMyaDVZbWlXK3o0WnFiYzAxUEhoMGt0WjVTaU9C?=
 =?utf-8?Q?9555pWBWNgIN90+lKzMQF4JCj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7fa7c7-2cb9-45c8-f4d8-08dbdf7f9639
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 10:52:07.8555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyxz7ak/EjAJARX9RXZf4RvRYV427gc2IEi1kDGdhcfn+1tF5iOwSVX1IjiME/Z6gBoQRik9PmdXD2or+yvxXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6788

On 07.11.2023 11:33, Nicola Vetrini wrote:
> This series is aimed at presenting some strategies that can be used to deal with
> violations of Rule 15.2:
> "The goto statement shall jump to a label declared later in the same function".

I don't recall this rule being discussed on any of the meetings.

> The rule's rationale is about possible developer confusion, therefore it could
> be argued that there is no substantial gain in complying with it, given the
> torough review process in place.

To be honest, forward goto have potential of developer confusion as well: All
other entities need to be declared / defined before they can be used. Just
labels don't. (Or have I missed any other outlier?) IOW if I saw Misra make
any rule here, I think it ought to suggest to avoid using "goto" altogether.

Jan

