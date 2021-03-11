Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D943370D2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 12:07:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96450.182484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKJ8c-0007FV-Kj; Thu, 11 Mar 2021 11:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96450.182484; Thu, 11 Mar 2021 11:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKJ8c-0007F6-G3; Thu, 11 Mar 2021 11:05:54 +0000
Received: by outflank-mailman (input) for mailman id 96450;
 Thu, 11 Mar 2021 11:05:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DcZr=IJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lKJ8a-0007F1-UF
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 11:05:53 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3cea21c7-0e19-4159-ab28-366a5264e7a9;
 Thu, 11 Mar 2021 11:05:51 +0000 (UTC)
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
X-Inumbo-ID: 3cea21c7-0e19-4159-ab28-366a5264e7a9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615460751;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/FrW1AtOW2gGgoPqh/1PJBUkMHjK8/jpDqn12hGdSJ8=;
  b=S/vDQMZqPHldgDl+Em7xkfGU09u99L+RVLuxd14kOhTGQcIWhdu/4cQv
   wXxqLOF/tl21ydmkUOqtpkDNbsWWEQniTPzEAY4Jc8yGijkMs0Fgq7P7M
   DvblNLwiFQa92fKq7OqYqNAYs9n1fxl0GbbZnjRTQuDfkl5M17nst1d0z
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GWWB3x32zCNhnTXd4RkEao7SWYQsq8hQD/PZRmW6Wh0ULG7y3XfZHscMr1OzsFy0VAUXSIKOXT
 rr/VS7g26sQ1N6MKf8BvMA8wRhT3oIjGVUSFa8kmvYiXok9DP7WDa8dGVFGqoUqpQJ4sWIv00u
 cHwwVKmKM5nw8iCwrRglPGomvGps3mLUFCfdsm1jKexVlQUiDtmE79pY243FgTtRsJr+60qC+q
 qxqe7mH1Jj7IoCG/EBrXvRycam3YQBIIQdjwcwknbow1bLxJtDOz1tIeSucWpNoYX49ehAfx4N
 6Nc=
X-SBRS: 5.2
X-MesageID: 39405919
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:AeYNYaDwApusQe7lHegltMeALOonbusQ8zAX/mh6QxBNb4i8n8
 ehgPwU2XbP+U4scVk9hNGNP7SBS3vA9ZhzpbIcJ6umQROOghrrEKhJx+LZowHIMSv46+JbyO
 NEe69xFNX/ATFB/IHHySO/FMstx8TCzbCwiY7lvjFQZCxJS4Ul1Qd2DQ6HDlZ7LTMsObMVHI
 eRj/A3wwaIVm8Qaq2AaEUtf++GnNHTkYKjXBhuPW9f1CCrrReFrIH3CAKZ2BB2aUIH/Z4H/X
 LemwL0ooWP2svLrSP07GPY45RIlNaJ8LIqbqDituEvJjrhkQquboh6Mofy2gwdmv2l61ohjb
 D30nQdFvlz8H/YcyWUphbgymDboVMTwkLi0lORjD/fp9X4TlsBeqh8rL9eGyG512MQ+PVXlJ
 5N33qEu/NsYC/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEf1Fk9KuZKIAvKrKQcVM
 V+BsDV4/hbNXmAaWrCg2VpyNuwGlwuAxa9RFQYsMD96UkdoFlJi28jgOAPlHYJ85wwD7Ne4f
 7fD6hunLZSCugbcLx6H+VEZcesEGTCTVbtPQupUBnaPZBCH0iIh4/84b0z6u3vUocP1oEOlJ
 PIV04dunU1f07oFM2SzJxG+h3AWwyGLHvQ4/Abw6I8lqz3RbLtPyHGYkspidGcr/IWBdCeW/
 vbAuMZP9bTaU/VXapZ1Qz3XJdfbVMEVtcOh9o9U1WS5sbCKojgsP3HYO/eTYCdUAoMayfaOD
 8uTTLzLMJP4gSAQXnjmiXcXHvrZwj45pJ/EK/T+uAJ04gTPohQsgwY4G7Jqv2jGHlniOgbbU
 F+KLTonueQvm+t51vF6G1vJ15AFEpP+a7hVHlLvAcONEvxfd84ypWiUFEX+EHCCg50TsvQHg
 Iamk9+/rivKYeMgQo4Dci8D26ch3wPhX6DQpsGgJef7cP9dp5QNOdkZIVBUSHwUz18g0JDtX
 pKYg5sfD6lKhrezYGeyKEyKM6aXd9mmwuvKdNTshvkxD+hjPBqYnseUzSnS9PSpx0vSTpSjk
 B26MYk8f69sAfqDWs6jO4xKkAJUn2eBPZ9BgKfaOxv6/XWUTA1a3yLizycgww0YUzw+Swp9y
 TcBDzRdvfRDlVHvHdElq7s7VNvb22YO1l9c3ZgrORGZBD7k2c21e+Afayo1WSNLlME3+EGKT
 nACAFiUD9G1pSy1BSPniyFGmhjzpIyPvbFBLBmd73IwHuiJMmJkq4BdsUkiapNJZTrsuURV/
 iYdBLQJDTkC/kx0wjQv207IkBP2QgZuOKt3Aeg4Hmz3XY5D/aXKFN6R6sDK9XZ62T/Xf6H3J
 hwkNpdh5rGDkzhLtqdja3HZT9KLR3e5XS7SOwlsphYt6M/vrkbJeipbRLYkHVcmBkuJsb9k0
 0TBLlh6LfaI4l1YogcfTla8ldBrqX4EGI79gjtRukwclEmgyWFY5eH47/UpaEuBUPErg3qIl
 Wb+zBc+fCAXybr789kN4sgZWBNLE474zB++enHcYvaAgCjbftC81q3KWXVSs4sdIGVXbEL6g
 9n6NSJlfKNfyX22ArMrSJ2S5g+j1qPUIe3GkaQAuZG/NyxJESUjqar6MC1ii3rSTHTUTVnua
 RVMUoKbspCjTE+jIo4liiqI5aH334Yrw==
