Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2F8402089
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 21:55:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180255.326833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNKgj-0008TE-A2; Mon, 06 Sep 2021 19:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180255.326833; Mon, 06 Sep 2021 19:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNKgj-0008Q7-6o; Mon, 06 Sep 2021 19:53:53 +0000
Received: by outflank-mailman (input) for mailman id 180255;
 Mon, 06 Sep 2021 19:53:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNKgi-0008Q1-1G
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 19:53:52 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27b88fce-0f4c-11ec-b0b8-12813bfff9fa;
 Mon, 06 Sep 2021 19:53:50 +0000 (UTC)
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
X-Inumbo-ID: 27b88fce-0f4c-11ec-b0b8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630958030;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bwrJ/82EidgVnL+FTnzOnWMM8fNlJ/yK8puMT+f780s=;
  b=KrXajhqxGyp0g8XIpCYkNwcTJi6ju0oK7+cXZv8WebSwOI2D42ewF6RW
   jhz1FIy6hGJ31PBA+Z25QHd+L30CAU+cBZzn09obS3wBqsnlpa1Y+WzcW
   904UzDI6QY1r5cAnbvIO78BKUOQibvxWzuTgakbENuQXIaAPp3q+OGfgb
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: IOkwJFIQ3Kn6ZeoXcmOr5/oyU+86gutetzvZrJ3XG7s20uOYXKsj8TpuI9E9+MtUzwF8UreioB
 ZeViExfhPgtal+nt+SAvgEjEr4vgVAKT+cGVLK2l3WE91a38fCP6GWyo+Vj6u+pXJhYxbBrxjl
 iOBsIAVXJANghcWmTZiSMXVCaBHVIodRGmBV9FjC6XFGbjhtNl5lRIOHMmhvpAqDbgJ7Ji+L3F
 Id1bvtuBhGUTdnqOxYDugAAdeAcZu8KcvlE33enX8kK2fg1I442PRMjvOttYHv+WrxRMF2tUbV
 /2d8jgPw3njOIm8R2OKVbXU8
X-SBRS: 5.1
X-MesageID: 52509495
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:kKuF+61PuK2X2RSyQlVg2gqjBTtyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJU80hqQFn7X5Wo3SIzUO2VHYUL2KiLGC/9SOIVyEygcw79
 YHT0E6MqyMMbEYt7eI3ODbKadZ/DDvysnB7o2yvhQdL3AZV0gj1XYfNu/yKDwHeOAsP+tBKH
 Pz3Lsjm9PtQwVsUiztbUN1LtQr6ue7267OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3dqza05+W
 bIvgTl7uH72svLiyP05iv21dB7idHhwtxMCIiljdUUECzljkKNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4DpU/5TyWQm1/AygPg2DEh5zvLzkKZu2LqpYjDSDczG6N69MhkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l2KvyEBS09I7vjh6a88zebVRpYsQ8Ad+C5EbBh/374ghDa
 1HENzc3vBLalmXBkqp/VWH+ObcGkjbIy32BXTr4qeuon5rdTFCvgslLfUk7zI9HMlXcegc2w
 zGWp4Y342mAPVmNZ6UqY86ML2K41f2MGbx2VSpUBza/ZE8SgfwQqHMkcIIDcGRCdE1JcgJ6d
 j8uG0xjx96R6upM7zU4KF2
