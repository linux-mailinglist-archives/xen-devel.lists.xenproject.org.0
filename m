Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDAB3FD9D2
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 14:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176359.320923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLPei-00073p-UD; Wed, 01 Sep 2021 12:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176359.320923; Wed, 01 Sep 2021 12:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLPei-00071l-Qj; Wed, 01 Sep 2021 12:47:52 +0000
Received: by outflank-mailman (input) for mailman id 176359;
 Wed, 01 Sep 2021 12:47:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqR/=NX=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mLPeh-00071f-Cq
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 12:47:51 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d08a981e-0b22-11ec-add6-12813bfff9fa;
 Wed, 01 Sep 2021 12:47:50 +0000 (UTC)
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
X-Inumbo-ID: d08a981e-0b22-11ec-add6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630500470;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=h6mJzdTcFw3IRJ6Tvbd87qhOMqz7nqvNglic+QwxbPI=;
  b=HhFzni5QH6luLYn1LAsYA3fNdt0OUyoJbJTThbazXXe3kHMhCcVd8HOU
   kSQrQ7iKSZC691bAXz+foqvG1F136S3rGvciTB1SSXSPk5e1lURmzfU2S
   dvd98sLQSeNhUTT7QivUBRh94j8qJC2v/GD85as5kgmJ2t1odseqpJtG9
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yt6rC4h0IVg9WGAgQqBw+QI6Vyb4RHsSc6ZlVB+K0T/55JP6s6qj35S9ggo30I++PdE4fBkTFr
 UD2cYkH3DbnCECHRq9hRLxSqhqw+WvMyxBId3EmoXf/QlWSfIQkbJJtt2CefiqLayQ01zWdrDS
 zFst2jTkHAdQslKjesrQKNk2uN2UOdPy9OTTpBTkWHGX5BKcVDD8p5dlO5nr6X5mi/6OZ4Hpzb
 shOmxOSp/r0AIyJffE4nRU/dzjSRC59fxXjoSzZliKPubAs1ivOp3/cjr3Ggb0M+vIzTDqgg1r
 7sHXvMP44Xpog+lgvMoVYiW3
X-SBRS: 5.1
X-MesageID: 52179159
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:O+qdP6yIvAOamiwdUOZ5KrPxouskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjkfZquz+8L3WB3B8bfYOCGghrUEGgG1+XfKlLbalXDH4JmpM
 Bdmu1FeafN5DtB/LbHCWuDYq8dKbC8mcjC74eurAYecegpUdAF0+4QMHfrLqQcfnghOXNWLu
 v/2iMKnUvaRZxBBf7LeEXtEtKz6OHjpdbDW1orFhQn4A6BgXeB76P7KQGR2lM7XylUybkv3G
 DZm0ihj5/T8s2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHJhhyzbIpsdrWetHQeof2p6nwtjN
 7Qyi1Qcfhb2jf0RCWYsBHt0w7v3HIH7GLj80aRhT/ZrcnwVFsBeoB8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVjlx/3DE40YKoKo2tThyQIEeYLheocg050VOCqoNGyr89cQODP
 RuNsfB//xbGGnqLEwxhlMfhOBEY05DWStvGiM5y4qoOnlt7TBEJnIjtYkidixqzuNld3EsjN
 60QZiBl9l1P4QrhOxGdb88qWbeMB26ffv2ChPnHb3QLtBOB5v8ke+D3FwL3pDcRHUp9up+pH
 2TaiIViYYNE3ieQPFmmqc7qSzwfA==
