Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A48F544B87
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 14:16:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345294.570919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzH5V-0004lL-Sk; Thu, 09 Jun 2022 12:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345294.570919; Thu, 09 Jun 2022 12:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzH5V-0004il-Pi; Thu, 09 Jun 2022 12:16:33 +0000
Received: by outflank-mailman (input) for mailman id 345294;
 Thu, 09 Jun 2022 12:16:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzH5U-0004iH-MS
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 12:16:32 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe09::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fec863bf-e7ed-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 14:16:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6132.eurprd04.prod.outlook.com (2603:10a6:208:13c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 12:16:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 12:16:29 +0000
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
X-Inumbo-ID: fec863bf-e7ed-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/6mSSvtvjd7U04wTW92EsuoaDac5Wu4em6APdNwMDhzE7H/HApRTkOkB1v6QJGPSzNzSv2+IfUG/Kdig8MKCSPVlIhaU5gLbv1RfcC59jbhCu0seBZKzw8aHLYH30EpDtlaIzGHC2JIC9Nv6uc4080YtbmEod6wSMx7I+psJOZplRFZ/UDBv74BwQJKHkCcQkKamCfUqNrgcvXYL+LAASe2Xc2DgRdbv5clZRax7IYbix0aLSeiovd4cA8TVaMDXDMp4htNFm+4l52yPEEGCFVGVWzI4m8VP6eOtS5eqAdBpAPw4HRs3Tzu6RqOABZ5SlM1ANGosrFIayBn+ck3dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3R5uzim8M6DYJNBfv5SQTaEjZKPTIOqo2PXp59J748=;
 b=fbBYJBskB6WjgefJgEI0/9X/LzQFnZYc4oC2Vxk2ejN48N97BPQ5eS9aiCq8DLSN6+4eY/amZcfnPwIXNkHilypSJG2VNK6JAqtOORc0tXiO6VDtShOZyHLAF/YjqOi0O/uQxTfP2nbqrfgMOW3UUycc9yCu3tIL+Ak0iwrXuDNsExRoWydRAnIf1EzzWaMTRPKKGARTOkP3PlVYMT+1/saksgJVY+uMUihL5G53n1zqHjmJgAurtJe71+Pzz7TDDAHUXC3oxctnofnIB2CKpBG6EloR2Pexwbimnpsev4rEyPgotFreJdXrO3CViKmCBgMg4BmjHohupjbFyREYdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3R5uzim8M6DYJNBfv5SQTaEjZKPTIOqo2PXp59J748=;
 b=Scow91BuAHLGpTCgEhZzdM6QZbEqYHOtjqEvz2z5ZraJWhzy7gWGaRTbvDuJkxOecco02FcXN6P0Lii0bok3JWrn4AZn0DzkmEj4J8BPpUluaoK83awOU5a9PxHU2LBEDcT0BFqvjnJL4UzkHGdhhgQYrDv1LeS31Cq12E/hKlr0qIO5NBwjvHB93Kp0CFBy/HZfriHk1ZYUHFtHq6d/o4VkIbhrs9ys1DRZbFzPE5p/p+FE6HH1Y9+QVmRcD9cW5ea6tJDA4hvjPVbHpIFya0sH4txiESfL/GrXsJLkf82SKwyWEIsZYFETc7ITl6FiwjWUDPgR0CY3Shk57Svd0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5195b659-ae2f-be1f-eb5a-bbe3e4b5d9fb@suse.com>
Date: Thu, 9 Jun 2022 14:16:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [XEN PATCH 1/4] build: xen/include: use if_changed
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220601165909.46588-1-anthony.perard@citrix.com>
 <20220601165909.46588-2-anthony.perard@citrix.com>
 <6EE2C13C-7218-4063-8C73-88695C6BF4CE@arm.com>
 <0d85ad23-a232-eac3-416f-fff4d5ec1a93@suse.com>
 <258D1BE1-8E77-4748-A64C-6F080B9C1539@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <258D1BE1-8E77-4748-A64C-6F080B9C1539@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0086.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4eff899b-6fb4-4463-f074-08da4a11e215
X-MS-TrafficTypeDiagnostic: AM0PR04MB6132:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB61326DDE08FB6AC258BE352BB3A79@AM0PR04MB6132.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GCcNzt6pmt7PHuU2rb0avcgJIt8LCOg2GDcaQqXxE87e+QMKEH9tYGK3Ffkavgr5Ligq/fbd5TlA7eSlsQXx9ZLmGlUHZW3Gpskufs7L1xtCcShtYYo8OXb3kN8yIDHDHe9cRid9ezexgZMkpqMPtikAQtmYpweo3QDwELiSn+EczcgzKgqPdwYxAIN1d+7hGJ/K5bmRfI/JtcbKF0sD4h9+Bnf7BCTHeifRSRDfrJZvUh90Pfae/KEiS0/EuHJUBXrNnUsRcwyHVN2EVmXeKaRu1Pii6NWCU00Bq2Gia9SV4fLPQzaFjzcbOlN+ZuW6/LLwhQ4ZBmBtfVGic7vdTeovhIRDB4GNXjHLFFHrAFzBvm58EAMSzn8fO5RfDLy0pyv/slWsK50cbW1E8w2yeqouxQMYL9JcEb7p9b5zCcwq1emQOlnUrdVlVhAdTObO075eMy+RXmbF0PbBp3i/deKxw4zRO4eQk/rlxKpNkHasxSJ1t9RescoUMG0ItsfPnjd0JUeuSfK+sQlu9c8z+4lhOyX3W4cH/SszDNOCMuBlq0dNC/BGty3JJH8CKXHyAMPOuKCmJAGmWDmX/4dgo/BeT4x0KwZtaiwVTzAkR5V83bjDFZOMCuZg6zvz1VMOHcyfUAhNO0ZqUCKO+G1+v6CMDLru991k0hB4tWfNsNniDv9Dcjo5df+wCQtmll2SKG0+0tpuSKoomKL/jI2cXKP6qnvZaQwcgticqkXg32rTqOgMrx1BMMkm5zJJRwgsfOZlYB3+c0rswV8X1uZBKMil2+kvFIkRR8Ah5BWx5CM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(54906003)(66946007)(66476007)(31686004)(6916009)(66556008)(6506007)(2616005)(26005)(36756003)(6512007)(83380400001)(186003)(53546011)(8676002)(31696002)(38100700002)(86362001)(6486002)(2906002)(316002)(508600001)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2d6NjJjU0dralgzbElmdDkvUkJnSDlYM2U3YkVYeUlwMUxGN3hVUkpIWXd0?=
 =?utf-8?B?KzFJWjJSSFk3S0pBNWlYUkJXd2lKNk0xempmVUFORWhwclVNT2hRSWs0Wnh3?=
 =?utf-8?B?elhRNlRzUGZxdk02eWFpUVl1ZmRnNjNobE84dWdaeU5vZkZwUmxnK0lxcjh6?=
 =?utf-8?B?OENCMU81VlU0V2RlQzladjBqYmEvS2tOdW4vb1I3a3RvYUloWitXMEVtSHlR?=
 =?utf-8?B?dm1jUHNwejhPakZjRWZlWnJ2MEthYjlFa0FDTkxzWWJSelRoa3pOV2Q2WWEv?=
 =?utf-8?B?a0oydCtOcU5RNXdId2dHNFNUcVhNWVdtTnpIVkZ3bGkrK3dtcVpzUTVWbUlI?=
 =?utf-8?B?MTh3c3J3aGxRQzl6eHRvMVBrbDdvUGFDVk1DQVNLTmRkbGpNS1VGZEFlRnVW?=
 =?utf-8?B?Yi9aQ1BFOWV4dWx4VlVIUHNGZ2RkUndjdlgvdE1LWUV4L2FCSXZTYmxsMmZB?=
 =?utf-8?B?bkh1TUpydEd6OVJaUWVZY245bDVuV3NCT3dmNUNPZ09oelpPa2NQKytleG9v?=
 =?utf-8?B?ZWJwVzR4ODV6bDc1cmF6VHJZSDZRZG1NZnJGY1V2WEt3YnUrWWNtcUFOREZT?=
 =?utf-8?B?MlVNdUJBeS9hU3Z1Y0RwZHFPNlV0VmdXQTAyU2FuZXpncDlsSXRGbHhTK0tB?=
 =?utf-8?B?aVVhS3FaZUhBL2tRcXJ1ai95RmFpMC9GTExzMHBTRTlwbkdqbUV5TkhzdWlw?=
 =?utf-8?B?ZXdpQ0syZ0dzdDhaMzErcEgwTTFPbmpGTlBuL0djbjFiQ0JHT2hJUUhpMG14?=
 =?utf-8?B?L2d3ZVlxK0k4cFdPc1RtOGpnTlVxcDZnNG85ZENWWjM4ODNxV2dsVTVjOUdn?=
 =?utf-8?B?NHI3STNhOC9vSnNJVkkrL3YwalBNT0Frc0o2aTV1TXBmM1I0UjNiQ3BKaDRu?=
 =?utf-8?B?MmlTaVllWE1MWUo3d1gzZmZ6ZzVNTDB4d051Nmhsd3dCMVBXaC85d3k5Wklx?=
 =?utf-8?B?MVZmTG5HQ3J4ZnVES1RFNDFrVS9kczZ5ZHg3VDQyYThjdHdhN3ZrQkIydFNP?=
 =?utf-8?B?TFFiVFZteG5veDFuMGFRV1NXNnRYNWRjemxhc3lydmVlRVU1blJ4SjgzTXRU?=
 =?utf-8?B?L1NDNjQzY2Z6RnVQcWpMRE95MlB1MmZOTzVOZmVibW9JN2dNNG1qQ3ZIamVM?=
 =?utf-8?B?NzJtN3ViVGkvUWlsVjRPUysyWkRIL09mOTVjMi9zdnozK0VGNzg4emN6Y2Yy?=
 =?utf-8?B?ZHhUUUNRbVRoQ2F0emtVM01wWHptQ0FESnkvTjdqeXdPYnNnY3RWYmRBdHU0?=
 =?utf-8?B?eWNpRzJPQ3J4QlZPN2hLaCtoOFoxVzVrZlBsL0JUUWsvVHlKekc3S3lNbE1N?=
 =?utf-8?B?eWZhc2RHSkpHaElpem1QWUZZbWdvOHFZSlpkcjZLWHRaS0VZVEU0OXJXcXIy?=
 =?utf-8?B?b3dRRGJYME45L21QQlA3V2hBdnJYSE54Q3RxQVNyU0JHanJhajZDeHlXK0Vw?=
 =?utf-8?B?Y25pU1JDbHhSZWVMWjZLTEtyWmpKSTRFWVRDZUxkOERuNHJPMFRSZ25VUTJi?=
 =?utf-8?B?bHNtaW9EUkdSdU9YVEdVTTgxcFBNVW11Wng4WUcvMml0cVR0ZnVFNzNpeFda?=
 =?utf-8?B?eVVuMVE0bXhIVkc1bU9CQUZEQmhPU0UrbW0rdlB3RGlPL1k5bzIxeFd4ZHpx?=
 =?utf-8?B?SkRmbEZkT3R4cjFTTFFpZUNHWjRNSVZqWFNjM01mLzBtZ3B3SUVFdjVJN244?=
 =?utf-8?B?QlZoNU5adjRZazFseFZ0NGhsa3crbE1mNXRsOXpWVlJBdkJORHd5WmRvS0ht?=
 =?utf-8?B?SGoya2ZsaTFkbW9HKzFhSk10NXJJQmVybjRkMkRkZyttSUdSTTlVQnJ0TUNP?=
 =?utf-8?B?UGk3R3I5aEJONDl2OFh6d1Z1eWdFTXZ1aVpvZUtvTVh1eGZ3U2dIR1hLcDM1?=
 =?utf-8?B?NkZ0MENVVjVJUkRLbGtTZGMydXQ4dXBaU0tLZnRzNUE1TG05cE0wbGpNQzRq?=
 =?utf-8?B?c3lnbzNMb0dGUkdvajVBcGZ0a2lLV3U3YldPalliMWl6dzZZWTJZdC91azNV?=
 =?utf-8?B?bDJKYW03OUFEeEVaOWlRS0EvRVFUS3VRQlVsSHZQVzlmOCtrNXg1N1htVnZJ?=
 =?utf-8?B?SGJjUUQ4bWwzQzRQMW5BUEl0WC9hYWVDVkF5TXlyQnRtTVFNSTdZMEVtRnJq?=
 =?utf-8?B?akg1YitxYXlxbGt2RUFCZlRGZisxSDFTTURMelhTKzRvVkVqcFBwV1ZxY0h6?=
 =?utf-8?B?aXlUSzArV2p5cWVVT1NIYTNYdytjOC9TSlpHcm5odjVubXpEZEpldHVqY3RX?=
 =?utf-8?B?S3lGT2VZeTRjYWVqWkZxcTJHbUFhazZCZUVtN0RWWGQraDl3QXhtZGVSZGxi?=
 =?utf-8?B?ck1BRVNqcXl0bGdhY2dYbzhKWDVld0JHZHpkMzlIcU9YcnhUTGVuZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eff899b-6fb4-4463-f074-08da4a11e215
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 12:16:29.5584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3O+zRMgmfXiQcwlQFqSXzIeMBQi3jG18M07tPSZL31bF+gdT6oqHmkgoHEJ8vY/8pb4A9zh2bA+8ch+inFYslw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6132

On 09.06.2022 13:51, Bertrand Marquis wrote:
>> On 9 Jun 2022, at 11:26, Jan Beulich <jbeulich@suse.com> wrote:
>> On 09.06.2022 12:16, Bertrand Marquis wrote:
>>>> On 1 Jun 2022, at 17:59, Anthony PERARD <anthony.perard@citrix.com> wr=
ote:
>>>>
>>>> Use "define" for the headers*_chk commands as otherwise the "#"
>>>> is interpreted as a comment and make can't find the end of
>>>> $(foreach,).
>>>>
>>>> Adding several .PRECIOUS as without them `make` deletes the
>>>> intermediate targets. This is an issue because the macro $(if_changed,=
)
>>>> check if the target exist in order to decide whether to recreate the
>>>> target.
>>>>
>>>> Removing the call to `mkdir` from the commands. Those aren't needed
>>>> anymore because a rune in Rules.mk creates the directory for each
>>>> $(targets).
>>>>
>>>> Remove "export PYTHON" as it is already exported.
>>>
>>> With this change, compiling for x86 is now ending up in:
>>> CHK     include/headers99.chk
>>> make[9]: execvp: /bin/sh: Argument list too long
>>> make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127
>>>
>>> Not quite sure yet why but I wanted to signal it early as other might b=
e impacted.
>>>
>>> Arm and arm64 builds are not impacted.
>>
>> Hmm, that patch has passed the smoke push gate already, so there likely =
is
>> more to it than there being an unconditional issue. I did build-test thi=
s
>> before pushing, and I've just re-tested on a 2nd system without seeing a=
n
>> issue.
>=20
> I have the problem only when building using Yocto, I did a normal build a=
nd the
> issue is not coming.
>=20
> Doing a verbose compilation I have this (sorry for the long lines):
>=20
>  for i in include/public/vcpu.h include/public/errno.h include/public/kex=
ec.h include/public/argo.h include/public/xen.h include/public/nmi.h includ=
e/public/xencomm.h include/public/xenoprof.h include/public/device_tree_def=
s.h include/public/version.h include/public/memory.h include/public/feature=
s.h include/public/sched.h include/public/xen-compat.h include/public/callb=
ack.h include/public/vm_event.h include/public/grant_table.h include/public=
/physdev.h include/public/tmem.h include/public/hypfs.h include/public/plat=
form.h include/public/pmu.h include/public/elfnote.h include/public/trace.h=
 include/public/event_channel.h include/public/io/vscsiif.h include/public/=
io/kbdif.h include/public/io/protocols.h include/public/io/ring.h include/p=
ublic/io/displif.h include/public/io/fsif.h include/public/io/blkif.h inclu=
de/public/io/console.h include/public/io/sndif.h include/public/io/fbif.h i=
nclude/public/io/libxenvchan.h include/public/io/netif.h include/public/io/=
usbif.h include/public/io/pciif.h include/public/io/tpmif.h include/public/=
io/xs_wire.h include/public/io/xenbus.h include/public/io/cameraif.h includ=
e/public/hvm/pvdrivers.h include/public/hvm/e820.h include/public/hvm/hvm_x=
s_strings.h include/public/hvm/dm_op.h include/public/hvm/ioreq.h include/p=
ublic/hvm/hvm_info_table.h include/public/hvm/hvm_vcpu.h include/public/hvm=
/hvm_op.h include/public/hvm/params.h; do x86_64-poky-linux-gcc  --sysroot=
=3D/home/bermar01/Development/xen-dev/build/profile-qemu-x86_64.prj/tmp/wor=
k/core2-64-poky-linux/xen/4.17+git1-r0/recipe-sysroot  -x c -ansi -Wall -We=
rror -include stdint.h -S -o /dev/null $i || exit 1; echo $i; done >include=
/headers.chk.new; mv include/headers.chk.new include/headers.chk
> |       rm -f include/headers99.chk.new;  echo "#include "\"include/publi=
c/io/9pfs.h\" | x86_64-poky-linux-gcc  --sysroot=3D/home/bermar01/Developme=
nt/xen-dev/build/profile-qemu-x86_64.prj/tmp/work/core2-64-poky-linux/xen/4=
.17+git1-r0/recipe-sysroot  -x c -std=3Dc99 -Wall -Werror -include stdint.h=
  -include string.h -S -o /dev/null - || exit $?; echo include/public/io/9p=
fs.h >> include/headers99.chk.new;  echo "#include "\"include/public/io/pvc=
alls.h\" | x86_64-poky-linux-gcc  --sysroot=3D/home/bermar01/Development/xe=
n-dev/build/profile-qemu-x86_64.prj/tmp/work/core2-64-poky-linux/xen/4.17+g=
it1-r0/recipe-sysroot  -x c -std=3Dc99 -Wall -Werror -include stdint.h  -in=
clude string.h -S -o /dev/null - || exit $?; echo include/public/io/pvcalls=
.h >> include/headers99.chk.new; mv include/headers99.chk.new include/heade=
rs99.chk
> | make[9]: execvp: /bin/sh: Argument list too long
> | make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127
> | make[9]: *** Waiting for unfinished jobs....
>=20
> So the command passed to the sub shell by make is quite long.
>=20
> No idea why this comes out only when building in Yocto but I will dig a b=
it.

Maybe Yocto has an unusually low limit on command arguments' total size?
The whole thing is just over 2500 chars, which doesn't look to be unusually
long for Unix-like environments.

Jan