X-IronPort-AV: E=Sophos;i="5.85,273,1624334400"; 
   d="scan'208";a="52509495"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzjeqbfEaMkqdKFIf6Z7afvOHn8asoEZvQbT6Rck0lmMWwji3P1hHQhstQDSyuJ6gk+mWx9GyxsPKWGFh1cy8t9rqjSRDCN4KX+E77Yvy9nBb43mZnDEZ6MHSEOwhG2OkdZZth6NO+B0Ml0NVVZjs2IaN7/35yZHYrVSLyeLM3GvKoQJdqm+rfF4SvGW4a94UrUt6SsgES/tuxBAVr6L8JR0fpUwDOyZJ+6Pqe05wu+Xd65z2Iqsxpf7kdn7W1AhsU6tUdR+2Gknym/gLnig6B4M4dkj3d7Cvxl74WOG9z+KS84DY+qTHbtckzxVcXyQlWCI2ibmWiKxivbcfPE06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=JUF5ZQ9qHhiOdd1nZnSVwMywJawM174/ekfRo7ZYZ6M=;
 b=F+ngGyUtzO8vsg4gG2Fd07aR9CD/S0N+tGkS0MBeuHEIVagmSm75qcFAkprVXJkiryOK0eAByo94Otc1gaqXAtvr9WIT7fM4VNFtXOhrouxYYhk0BdF6q3iVpSWXoLOAyhdfruQfT9m84eS94S+p1ct1A+r72ziJNzrSenIJ5Na9FmEOcu5sCdj8gI4BSWC+nJRqSxwVXZJFSFdyzlSsUDtgcDnhCT9N1OQxQq5i3kxmT67ts+pxUkCh7P2aeZah2z7KYt7vNleQ2Z3FYgG2fEjVwDjPoNgeg4gnopD19kpm6OKqdGbIqMhojFLKdceonSa0URrNfRcUcAMv+XSsbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUF5ZQ9qHhiOdd1nZnSVwMywJawM174/ekfRo7ZYZ6M=;
 b=WkJtN2bBrw7IT0pRt35GuXahFfBbABdQ3dPOuQHj4B4Bua/yBp6P4aMD+/vXur3YqN56tsnN8bNAapiAKuf610y6zdX2H/NGOQW3D9EGzB26hS1/EUkx1INe88Vd1nVfuDqKFaXuZripmoSovovvFQmYZPG80HRiFj/ux9OhZBY=
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
 <62cb78c9-f4fd-76e7-225d-bc575f10850f@citrix.com>
 <818cc08e-8372-35c4-935f-86a87cceec75@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] x86/P2M: relax guarding of MMIO entries
Message-ID: <bf091ebc-95e7-b357-9f84-4ec3a6346fac@citrix.com>
Date: Mon, 6 Sep 2021 20:53:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <818cc08e-8372-35c4-935f-86a87cceec75@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0042.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::30)
 To BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c14ef7f8-3948-48fc-e7e9-08d971700853