X-IronPort-AV: E=Sophos;i="5.84,369,1620705600"; 
   d="scan'208";a="52179159"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VehwfQI3Yr0WBQFibVvQEaG1LPfYEzpwEhoCcelziCNpSFcZGwoKLwYteeQkacAKGDWgtfOK5zV9bLWt2hmH4pYbuYcAVycf0a3j2EmD0OuBzrORMcUZkgx/pISnC2J+UwR8FUnB0AuGMNU7T6Srknurfflt6SX3E/6ZXE9teW7eZAVI8h4G9jO4RJHZeYwtUAlDHf5YDgoXJIRFC1D52CMJ8lkHc0w5GjD4ftcy9k0yO10w+ySnYaVnVN+ZUjAIXjh5gigw0q0tcZH2TeNpmVlvdy9rJ+jUoGYDav2nJZ5F+7Y/jthRBBUXsjrBpPmJo+cT2r8hEbc6bIAQODioQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjDlw24xjL9N6LfcvdiORpfx0u28EjiV6lJoNjLfxq8=;
 b=W6o4kmppL91QG6I9Dz2uK6zVgiKL6PoXwcTmI8ViPCXT8oqW7ZoRwbIszzKSyCJj3o5ahfZCYDW+KkogUb9yWBRl1MXl0U6LVDQ4WonTHpz0GELWlCZgW30Pkk4A09ZhYZIflrLCgt2VTT7eSUfUGqJY0Z82qGqKS1KOctzpFPkhRAU9t/M/TUtPzIJRKTTE5qpNtkNgDmS7iD4RZKvWKaaxEl/lnBCV3vET1yKdWoo0aPqelgfuLKcmF29IETbYwEiAcbjL3k5t1yLaB5lMuekqc6RGGTOg4AH1mDBLrCoTUcr/SM55v2LKxlnwwZK3+Y9YbkqyWwpoKrl1rbkflw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjDlw24xjL9N6LfcvdiORpfx0u28EjiV6lJoNjLfxq8=;
 b=d2uV98ZJ6Z8VgmoEuRoyExqVWaap36SQRaTIjQ9tF0Gkrob6LU4Hu5wQEijsKAMpyyYUh6C9D8SGe9I64bXxNl+JAhz9O1pjUHYCNOPLCvOTyYRqB8Ej6ofng8kUryW3ldVOMp/MjukUhZjFQNtMl7htzT+IYPwJfMV4kvUwIEc=
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <93ecc397-1293-69b1-e70d-3c5f9317229a@suse.com>
 <ad1e33b5-d729-2680-7f9f-aa875c2d9cfa@citrix.com>
 <f684e203-9967-8653-d59f-ad11f5070aef@suse.com>
 <7f56c625-eee6-31c4-2d6f-bd7334867d83@citrix.com>
 <5d69d4c0-7a04-c3da-f971-616363c6d63d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] x86/P2M: relax guarding of MMIO entries