X-IronPort-AV: E=Sophos;i="5.81,240,1610427600"; 
   d="scan'208";a="39405919"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhlnqbYiUQNTqqdfgOnJ18Jj4d3NOM6WrNWgzZm6L/ZXv3IkLa1U1nPIl4bVfJoy4Gkj6cyAQG3K/ZgwFSBBGOZbHouFI9cv/0d3D5Vn1Ae3E6y5gUPWNArBllLM7kywp9tPg2AzUPqf9uHN9lEbAzjEkiBY6m1wFG8Uji+NMhoAeC+d62qgpyo6tMkwuKsk7mwzZRGIWxlVaHsAeGur9VWYnkl8tQWeA0Morq5hgsBfKv4FPd29J0nCSRgCsQg+kXtkcZd8TWPB6ASlCCwCs97Boouy2vxoAEnytcyR4mTiGFXtyR8A2eBfOq/e1hm5MfZ0H3xkTrAlPK0zsVBN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bSva+Px1wrxAkeAMrJWOEKLGLJ4JwsVzHXWwa5o/1c=;
 b=DsY6LiWoSvySLV23q7SZhc6M3d13qKTGg7uU5PbJYDFGHx/MBbeWyOx9AukHWq+2PFQOUGmOHMEUMNePoKVEmRyD+fzDzE1p3zaTOywYNTcKHI8chd2QYNr6rw8+3uE9P0HzNLUeHQ7jm26hR4E9oWZcolji8Ys/Isw6N6z9fAVir1GHbhEet7i2IUF5ICHMWSY/8YLVX/Yy6r45L7vCHZPB0jTuIxKHCh6KIb4A3EDxK6kyrpEueYS9kPrGs7HpNp9PTORoS8qVsxaymZ1V1ab+v19Akk8WaoOsnquM0dEjRkbvcO52+FpRZ5DHYDbD4VVApY3Xw5fjst3OQDs7lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bSva+Px1wrxAkeAMrJWOEKLGLJ4JwsVzHXWwa5o/1c=;
 b=cBAIT8QTeSkseUbZLNNXwRt6UeTlFNC4LRbqfWVL9hALdO4zPM+IxehHiz7ANk7WtV2ewa6yHx4yTNuq61AR7Y3iMZrgOQPv6UxIo/a2yL4Ar70+XqzbVjhXMrxE2j5jEg5a0dkq2+37zC3iUJDAKwx5z75jl9BNUoyU+y78XGk=
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>
References: <20210310150722.27194-1-andrew.cooper3@citrix.com>
 <d375232a-d1a7-737c-0887-8b7e1c9a772d@suse.com>
 <13f03a67-18c2-e564-a0f6-84eccc7eeb76@citrix.com>
 <556ce32b-5087-b8b1-432e-643218dd8c6e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard
 from public API
