Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E431878C41D
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 14:19:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592170.924810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaxgq-00068j-Ma; Tue, 29 Aug 2023 12:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592170.924810; Tue, 29 Aug 2023 12:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaxgq-00065n-Ii; Tue, 29 Aug 2023 12:19:24 +0000
Received: by outflank-mailman (input) for mailman id 592170;
 Tue, 29 Aug 2023 12:19:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qaxgp-00065d-Ej
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 12:19:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48ee0460-4666-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 14:19:22 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9097.eurprd04.prod.outlook.com (2603:10a6:10:2f0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 12:19:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 12:19:20 +0000
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
X-Inumbo-ID: 48ee0460-4666-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6ozBHRMbUXbaXgx3ZAWCV0r2v5PbKOP+Su1utiox6JGd9W/XwBm240BwqUDtaewthEspEoRrlD6nXb0kT6UQ7MbJHAvI+LGfPA9BhPtssSvzC9HfrmBEVyctBrXfgNgxVDq92Yt/U3nMXrfqxEXzCUqxnfU04MVtT9Otx+Gg9418m6J/AOv87D5VTlLAS/odCya1ENavA8Zjkw5cDzFfXaziJ4JT8O4/OuEdKY+A2EBa2fhWP7RlkUKVpUP9i8tgkobRbrCNlfMY7d7oJ0P/C00m5jz2is9uhWYnSCgVnxMEXEzLw67CzC/RnDHouKfFoe18yBHrVEEmP46+v5/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1IK+qNb4jpQ2ObZMba4MsiajvAvssXcl/ld9UxUd5E=;
 b=c4Nt64mMuOmaJMW64oSsKtJd3dStjuwdU27VUT3dfJnh/yRcJ4EP4BHcy42poca6FwuQxM5klc/Ay4TbHOWuV8aSiXfPdtqMri5ZNxDAdDJc2Dtubvl+TiYgPnnZZrEJ6WxCTVQuZSzsrMBvp6BSY5IJMWmqruMvSd3JYN/erCahIhQ8O3jPMaMbrZM2HKkhz7k08fMxOd1F8P9F0HqCwUHLQ2uHCZNN+j9TJN1am6qvTlzuQtGWhH1Rb4dp9+xGfVAMpP+QGVTcHwrGbgYOw3MnzWFutKHxISPhZfjMeZij2TRcRKdEL9olPHAVz7F5pJCUoGfcw4An0XuQtv1cyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1IK+qNb4jpQ2ObZMba4MsiajvAvssXcl/ld9UxUd5E=;
 b=m4zNeV0BnGCzehd5tAZXrbployOeTQPeNpSFhHglozbu3py9eh9b1P3DOdmYYFE6BLxbIxGRQRGiVO4PLZW84wZ+lWCnfH2Y2Qengxj93sG5w7iD1dR5ne+5O46kPCJSDIwvVmz51Oy25jYTiSxs3Z//R9xZldXOQpnlqBysfttOXaq/P02eqzoEf25yQ8RIrClefTec3Ds/FtIJchcT1NbEWipd88rNro9VzxcN39ma4xY3TJnbTsIFIXNt9g+idR5KlbnSuJAAWW/B5UBPoDFKLrwG42bpkWDD7oeoPnuhrbFB2Gy1K2fFWCqU0w6feMdUW88OGPSecmhgpT+FSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <10880888-9e13-44f6-35fb-8145388255e8@suse.com>
Date: Tue, 29 Aug 2023 14:19:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 2/2] xen: move arm/include/asm/vm_event.h to stubs
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1693235841.git.oleksii.kurochko@gmail.com>
 <c61f930fed46e2312f460333401488af4b0adfc4.1693235841.git.oleksii.kurochko@gmail.com>
 <0b17a63d-ba1f-e8d0-88e3-6824ac17a26f@suse.com>
 <aa3bac341ad5b1c918cf95c238f60e6f9ea87d18.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aa3bac341ad5b1c918cf95c238f60e6f9ea87d18.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9097:EE_