X-MS-TrafficTypeDiagnostic: BYAPR03MB4120:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB41209150C37D0F0F3D882C5EBAD29@BYAPR03MB4120.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eBVRbVfcZPgqWF2GZ6GZTrfb2LM9BcDMwWqtR6fjSXyOnHyWaBoCzwAoIDwyY9UY6L2sWPfPkHjpmNpFZnpuUjCibCI/eVfkgnn7q5+lG3uGIK5SEgZXUeKkKhRBtP76ikCAxt9nePVoMsSftJV0xWOhgg2NoPlRWcbI5mjjTAQscQa5A7tkltqT1YEN1G5W9xXUVCAbkxjFzsE1N3v4LJuWLfwOAsLQduv5s23r5qWEmLeM0YUmE2hseSqRiRao12iqB/9czxxuL7AJnfV43Pd6yCM3KSBi0oY/2xCa6ID+qb3gj/Zr3cQwlSzmF8Xj5lP5UpMsRpv7RML3y/sPDNnb3a7HEHiQ4rO9+xvES1eVnZefNpXTqHuQ/6EAjQDinlbgicptONFA37QSytCQMn49WNa11aeQKvIOTi7hHh4Ji50nknmiOAVdYMm+Cvu8r9eux9+8AexNRy5aLrZQZVd/CZ+hHHQPay2V2kHqliNQDgj9YGJiArwZEuDLyMk8gFS5jllWV2LsIphm/zd+Mnfa/cwXviIHtrsVVKps9v7hj8mCoFlFiAtMTv+AD65eV1opkZsMhcLseNv/K2MTtlYREaDNGdy2M4x1rF0UcyicWe0glXF2rMBw4KqeNJk/ts+vIgLUmZsja5C2lTguTmv1CfIuA4bztqGRdlF6fk2On9EebPQHzcpTtVUo/YHGAJT7nEt8Q96gFzWTFxGk4C0BnfqF8jq4Tm6yZMclKdhNMiwDh6ZtnlXif+Zf5Pjl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(6666004)(55236004)(2616005)(16576012)(38100700002)(478600001)(26005)(6916009)(2906002)(6486002)(83380400001)(36756003)(5660300002)(86362001)(31686004)(53546011)(66556008)(66476007)(66946007)(31696002)(4326008)(8936002)(186003)(316002)(956004)(8676002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGFWdDhOZG8rVHpvYXFxcVlTeXMxL1QxTGFJS0RGQWVIbW4vUE5COTE2NXFQ?=
 =?utf-8?B?Wkg3aGsrWkJvclNrRERkU1VkamhrRTIyR09oQ0M3N01TaTh0NEdKTmJpeGZ2?=
 =?utf-8?B?dTJsMVdNMDhuaXU2V0Y5Y2pUdmkxbWllR3JhM0c0aGZhN01QbHRzYytmY0RK?=
 =?utf-8?B?WlNmbFA3SklZV2MvbVo2b3dQbXcvQ0liREt5MXNHVUdyNlhJbnBhcXpwSHJS?=
 =?utf-8?B?TnV1YU1mMXovQmwvZVd4elk2eHFIbVFjRGtBRitidmNHRFp0YlVoZE85WDVK?=
 =?utf-8?B?NXVQVzFtN3lYc1dqVjhJSTk1SWMzakRwUEFvazVZaXE4R3psc0J3QWRRSEMy?=
 =?utf-8?B?WmxUVWYwWi9oUXI2K04zbG9VU1dRUWdsUWxlUEhwU0V0M1pIa1VJbDFGc1h2?=
 =?utf-8?B?Y01YTmExV3NKemlsVVVUQ2ZVc01qQW4zNWdkS3dFZ0Q3K0grdDJ0WS9LNFFz?=
 =?utf-8?B?bVJJTnVZakc1ZEtCMUE5ZmZ0WHU3N0pKVVcxWU9aZkd6ZXFMMHpwR3VRNGpB?=
 =?utf-8?B?YjlGblFvajhzcmdZL0tQREx4Qm9tbnpGeW9XRm85YUt3U3hDakVST3Nqc2Vh?=
 =?utf-8?B?eWFvdm9JbloxZXo4cjdWTVdqYm5ORlUzd1A3anN6TFdHSTR2a1R4akFRZkZ0?=
 =?utf-8?B?d1k3TUpOTFdTTktrZ1RnbWwxZnZxM1FCZkZJWWR3MlJDNXN0NUZWMkx0T2ZE?=
 =?utf-8?B?L1I4L1hiOGN5dnZLajlmZDlnMWpDSDNEQnVjU0dvK2w2TFZUNFllNDdjVnV6?=
 =?utf-8?B?T0J6RVIxMXRQb3Nvd0RPU1hvSzI3ZE9rVlhiU1JrSkhCcmREN2xRRWlYQ1Nv?=
 =?utf-8?B?MjIxV0JqcEgrdi84NjFiT25tL0UrU0tWRVkyUVhVNFFvakJxdTJzSDMwMkFE?=
 =?utf-8?B?NnpicW9xTnplSHVYVXFHcEswdmI5dmdlcFBDQi9kSGRwSkNlLzVrSERiV1F3?=
 =?utf-8?B?NUtsZmpTdjFtZFYyeU1hcG81MG5WVGlvMXlkcHAxQXlEZDN4Z2FNZG9OT08x?=
 =?utf-8?B?NEQrK1JCQ045bUY0azlpUUFPcUtSa2pFNkpxM1lkVHE0S2R2MEVmdEZNaXZS?=
 =?utf-8?B?OFVmQUxWNklwbzZ6V0NVSUQzaWdsclpLK0NRdXZ5MzlKbWRHNEVEb3gzUXpM?=
 =?utf-8?B?R3BqNUZvQlpUUkxWaHZtRU44ZjFTenUrMDh0YzlXNFcrQitxVEJ1eGIweWRm?=
 =?utf-8?B?UmpUaDVuVXI4eWcwcENiUXFHM0hwRjk0dUlJQW5UZ2JQbjRDL0I3QkVQTmgw?=
 =?utf-8?B?cXNaSXdGRlA1T2s3RktPcnZocjlMMXpqRmkyUzBROUpNVlRNM2hMTE83YTA4?=
 =?utf-8?B?UUpXdGVpencxZTMyM0dlcHlrODlES2ZzUkxEVzJlYVVaRjJ1T1BYV2lWOHpv?=
 =?utf-8?B?dEJCeEtmeS9KSkMvenVpTmJRQVMyay8yQkZIeW1rVmpuK0cya2hWVEhrM2NX?=
 =?utf-8?B?b21PbThCUXAvZk5XOXNoT3NFWmRMQnBSdmRrOXF1SXFtSlpnWlVDYWZ4RFIy?=
 =?utf-8?B?YWRCS3oxT0NkbVk0YTNxa0RuR3hkcEM2REo2aWFHbXI0VWlSUTBEYTBKVStT?=
 =?utf-8?B?OUZOdFZTbGtKWnBucHFWbXBiUWlJaEJ4VHowL3ZGNXhaeDF6V1UzcHFSVnRm?=
 =?utf-8?B?Kys2bEZGYmIrS0Y3eGRiTk91Qk1hSTJHNWVkc216N1J3VUxOc2hJaHFmRkRH?=
 =?utf-8?B?ek5mNkZNZkdzK0p5T3RoWlJPKy9iMHdnYW1aZEJ6SlZzZlFHaFNGaUdjUnhG?=
 =?utf-8?Q?Iwj4mlC7kZS19pPzIHLowvXmVDq6WuOp3Vi6Qko?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c14ef7f8-3948-48fc-e7e9-08d971700853
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 19:53:44.2056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R21Ot0oL9zY59GAHlnBrvjYNmaWlI6fnETb5ACFBroFhixRBjxho9//pCEF6Cl+X5y8fMLnX2hacOdvM6MJwMa71Emr5PYjqOq0lNtD+XpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4120
X-OriginatorOrg: citrix.com

On 01/09/2021 14:08, Jan Beulich wrote:
>>>> Restricting execute permissions is something unique to virt.=C2=A0 It =
doesn't
>>>> exist in a non-virtualised system, as I and D side reads are
>>>> indistinguishable outside of the core.
>>>>
>>>> Furthermore, it is inexpressible on some systems/configurations.
>>>>
>>>> Introspection is the only technology which should be restricting execu=
te
>>>> permissions in the p2m, and only when it takes responsibility for
>>>> dealing with the fallout.
>>> IOW are you saying that the calls to set_identity_p2m_entry()
>>> (pre-dating XSA-378) were wrong to use p2m_access_rw?
>> Yes.
>>
>>>  Because that's
>>> what's getting the way here.
>> On a real machine, you really can write some executable code into an
>> E820 reserved region and jump to it.=C2=A0 You can also execute code fro=
m
>> real BARs is you happen to know that they are prefetchable (or you're a
>> glutton for UC reads...)
>>
>> And there is the WPBT ACPI table which exists specifically to let
>> firmware inject drivers/applications into a windows environment, and may
>> come out of the SPI ROM in the first place.
>>
>>
>> Is it sensible to execute an E820 reserved region, or unmarked BAR?=C2=
=A0
>> Probably not.
>>
>> Should it work, because that's how real hardware behaves?=C2=A0 Absolute=
ly.
>>
>> Any restrictions beyond that want handling by some kind of introspection
>> agent which has a policy of what to do with legal-but-dodgy-looking acti=
ons.
> IOW you suggest we remove p2m_access_t parameters from various functions,
> going with just default access?

p2m_access_t was very obviously a bodge when introduced, and I doubt it
would pass today's review standards.

It is definitely a mis-design, given its ill-specified and overlapping
semantics with respect to the p2m type.

>  Of course, as pointed out in another
> reply, we'll need to split p2m_mmio_direct into multiple types then, at
> the very least to honor the potential r/o restriction of AMD IOMMU unity
> mapped regions. (FAOD all of this isn't a short term plan anyway, at leas=
t
> afaic.)

I don't think that will be necessary.

IVMDs are almost non-existent, and given how many other areas of the AMD
IOMMU spec are totally unused, I wouldn't be surprised if r/o unity
mappings were in that category too.=C2=A0 There's no obvious usecase for r/=
o,
as anything critical enough in the platform to have an IVMD in the first
place will also be non-trivial enough to require bidirectional
communication somehow.

The unity mapping only says "this device requires read-only access".=C2=A0 =
It
doesn't say "this must be mapped read-only", and it is legitimate to map
a r/o unity mapping as r/w.

If such a case actually exists, there's clearly one agent in the system
with r/w access into the r/o range, and mapping it r/w is equivalent to
the "IOMMU not enabled in the first place" case which is the default
case for most software for the past decade-and-a-bit.

In other words, I don't think the r/o unit maps on their own are a good
enough reasons to split the type.=C2=A0 If we gain other reasons then fine,
but this seems like chunk of complexity with no real users.

~Andrew