Message-ID: <9ca069ab-8b6c-c8f1-d68b-4a9bb0cf5c56@citrix.com>
Date: Thu, 11 Mar 2021 11:05:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <556ce32b-5087-b8b1-432e-643218dd8c6e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0055.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57d8352a-0a1e-4beb-d836-08d8e47d9af0
X-MS-TrafficTypeDiagnostic: BYAPR03MB4120:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB412015ECEDF30C3D3A444A53BA909@BYAPR03MB4120.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ucLLKpybCJOXIFj/wN9SUNCiwMX+bT8TH7Mih14s9WzMUqyLxVJZFfYTABgGYc2we7f2K1RnFVQO3Ta2QM2MO3aMqwKLr9UaL128tjvDGGF/3sbS7bWgpiHWHzPLVRhzt9xW5E9A74QSESCg+MiulDh1JT0p7y6+lVA3yF6lixAqhO12RORY7/5HvWe7RLDf1jNMRjRBODQWJ1lARPhr8SJmKJK3+Jpf+3VHTE+UceZUB/hLnzfmXBr2xc678XGlhLMabgmzdUJIkOR6JFSb5CPG9ChMhLSjkAg/OZRfZwZA4GdRBDEMPNimgzLtz74Tli0oInv6s5RTpnY/MZGxBGMq9IOJFU3puHKLv1Pl6Vl8b/hxk7G8ziDwAmU+eMNM4hs99dDDR6ul65TKvMfl097sDLNGqJ8P+Xbe4MEnng4GZCSAyFV080ozhGFrwFgNCriGx0K1esjEHJr++s/rjtqcvo6ODijSAFh1vuxYo/T0qIZQHj0PjzNE8Xo9FSggWgcJ0zEOeOWVhDLSHzOh/4BYnwR3y3TA2v2/X9i1csJ/hNRVzct8C999WRgL1gxY2xYsr1od3M9j6lHz/Pg6GYKXpbgkAtAzjzK7CpaeHE3+6nFIyPKD2O8Bg3MCOGS/n9ouzg65l4uehUoPNKCVClIwCilV7viFjcHa165XPYWLoVsQutKfB8Bw7s+/nl9u
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(136003)(396003)(346002)(366004)(2616005)(966005)(2906002)(54906003)(5660300002)(478600001)(36756003)(110136005)(66476007)(316002)(26005)(6666004)(31696002)(16576012)(8936002)(66556008)(956004)(4326008)(66946007)(31686004)(16526019)(8676002)(53546011)(83380400001)(6486002)(186003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QzNMSDVBSUozVytxb0xaZWxDTXUxVzExWXQyTTk5MHZFM3lJaGpiOUU2R3ph?=
 =?utf-8?B?UjFVSmN3N3FZVG9XdVBTa2djNy9KWGtnSFV6WkYxUndCeHhpbzBtZEdDWWFS?=
 =?utf-8?B?ekYvZDd3dTloYy84ZDh6Q2QrZjl1Sjh5V3VxaENSTEpoMTVqK2hpckFxczBM?=
 =?utf-8?B?TVR4bU5zbVQyd3hiU3R0TlRrRmhGaXgyei9MWWRSM2VNSmJ3TGltN2Eya2ZV?=
 =?utf-8?B?R3hWbkw1ODM5UTBhbk00c3k4WnhVQStlQnkvSFdacXhUaHRYdzE5WkFvd2t0?=
 =?utf-8?B?eW5jN0VLUWhadWE1eC9ESXN1cmh1WGEvOWdTUGhrZnBwcE43bzJuNjJnekNh?=
 =?utf-8?B?dnk5bG1JZXdaUWl5N2VUSUt2UGdsRjA0MTZHeVU4MUgwQ3RTQ2JpWVg1ZEhT?=
 =?utf-8?B?MVU2VG5FcjA3TzVoaUlMejBjN3RTbEN3MWxnMGNaQnhuQTlXYXZlMExZa3VR?=
 =?utf-8?B?UHdWak5EVllFemdIVlhLRFFxSm5PR3RoOU1nVmVCK21MM3R2V3VDWVlkMXM2?=
 =?utf-8?B?Y29iTjlpVGRsQjNnTkljcjM4SnlxWXZncWxNSm5pYlFFWTA0akFFemk2Sy90?=
 =?utf-8?B?ckdZMnNEczBvaENBd3ZMRGUvZTlUOG9ZRGpxS0kzR1JFeThHaUJyV1E4SjFx?=
 =?utf-8?B?WnlZSWtKSEU0OVlUMDAzQnZKOFBhTDJCakpRQTJVanViejYvRFVnMGVlV1dm?=
 =?utf-8?B?UHZTUnpLZldkYkRoaUhBdG51QzlCQUVrSzN0M1drcklrbXF3WHBuMDltY3cy?=
 =?utf-8?B?Wjk1MUNUeDdtdjNFMnJFYmkxd3N1dmNFaktrbWU5RGl2R2dFYk1YZFovdGJT?=
 =?utf-8?B?OTAxdnNpQXRVbEhIRHIyeExWQ1VNSXloT01xUXdmVjZNYzUwSHkzbG0zOHo0?=
 =?utf-8?B?ZzhmSmNmai9qcldHN2JvSUtySnQxL25ZblZGTXJETytVclh0WlV2azNQbHpz?=
 =?utf-8?B?ZFlMbWpjRzFZSDExdkk2TXNrRUhzRzlhbkxWbXA0T1ZaQ2VnZ2pFOTh5TU1y?=
 =?utf-8?B?NTcyWDBKRjN4Rkw0UXZkSUdXVU1PSkx3dHlRTkZma09DeVZVM0ZCOHl0YU1K?=
 =?utf-8?B?ZW1YbGFKR3ppUTdoK3laeWJET1lWSHBLbEs3QjJ5emRrTzVBeGtmamwyWm5W?=
 =?utf-8?B?K2o1SEJaMG1LSks1dUFFSllCV205NUx1dEdmWXg2OGQ5elJJaDZTbmZGV1N1?=
 =?utf-8?B?bjZjWTVsdGVqOVFhdzR2YjZ3RmhTZ3dBbHduaTU3bzlEM291ZHVGQ05mS3Jh?=
 =?utf-8?B?d05UcUJNYjk3NndQVjdnVjlWWXBxRmRKaklVSHBIWUFDdGJzTVN6MVlIOVZv?=
 =?utf-8?B?ODM4bzhjMUFxSTJMZzROMk5iU2pIY3BtbDlHaGhTdDI0ZmxROEpUenIwZmRI?=
 =?utf-8?B?d3NsemxSS3lkYnBSVC8wa28xZ1B5dmppWjZIbFhZSzVXNitXOXh1Q1VKaEV5?=
 =?utf-8?B?aFFwTW5vUXVZL0d3MW5ML2VoSXRPb243aWhPaG84UGdLbTFGZ1NydjNka1FQ?=
 =?utf-8?B?Rk1GczVENFdCMkVnKy8xcVVkQnFwZ3ExaksvQnhiQ3VyYzJ3Mm9RSW9oaU9B?=
 =?utf-8?B?MmFHTDhuTktoRjliTThNeUpRV2VRQyswY25LM3FSckt3RmJmNDBicjhZL1Vq?=
 =?utf-8?B?TWdnbFlhTTNsdzkrb1hIY01rTUNtTDJsN1EreE5MZ0ZaMlVWUzBEWmt4S0t6?=
 =?utf-8?B?NDFTWk1QV2RYTmVWQ3A0eDhhWXZDclhzRmo1R1J2NHhCN1NzU1lWMWk2ejdH?=
 =?utf-8?Q?TVHsKpqWf4j9YzB1MMZjw7ilcUXoRaakaDww4R4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d8352a-0a1e-4beb-d836-08d8e47d9af0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 11:05:40.0371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfmrioYodgcraMmDgwBic3N2Y40X+MXN3QMVEe7ueOaQaHVnpAgod841llhodljBRdJVvJIkTIC/nl4SCO8YYZlgBujYqhA3FWd61sVdxgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4120
X-OriginatorOrg: citrix.com

On 11/03/2021 08:27, Jan Beulich wrote:
> On 10.03.2021 18:22, Andrew Cooper wrote:
>> On 10/03/2021 17:12, Jan Beulich wrote:
>>> On 10.03.2021 16:07, Andrew Cooper wrote:
>>>> --- a/docs/designs/dmop.pandoc
>>>> +++ b/docs/designs/dmop.pandoc
>>>> @@ -4,9 +4,13 @@ DMOP
>>>>  Introduction
>>>>  ------------
>>>> =20
>>>> -The aim of DMOP is to prevent a compromised device model from comprom=
ising
>>>> -domains other than the one it is providing emulation for (which is th=
erefore
>>>> -likely already compromised).
>>>> +The DMOP hypercall has a new ABI design to solve problems in the Xen
>>>> +ecosystem.  First, the ABI is fully stable, to reduce the coupling be=
tween
>>>> +device models and the version of Xen.
>>>> +
>>>> +Secondly, for device models in userspace, the ABI is designed specifi=
cally to
>>>> +allow a kernel to audit the memory ranges used, without having to kno=
w the
>>>> +internal structure of sub-ops.
>>> I appreciate the editing, but the cited points still don't justify ...
>>>
>>>> --- a/xen/include/public/hvm/dm_op.h
>>>> +++ b/xen/include/public/hvm/dm_op.h
>>>> @@ -25,9 +25,6 @@
>>>>  #define __XEN_PUBLIC_HVM_DM_OP_H__
>>>> =20
>>>>  #include "../xen.h"
>>>> -
>>>> -#if defined(__XEN__) || defined(__XEN_TOOLS__)
>>>> -
>>>>  #include "../event_channel.h"
>>>> =20
>>>>  #ifndef uint64_aligned_t
>>>> @@ -491,8 +488,6 @@ struct xen_dm_op {
>>>>      } u;
>>>>  };
>>>> =20
>>>> -#endif /* __XEN__ || __XEN_TOOLS__ */
>>>> -
>>>>  struct xen_dm_op_buf {
>>>>      XEN_GUEST_HANDLE(void) h;
>>>>      xen_ulong_t size;
>>> ... this removal: What the kernel needs for its auditing (your 2nd
>>> point) is already outside of this guarded region, as you can see
>>> from the context above. You said there was a design goal of allowing
>>> use of this interface by (and not only through) the kernel, e.g. by
>>> a kernel module (which I don't think you mean to be covered by
>>> "device models"). If that was indeed a goal (Paul - can you confirm
>>> this?), this would now want listing as a 3rd item. Without such a
>>> statement I'd call it a bug to not have the guards there, and hence
>>> might either feel tempted myself to add them back at some point, or
>>> would ack a patch doing so.
>> Xen has absolutely no business dictating stuff like this.
> Actually there's no "dictating" here anyway: People are free to clone
> the headers and omit the guards anyway.

That is somewhere between busywork and just plain rude to 3rd parties.=C2=
=A0
"here are some headers but you need to unbreak them locally before use".

> Outside of our own build
> system they really mainly serve a documentation purpose.

Header guards are not documentation - they are active attempt to
segregate hypercalls by "who we think is supposed to use them".

MiniOS, which uses this header within our build system, is not a part of
the toolstack, and should not need to define __XEN_TOOLS__ to be able to
use stable-ABI hypercalls.

Equally, the fact that libxendevicemodel's private.h needed to define
__XEN_TOOLS__ demonstrates the problem - dm_op.h (the structs and
defines - not just the types) are necessary to use the ioctl() on
/dev/xen/devicemodel in the first place.

>> =C2=A0 It is an
>> internal and opaque property of the domain if the hypercalls happen to
>> originate from logic in user mode or kernel mode.=C2=A0 Stubdomains woul=
d
>> fall into the same "kernel" category as xengt in the dom0 i915 driver.
>>
>> However, the actual bug I'm trying to fix with this is the need for
>> userspace, which doesn't link against libxc, to do
>>
>> #define __XEN_TOOLS__
>> #include <xendevicemodel.h>
>>
>> to be able to use the libxendevicemodel stable library.
>>
>> The __XEN_TOOLS__ guard is buggy even ignoring the kernel device model
>> aspect.
> Depends on what __XEN_TOOLS__ really means - to guard things accessible
> to any part of the tool stack, or to guard unstable interfaces only.

As far as I'm concerned, __XEN_TOOLS__ should always have been spelled
__XEN_UNSTABLE_ABI__.

For better or worse, the fact that we currently do have unstable
interfaces, which aren't in an obvious namespace such as
xen/public/unstable/, means that there is some value in some form of
protection to prevent users from inadvertently using an interface which
will explode on them with a mismatched hypervisor.

From numerous complains and problems from donwstreams, we are
deliberately taking steps to stabilise the interfaces, specifically to
decouple the software in domains from the version of the hypervisor.

dmop was the first serious crack at this, and all these patches from me
are literally trying to get https://github.com/xapi-project/varstored
(which is a trivial IO port device model for UEFI secure variables) onto
fully stable hypercalls, so it doesn't need rebuilding simply because
Xen changed.

Relatedly, xenstored.=C2=A0 At the moment, xenstored (which requires one bi=
t
of information per domain via its final unstable hypercall) breaks
whenever the domctl and sysctl interface versions change, despite the
fact that the ABI hasn't actually changed in years and years AFAICT.

xenstored is arguably classified as "toolstack", while varstored (or its
stubdomain equivalent) is not.=C2=A0 Neither should be forced to jump throu=
gh
hoops to see stable API/ABIs, even after they've included the
appropriate headers.

~Andrew