X-MS-Office365-Filtering-Correlation-Id: 735c2501-66c8-4c96-3a30-08dba88a2c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j0iKjqwiHf27WkGtP+f33ZTvJXQGNOlisSyxF/Q9IXROWSenHxKntrgus44+tL2pMGlstZxnyMzGZa2T7tA0bWAhvvA+CUWdZLhcrGdnzpDjEgBkJ6jyObHfasKNb2M+MbUX7BVy3BPsZ0NfSy2ueHHO1jtDb0bh21YidwdgB/ZUqJQ7aNXLXFshkqQias8lxV34fxqEWF3txnaQ0uiw/fTK8ZczY227D8e9cYZSuTzdmcYObm3tvEiasd2JHe3WgE31Yp/Ki/D1SRyJQSYskv5tITHs4UH4RKBH2TONDprcdgpk9xpIF4n35RIOem7hJjz6ja5ofyuozG2Q/+sPdUk4McnEcdHEeXVOIRzGPObjO8xvCZCzxcuUDV3f6cWwSnevGTZkDKMi0tHHKbPZdXQ3L+wM6mjcR1Buu7YvaqzivXe8LzUt5dfYVuEgsX7r1WDJeik1XVq+5JgN1TzJgX/kOytFQlB2PxTE9H7zUzO+owXu3k8koxZkaqDQDyU81ijTZlGSgj5LtWG1we63uhFdRGQDB4uRYZ9J2vHVkb2w8K0v2PHeGsIXjM/d5UpqFuEfN7B0gY5fD1Mrnp8O1WDuINvXMbhEzMxD1kn1AmTxWfZLrqu/OCKqZmBxlIJKz31XPz8wMjeFWKe05hqaAQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(1800799009)(186009)(451199024)(478600001)(26005)(31686004)(2616005)(6486002)(53546011)(6506007)(6512007)(6666004)(31696002)(86362001)(4744005)(2906002)(7416002)(66476007)(38100700002)(6916009)(8676002)(4326008)(5660300002)(316002)(41300700001)(8936002)(36756003)(54906003)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjZ3Uzl0MEZVM3p4SjB1NWpNQ0l2L3hKS083MEExNHp4ZnlMV0RBcWtFb2dN?=
 =?utf-8?B?VVVVOWhKQ0lLU2prK3BWTHlNdWJ0NldiK3hIekhVaU1lQWtYR1FJaS93djZB?=
 =?utf-8?B?ZjNKR3ZoK25CMk5PZW9SMTBTbHhtZ2J0WnM0YXZCUlJtVFJlbU1tNkJyanMw?=
 =?utf-8?B?emNpaXVtVWlhWVRmQ0g1anBnVTdKanpyWTIybk9UV3JuK0xoRk8vdFFqb0xS?=
 =?utf-8?B?SmpaT2lwMXpuLzREeXJ1cHU5SWp3dGRFOTkyUUJ1UVFJbXhRSjRHWDNWRE9x?=
 =?utf-8?B?REJHcGVKQ3Q0R214M2Rvc1pRRWFZeTZTWnVPTU1RajVycWxWMU9DbzR2TFlX?=
 =?utf-8?B?SG9xMGJBTTRhd1Z0ZTluMU5lWDBxNkYvQmZrK3pwTFZBMTBSb2o2cWlTT3Fq?=
 =?utf-8?B?NnloSk9kOTdUaGVvQkNiTUtFRzlEN1VUNG1WT3dnU1MyU2RVYyswYWM5bEty?=
 =?utf-8?B?ZUJXSEpHOGJ0VllKK3IzaGZlTW1YcUEvRW9VSzBNdFdTMDFQMkM1MnFOUE9h?=
 =?utf-8?B?T0NWNUl4ZGhGRzU0dDhsT0dUOElYdENTNDBUWUs0NEpmcXBHelgxV3A3U2k2?=
 =?utf-8?B?dnhwbjFud2JTZDU1YUowWVo5ZXdCSFQvSEFhQU1BWDRsWEJ1R1VrUC9sb3Zl?=
 =?utf-8?B?Q2p5aEl5a1VaVVZja0FHS0I0dVZLOEZkOEhXMVc2MHI4d0IyV3lleEhRRU1H?=
 =?utf-8?B?ejQwakd5TG56ZjVRUWhOZW1tdk1ueFdoQzE0Vytoc0dMN3NpaklHSzRxR2pa?=
 =?utf-8?B?eGlIS0Z6dTVQL0RkcXdiTjlKSFVaRFF3OXNBemxoMzFqSGtweHN5YjM2MHZI?=
 =?utf-8?B?VHgwbXVidytiRWpWcE16eFdadUJnUnpudE44ZEVHMWVZV1ZJWk5vc05odFJw?=
 =?utf-8?B?UVk0SE1TMG4veGc2dW1nWGVJNTgzMUVKVFVWSTU3NGZlNExSSFJJUlR0V1dP?=
 =?utf-8?B?MVcxay9NNFVZVitlbEc1cndNUnR3WDVDMmZDeTVjczhmTUx5NHVjRUVYejJX?=
 =?utf-8?B?Q3lmM2JCV3dqSWVDZU50YkxoS1pTaTU4Uk5lWjNLMHVtWkQyOEtsY3l5VVlw?=
 =?utf-8?B?MU1CcmEwWTl5MWF5VE4wRzZVQ2JWMHhVRzVDV0RUOHRyWEh0VnE4U3VZU2NE?=
 =?utf-8?B?cXRXZ2h2UUtoZ3Zxd3g5aHduc3pOY1ZOb1g3Vmlway8rQmVyNms1c3dyRVds?=
 =?utf-8?B?SGNYUFFpNTdZWXlpSTErdURES243OGltK2tqRlhkbmwwRnRQMFpRSXJsSnpC?=
 =?utf-8?B?WG55SU5JQmVFYmpLa2IvelZoWk9KYWlHbUl4RW85RmxneGU1VExvZXhrV1Ji?=
 =?utf-8?B?L3FHdFBJbzIyQlpCN2RWWENDVmlXTUgwaU9abXdFWHdUcWM4TC8yN1Z5VzFO?=
 =?utf-8?B?RURVdXhabUpIb2h3VTJHS29KcW5TazdEM0hnYzBaTTFzSG9LczllNTJ6aVlK?=
 =?utf-8?B?LytqTTJ6NHR1NnJlNGxmclZMOWJyRHJYbGUrK0ZsR1p6cmUyOVNuUklmUU9Y?=
 =?utf-8?B?MUNYc2ZJVitIcThTdkN4ZFZwbno2Lys2d3NlVFZnaXo2RTdZdVc2UXlWTkEy?=
 =?utf-8?B?Yk9TeXkyMU5LdXNkVk5VWlBhM2QrTStvUlF2UTVNN2dSdytTV0tTOXl4ZFht?=
 =?utf-8?B?N0dLa1prYWkzeE1TRWZGME4rSnhIaEpRUUozUkZEbm9yb1MrNGswTXo1Y3Uy?=
 =?utf-8?B?clN6MzkydkgvaCtXNUcvd3RTd1pMdjQ0bjZaSXlEQ3hTdzVtaW52ZG9GeWxi?=
 =?utf-8?B?emdqTExqMXZac2tHcndGODFBZ1FoSFJFRHllVURjSFZBaUxIcUpWd0tHTFBU?=
 =?utf-8?B?bmh3SGpxbUNOaEcyQnNBcTJEWmlQSGtBbFhFTUpuTDEyOUl1UVFPUXZRbFNV?=
 =?utf-8?B?ODA4TFlFRFlxejF3RlNWVHhCeko5WGo3SnlPK1ZBZXFDcVlHQVhKMDNLdG5K?=
 =?utf-8?B?Z1RlbGJyNlBzcXJZdk04Q3FDSzhXMTQybWNzaGR1NVF5ak1kT09uZmR3V1Nu?=
 =?utf-8?B?dWFnTTB2dUwvcjRLajFrTGdDem5tNERMUUI0SWNFbHJSaWR3MXB0T0lpWFZk?=
 =?utf-8?B?MEo2Wll0SEp5V2VIVFVKSDFueFkySFFsczlhQWQ1Ymc1RFJMaU0weWFnbGFX?=
 =?utf-8?Q?koM70wIP67c3K2rIdqSubJVQY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 735c2501-66c8-4c96-3a30-08dba88a2c2f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 12:19:20.4638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nW8GZ/vTXBd1ZLRqdz1MmfPsubUq65ry11OBlVbUPfu5yILUiJ4RnF1E0FB2Toils8nNu1YEQ5dexfMXcm7+Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9097

On 29.08.2023 14:14, Oleksii wrote:
> On Mon, 2023-08-28 at 18:05 +0200, Jan Beulich wrote:
>> On 28.08.2023 17:57, Oleksii Kurochko wrote:
>>> +static inline void vm_event_cleanup_domain(struct domain *d)
>>> +{
>>> +    memset(&d->monitor, 0, sizeof(d->monitor));
>>
>> This looks to be the sole reason that xen/sched.h is needed. I
>> question
>> the existence of that field in the first place when this stub is
>> being
>> used. But I guess cleaning that up as well might be going too far.
> What do you mean by the existence of the field? Looking at declaration
> of struct domain, monitor field always exists.

Right, and that's what I consider questionable.

> Could we leave initialisation of d->monitor for now?

As said, asking you to also do that aspect of cleanup is probably
going too far, so yes, I guess you can leave that alone.

Jan