Message-ID: <62cb78c9-f4fd-76e7-225d-bc575f10850f@citrix.com>
Date: Wed, 1 Sep 2021 13:47:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <5d69d4c0-7a04-c3da-f971-616363c6d63d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0357.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5405d40e-c282-4aea-83a2-08d96d46b2f6
X-MS-TrafficTypeDiagnostic: BY5PR03MB4997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB4997C5380E8A31D76A8BC46EBACD9@BY5PR03MB4997.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X8wG6yt5GYJNe95xxdetZ5DX+ZM7eoFiskJ9wiN7pW9/XFXmy9OxE6Uv3SjDET2d3AgfzzrjFzvsPpu7scxilLctrBjixUbclWOxlb9NKnXuOfRrMmZncSTewoa1h8xZadXhTjzOqvs/q21x/QdFUnpstanfV4aRhtIDHX0IYS1tn+hErZMY4s+UEFOdTJ9qlI68TJWKcwV/dWHFIXZpQZrmBkxSvIswK2FrF1k+IYjGgVkgyCCpy8VOMIMRTy+3wL/MeatLgQSPftlxZ9rNaTIzHB8qcA1DixE6u+OHXgei6TTyPQ671dKzNNZ2lLKEU4sxCmI5g01oGSDqJiyrwLtUhX9msdT+eBP1hmUvhYrgBNjRGgsGkPrNvjjoKvKOWdg4GsEyuajifesNcZIIafR09lB9dUoWKdA4KOTGuSwC4utqz8hypczeotCj47U1xsr2M3AuhGCn8nPgHPHuZpxc3mD3+nQAJuc2btJ1qAtlahCjgk7l4pTzt2t49st2htuj4GfWYW8mZ+u0eSc7Jbn8Pnya+TITdmNVTJm1ub3lqR4dQUU8mBuN+Na2LhW5ddgousfyyJZoQ7Qv24XzPsBLL3OQD8oD1IaO7QWR19Mqrrx+DC4y5gSlW94QfD4tz2PN38gSD8OOT0BirhA2kJJDwkjiQZuu+MbPYDQwKmPDoOqNdysOHvTRLUodaEVh5XcwfrNJCDa4W1tGmJurhaAs6PQ2D4/rt/wnREwmYko=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(956004)(86362001)(66476007)(66556008)(2616005)(16576012)(31696002)(66946007)(26005)(5660300002)(54906003)(36756003)(2906002)(478600001)(6666004)(316002)(8676002)(186003)(55236004)(4326008)(31686004)(53546011)(6486002)(6916009)(38100700002)(83380400001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkxJbGNGUUFYYzcyTUZnSDNGb092WXNva3pYR1FlYXo4RVQ4V3dKSVJRaklv?=
 =?utf-8?B?VDJrVmlsOEo0WDhVamYzNXAwOFoxUmY4TytWdlpGQzEvYkIvUnZCaHBWeXRi?=
 =?utf-8?B?aFdLT3o1ck5yWjBDeE1xZEZ5WU5iN2sxcGVPVzNHZmpDZGFLQUpFMkhQQ2hx?=
 =?utf-8?B?OUNKTWNnK2RPdzV2VDJkc2piQitvNXBOdWFKTWtaSzdidll2VkgyZXFyZVQx?=
 =?utf-8?B?VkVXZ1RXTHpqdS9ZL2E5MTdiWndkRkJaRlBadm1ITGtsbzhVQXBQd3pCcGRP?=
 =?utf-8?B?SjcxcFVGUHd2am9Sek5TZmU3M3NBM3VKZ3lUd05ONy9IUkdWVlV4dlFoZnQr?=
 =?utf-8?B?aWJLTFdtK0JENWR6VG8rdGJmRHQ1ZkxWcFlEdzFPSC9FYjdoMENXMk9uZFl2?=
 =?utf-8?B?akppQ2VVYWYzdUVndDZ3elBlSkZpOFhoSUE0Y25SbFVtUEUvVDd6R0NzUDhV?=
 =?utf-8?B?d3haUGJ0QkRob2RYaVNqQmhuYXM2ZkRXbktUbmt0Ry9PcEgwem9ZUTlqRGNu?=
 =?utf-8?B?WlB0a3dpelkvclRVMTlsSUtNOUhUYzg0ZGRDNzRsUGdPSnIwMkdNMVR4VGdq?=
 =?utf-8?B?TjJiRGlpRytzV2RmVTFWdVFJU0FXYmtWUUs2bTdtbGF3QVBSU1JDTGVJdVNq?=
 =?utf-8?B?R2ZSYXM3VVE2QjNkU2lTNFVyZy8yUG9ONlZpaVNxb3JLaU1rY0NxZXNzb09j?=
 =?utf-8?B?eCs0TTFiUzRKSWh4N09vNTJTVmRUUU9FNS9HNlNoK2wzamNQNWF4N0dydm13?=
 =?utf-8?B?ajE0K0o4SzBxRWVFRFhCY2xsd0xiVElaWVF0VlRIY0RPektLaHVoV09VWkJO?=
 =?utf-8?B?WFJ1eUFQSzRaZG9ZZzVZbFB1QllFNUpPMlgwcXRvUWE4TGdWMkRoejFpVHlr?=
 =?utf-8?B?QlB2cjZwdnJkbHlPMW0zMWxibnBRc0xhdnU1YXo4VFVWMVNGL1E5eTBuOHY4?=
 =?utf-8?B?WC9ZOFNsbkJxM2lld2MxSHJudEZ4cGRmcGVrOTYxNjBwUzBVaUFLMEh4cnR4?=
 =?utf-8?B?RW5RTDZ3OWVBMlBQNkpyaHlnS1UyK29pUUlGNnNrNThIUUhRYk5TdUpDUFc5?=
 =?utf-8?B?YWV5VW1GeU9MaWo2b3VtM3FKcWxjZ29zSFpESG9JejZ5cGUxZlQ3U2JsM2tW?=
 =?utf-8?B?eVdOZzNRM1JINDdjd3l3cEJMYzI4b3plcmJnYXpvQ0hKRUwzL1JmbjUwcVBE?=
 =?utf-8?B?WkowRHNRY0lCNnVNeUVMR3RPV3QxeldWakxwYW11ZC9lbWFhTGRPazlFS0R0?=
 =?utf-8?B?L3llZ3I4MGhENjhkVWRFOUlZK3N5MjZ0VVhRb0c1TXE2dmpvdTJPWStLcFdH?=
 =?utf-8?B?RTJKOHRHYTZSOVBtK0w5cVhsY2x0dnJWSmR3QUFEcFBZcExObWpMRkpsS0dD?=
 =?utf-8?B?UW1zUTJadzVrcUROOWFlWE1LTElqRy84MjZiVi9udzM4eHAyamVoMXdRVDBz?=
 =?utf-8?B?SklCcGowMnBLWVZ1TkcvNW5qejNENUEzTWFSRHRsZzhZblJ1QTBuK216cm5q?=
 =?utf-8?B?TTNiR1NRR1gzQ2k2VlRocGc0OUVEaGhGSUorSVQ5M2pITU9wUm5mTkFsdHdj?=
 =?utf-8?B?eXhQdys0cVRVMEdtdlMrdEtPemY5bE1iZ0phS3VadElERXhJcGNqT2RwQ1Rj?=
 =?utf-8?B?eGU3YW12blNHSXNDVHVacUZHNm54NkdDUFR0WUQzZTBHQU5VcWQ2SWxMOWtW?=
 =?utf-8?B?ekgwOUorT1R2MDdKMGsydzlzempPZmQ2NmYxb3plNE9UUmJYMEdiZVJJTjZj?=
 =?utf-8?Q?92sogwZlfbxijYlchVOFquK31v7toqtdoKHlx0G?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5405d40e-c282-4aea-83a2-08d96d46b2f6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 12:47:46.8553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CF3Rl+KfsU6yvVA4Spcl/1DnmOGEn9Fw3gEwZWwv0KhXHL2xnfYG9N7ddWfRcZapweD8K3eO23tlwMUr6EUoJDPhEFMeeaB1pO+jvM3gwDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4997
X-OriginatorOrg: citrix.com

On 31/08/2021 16:38, Jan Beulich wrote:
> On 31.08.2021 17:25, Andrew Cooper wrote:
>> On 31/08/2021 14:26, Jan Beulich wrote:
>>> On 31.08.2021 15:16, Andrew Cooper wrote:
>>>> On 30/08/2021 14:02, Jan Beulich wrote:
>>>>> Further permit "access" to differ in the "executable" attribute. Whil=
e
>>>>> ideally only ROM regions would get mapped with X set, getting there i=
s
>>>>> quite a bit of work. Therefore, as a temporary measure, permit X to
>>>>> vary. For Dom0 the more permissive of the types will be used, while f=
or
>>>>> DomU it'll be the more restrictive one.
>>>> Split behaviour between dom0 and domU based on types alone cannot
>>>> possibly be correct.
>>> True, but what do you do.
>>>
>>>> DomU's need to execute ROMs too, and this looks like will malfunction =
if
>>>> a ROM ends up in the region that HVMLoader relocated RAM from.
>>>>
>>>> As this is a temporary bodge emergency bugfix, don't try to be clever =
-
>>>> just take the latest access.
>>> And how do we know that that's what is going to work?
>> Because it's the pre-existing behaviour.
> Valid point. But for the DomU case there simply has not been any
> pre-existing behavior. Hence my desire to be restrictive initially
> there.

But you're conflating a feature (under question anyway, because I gave
you an example where I expect this will collide in a regular domU
already), with an emergency bugfix to unbreak staging caused by an
unexpected interaction in a security hotfix.

At an absolute minimum, this patch needs splitting in two to separate
the bugfix from the proposed feature.

>>>  We should
>>> strictly accumulate for Dom0. And what we do for DomU is moot for
>>> the moment, until PCI passthrough becomes a thing for PVH. Hence
>>> I've opted to be restrictive there - I'd rather see things break
>>> (and getting adjusted) when this future work actually gets carried
>>> out, than leave things permissive for no-one to notice that it's
>>> too permissive, leading to an XSA.
>> Restricting execute permissions is something unique to virt.=C2=A0 It do=
esn't
>> exist in a non-virtualised system, as I and D side reads are
>> indistinguishable outside of the core.
>>
>> Furthermore, it is inexpressible on some systems/configurations.
>>
>> Introspection is the only technology which should be restricting execute
>> permissions in the p2m, and only when it takes responsibility for
>> dealing with the fallout.
> IOW are you saying that the calls to set_identity_p2m_entry()
> (pre-dating XSA-378) were wrong to use p2m_access_rw?

Yes.

>  Because that's
> what's getting the way here.

On a real machine, you really can write some executable code into an
E820 reserved region and jump to it.=C2=A0 You can also execute code from
real BARs is you happen to know that they are prefetchable (or you're a
glutton for UC reads...)

And there is the WPBT ACPI table which exists specifically to let
firmware inject drivers/applications into a windows environment, and may
come out of the SPI ROM in the first place.


Is it sensible to execute an E820 reserved region, or unmarked BAR?=C2=A0
Probably not.

Should it work, because that's how real hardware behaves?=C2=A0 Absolutely.

Any restrictions beyond that want handling by some kind of introspection
agent which has a policy of what to do with legal-but-dodgy-looking actions=
.

> Plus, as a side note, then we don't even have e.g. IOMMUF_executable.

Just as I vs D side reads are indistinguishable outside of the CPU core,
the same is in principle true for PCI devices which execute code (e.g.
GPU shaders).=C2=A0 Reads on the bus are just reads.

That said, the latest SIOV spec does appear to include the ER (Execution
Request) bit for use with PASSID/Shared-Virtual-Memory, which interacts
with the EPT-X/ia32-NX bits, and goes as far as having SMEP/SMAP bits in
the IOMMU configuration.=C2=A0 I'm not sure if this is in released hardware
yet, but it's clearly on the horizon.=C2=A0 I can't spot any execute relate=
d
controls in the AMD IOMMU spec, although it does have user/supervisor
for PASSID/SVM.

~Andrew


