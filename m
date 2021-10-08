Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2933E426E8D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 18:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204816.359995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYsbH-0001Se-C9; Fri, 08 Oct 2021 16:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204816.359995; Fri, 08 Oct 2021 16:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYsbH-0001Qr-8T; Fri, 08 Oct 2021 16:19:59 +0000
Received: by outflank-mailman (input) for mailman id 204816;
 Fri, 08 Oct 2021 16:19:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPMe=O4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mYsbE-0001Qk-Tt
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 16:19:57 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9718a53b-7f11-4e29-bdaa-52765dd0c509;
 Fri, 08 Oct 2021 16:19:55 +0000 (UTC)
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
X-Inumbo-ID: 9718a53b-7f11-4e29-bdaa-52765dd0c509
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633709995;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PkErItFDsINZO/cJiJNHKwbzD5uNFzbXNUQ+4Et5pR8=;
  b=HA5gYa9kEJstiSgJ1Dp3dWHa/guxheS/Le2NUjUhcC/a+qXbpXLzpbPU
   2SUXYLWZs6bxLuE2VB6G5QUCibQZ6+D7CoiZ6kWraqDS343jzW+ArWJdK
   8ld/zKKrnYgSWNklud2Wp8/4o65p+QJgBOoesRgRKTvcfC5QJN/QE9i1h
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jNHS0wzhz42g2v7cSgyXk5lOPXbAd1lJNqxHrpPfqMI1KEWaXNL/0yLXvCkTu/JIA6Jvkg7UHa
 5Y0twHofC+mWwfdFE/YiSsOOxhlivBnHGK5X72RPF19gOf94ePprKPpMHOKuunD1dRFPIjYCMb
 dCsjREHDA1GXvkUxBdN5D27pW6sSMPMu6OE89gkR/6pKGSXp6rMTZhZfrerKjMZ4K4kKB2ZsAF
 2KONuiYzKe6K185oyjuXnCQOK/oIrPIuJPyFzVRNcO6A7EXq3/FnCH7a0SIR4LdnpBW7Njbv/x
 dQCXVK3BmaX4vv2BRBV4XYAI
X-SBRS: 5.1
X-MesageID: 54767819
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WnPIxqB3vD+fAhVW/87kw5YqxClBgxIJ4kV8jS/XYbTApG8r3zFWx
 mEeXGGOaK3YYGH1fd0gb42390JUv8WAm4IwQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX550UI7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/jQ+SwN1r2
 vV3v4WodyVxMJbJyLQvTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFgGhu2ZAXTJ4yY
 eIQbD59dAbgPyZeAUYwL5I9gsnrpHngJmgwRFW9+vNsvjm7IBZK+LrnPcfRe9eKbd5IhUver
 WXDl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77nMXIA0bUx28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiHi+pUERQchwKecj8D+vkqTv5lbJNHdRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWnsYHdEdAfucQdBHVNcvIWzyG0mpkiXJuuPBpJZmTEc9dvY7
 TeQsGAajqgfgNQH3qG2lbwsq2n3/cCYJuLZCx++Y45E0u+bTNL7D2BLwQKChRqlEGp/ZgLa1
 JTjs5LOhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOu2ogfx0yapZdIWWBj
 KrvVeV5v8Q70JyCN/8fXm5MI55ykfiI+SrNDJg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3CbWkPHaMq9JPdDjn7xETXPjLliCeTcbaSiJOE2A9Ef7Bh7Qnfo1uhaNOkenUu
 Hq6XydlJJDX2BUr8C2GNSJubq3BR5F6oS5pNCAgJw/wiXMifZyu/OEUcJ5uJesr8+lqzPhVS
 fgZeprfXqQTG2qfozlNP4PgqIFCdQiwgV7cNSSSfzViLYVrQBbE+4G4c1K3pjUOFCe+qeA3v
 6akilHAWZMGSgk7VJTWZfujwkmfp38YnO4uDULELsMKIBfn8ZRwKjy3hfgyepleJRLGzzqc9
 gCXHRZH+rWd/95rqIHE3PnWoZ2oHu1yGlthM1PatbvmZzPH+meDwJNbVLradz7qS26pqr6pY
 v9Yzq+gPaRfzkpKqYd1D51i0bk6u4n0v7ZfwwlpQCfLYlCsBu8yK3WKx5AS5KhEx7sfsgqqQ
 EOfvNJdPOzRas/iFVcQIisjb/iCiq5IymWDs6xtLRWo/jJz8ZqGTV5WbkuFhyFqJbdoNJ8on
 LU6s8kM5g3j0hcnP75qVMyPG7hg+pDYb5gaiw==
IronPort-HdrOrdr: A9a23:jn1qqaN4YlaAfsBcT1b155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyZygcZ79
 YbT0EcMqyBMbEZt7eC3ODQKb9Jq7PmgcPY9ts2jU0dKj2CA5sQnjuRYTzrcHGeKjM2YKbRWK
 Dsnfau8FGbCAoqh4mAdzU4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kLEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 bxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72zeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlJXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbZrmGuhHjXkV1RUsZiRtixZJGbAfqFCgL3V79FupgE686NCr/Zv2Evp9/oGOtF5Dq
 r/Q/1VfBwndL5gUUtHPpZ1fSKAMB2Fffv9ChPhHb3ZLtByB5vske+83Fxn3pDmRHQ3pKFC7q
 gpFmko7VIPRw==
X-IronPort-AV: E=Sophos;i="5.85,358,1624334400"; 
   d="scan'208";a="54767819"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLOVAdqsDHLiuGY1esBCN9gOnzCWa3unzYT69NvIj0pZ3uPALdxPwY0KdVEAvoTUHbToiWfE1o26XXr4gaMY7JYa/kIdUGwOqAXZGCIqSCKqoKMvda7JIFPHfTxGiUA2lbDdWpW6OLwNhiIZfVdnpAc2YLc01S/D5RDrPmKDGpfOdELZ/M5mnaCdaO+8pcWCwqGn1paDrAcRd9MwYHBncGEIa++Nt+ANM5DUjrKygmoVnTuxYJevMAkAvYrhf33v/4Dv0957Dxlvim0wBEjygkC5smTiAn4yKe1Magm9rL8yMMXDKWbKLXXw5FmcZ0ivTKrr94Es1bHc2Aj3iPPXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkErItFDsINZO/cJiJNHKwbzD5uNFzbXNUQ+4Et5pR8=;
 b=SJ51IkNdgxCY3wQiozDkhQ243One/cQEpuusCJeUYmZtNJWBZ1ma9JNSrDQeKdGA3//fCuI2ejJkEPqo/8cfG+il1om/tNpmRy1HZ5S8yVABXJR0VYM5mNRcOLV/QrJlhNHx55C9WL1uCSTcMR5gQyxDDGTnkT7NTPaCA3vPM8qTv2ziho9yUnNkubADnmiq54sBv+JTXEi+NhnVHN+6p6Yq/4bQ19Eq2vKOpD4P1lWzUjkz3K4Pyw1hnHY5f2bI8/n5zJrcwAsEDuQoHbwSY+wym9KutfpvA+cl1UHzD57gsETa3YNFc138bhhwaUyhPmU4x/910dCWqrp5HUWK2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkErItFDsINZO/cJiJNHKwbzD5uNFzbXNUQ+4Et5pR8=;
 b=ZFR5FsD7qKC0mFVwCkzNkFilUAH8ZvtT4RKHLSWLp3ua7cOEWZXJ5r7CxkY8NjJ8TnXE4TLPsr2UjRxH2H0HMWW+gsXhK+B7ezGQYEQqewdBuXYlGTwupdQGUeKN+mADnV/tS1thDVTCGyp/jS8iRqVFJ4cGntrznTrXBoIWYaA=
Subject: Re: [PATCH] x86/HVM: fix xsm_op for 32-bit guests
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <cb3fc8b0-cd60-edc4-7064-0bea87a6c8b6@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2eaa1faa-d1c3-80ec-9fb5-7afda131fadf@citrix.com>
Date: Fri, 8 Oct 2021 17:19:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <cb3fc8b0-cd60-edc4-7064-0bea87a6c8b6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bff6d63-3e54-41be-71ba-08d98a776980
X-MS-TrafficTypeDiagnostic: BYAPR03MB4357:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB43575BB49DE6A8D195961E3BBAB29@BYAPR03MB4357.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T6csT1wy+Mn7DKxIJ9jk0rDDb0FCmtcCiERMLe5ADb1pYHW+gUCUIYKKcY1FD8cUeUkMz7zdT6NHLS+yjC0Mfx5CeP/t/h+x+rqoUr+DHyaFf5yE7XNpepm6psZo7NqR4ORUrYacrRHindy4Rt8ORVRcli7JhyPHRkGubxC+E9WPAnDZOEOpLE1x7WAvmPd6dmjGkQXc6nHTgDM3BY/jia0RaSu+6p7NeSG/n+A1CZLlxLlnjEi57osIwQ4zVFVxAwkVrPBl5aLL8cnG0+A8/6eTzsNMHbuIGOFE0b5qPnucg8O9JjcFVjTiDsRS0hHLfAL1GLTpjhmlW9FdyUp2r75l3SNRVQh38/JjYeBaF60+3eYEHeXi1Bjhg+stgIFwcC46l3MfcFi1aYlAhJshGbVuzPEuz2ab1LFwL2Kq6wDk1/DMqWf8cuA1Jv78KO7Gg+hNo/Hh5jBdhPwddekYiyq8tgE/K0GSuf4KK5ixaxOjVgyzxAivzKXML+1Dt/EiWMFHiKVZhP9ddl28r+btF2sP7RPxfQjEjqHLP5ZoIZLJoJ4fCSinCfYWgjKj3klRZT6U9t5FjI6Y2oSYbZJivkwSS/D5BYTAbvR5dZoCfmYPlZkGgKjaRZZ3z4RO2hsINkJPKn7DqZeZv+qIwf9Q5bqVzj9qRHGwHU/nqE/TNsmLce5/7fy0GF3bQgUOxeNru0450phu3inamlUpRCJ9PlSjH0nUwLgXrInupbrQbjE5aB0VAySVioj9VCtl7HQu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(16576012)(86362001)(316002)(54906003)(31696002)(66556008)(110136005)(508600001)(53546011)(66476007)(66946007)(26005)(186003)(4326008)(6666004)(55236004)(2906002)(956004)(8676002)(2616005)(31686004)(107886003)(558084003)(36756003)(5660300002)(8936002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG1sUnNLRG1MLzRWZVFVTWFHalpVeFV3V3FKeUZldU9qazlMb3pYQXcxQWZH?=
 =?utf-8?B?NXg2dHRLVkJnNGpzK0pNSFNIS3MrMEFEU0tTaWkvUXhOclNwUlFBV2JHNVhG?=
 =?utf-8?B?NWpSczJzYUZOZFBLeW9TaFMyS0ZnLzF4QUtQSDJHRUhzcG5JM2Z6bk9CYjlX?=
 =?utf-8?B?RjRKVE1HcE9hQ3pORGVyTXNkNnBwS1hjVzl5d2laSGlKb3h3NDBBK2xlMjlI?=
 =?utf-8?B?SkRmalpEU2hJYXVSWXJhTFBtQy9ReDE5MTl0V2laUGpGUUlDWXhvcXZaWEFn?=
 =?utf-8?B?T1VROTlJdDBTZ0dBS2ROdTMyNHM1YXRqb0hGYXpFcWVIaTRCOStjVGlIYmx5?=
 =?utf-8?B?OTRyb0U2aCtac2ptU0NPMkZHendCMUdoekJpSHNXRCtkSS9OS282VWwyYUR0?=
 =?utf-8?B?cUVLaEF3MjhuSWdnUmtHdWVEWTNhMjBzaTNxS21kTVhDdnZvcTBXSTZuZW5D?=
 =?utf-8?B?NzNXcjBqb2VqTFpWQVFwa1NOZ2ZmYlQyWTM0Nk5MRXhqM1pKVm9pbDNuM243?=
 =?utf-8?B?ekdqM3hKYk5rMFI4MUVTRmplRlFhdzJUdHF4Yys3MTk4VklCU0dyRW1VbUt3?=
 =?utf-8?B?QWZuV2EzbHlrak83eU1zeCtvWlEwbEZOT2xFbmx2bmFrMEZOemtsV2tkVHZl?=
 =?utf-8?B?MityQldDNHE1MnNCcVI4UlIwTjNWVWlNUTNCNWx4eGNtenByOHo5NjdhUUxC?=
 =?utf-8?B?NUxybk1jMDd4RnVMdHhJeHpvN0tWZGFnaTBjNmhNcFBYWEU0bk55Y3I0aEdP?=
 =?utf-8?B?aDdEaUpuY29MR2dFaGRUOTlaUXdUUlFhTHR4OFpYYkxOSkNiYnVNZUI3b0NX?=
 =?utf-8?B?NjVLMW5iUEZleDl0eXpMZjhndDloZUtNMGRGNkU5N0F6S09ZM3NmSUlSK2tC?=
 =?utf-8?B?QmVoNWlUa1lJS1VFallScmVLcjhCdk9YSGVGVkNTUHRYRG9IY2ZyNFNrRm9J?=
 =?utf-8?B?eXBrczUwWTNYQ2lCM0daZWRKUUVTQUZDZUNHYjJ3bHRYL1ZNbUplTXFDbVhL?=
 =?utf-8?B?Y2pOZmRFNnZ6YWgzYW9wUzZjWmo3R2RZcC9WbTRlVEJCNnp4N0txdGx3WEZ3?=
 =?utf-8?B?YlVESGp3WmNZM0xCdzVUTUJDZFdBOUJjMjArSHVUc2l3RWV3MWZZWm5YY3Jo?=
 =?utf-8?B?dWFiYnJLK0VpMk16RHQ4N0cwYys4eTgycWkvaFZ5SVFLd0ZIN1BzajBNSDM0?=
 =?utf-8?B?dityMXgzZ1luOHRBR1gvVEN5SHlwYSt1TWdSYlZhenAxL2RLaTVmVzFQV042?=
 =?utf-8?B?MVlmTG8yaGhsUnZFeU1CNVdwSDdxWnB4OXlRRWNCSlhWRUJEaFdXUmRTeXBB?=
 =?utf-8?B?VTUyZVg1TGQ3N0tZSVZyOEFCK2F6T0x5bjZBd2hXai9rTWdGRmVicjFqb2JN?=
 =?utf-8?B?RHhpWXljdjZ4UkxkbXpzS1RVMUI4QzliQ2thOGkyUVhteFBOQ2w3VE9nZjAv?=
 =?utf-8?B?SWQ2cG41YjRRUVBSTGsxaC9scjlWMk5BU0NsclVjZVB6cmRXcFNUTzdQeGZI?=
 =?utf-8?B?SmRyRk9VeXFyLzd4a1FBM2xtWHo5dHNVSkRVTXM0ODIrVkNmYUVwU2V5MFdm?=
 =?utf-8?B?c3daZGNZWW5KRUIybzRzZTEvSSt6Z01ydis3MFJjb0lQNUZRbVcrQzhiNDdi?=
 =?utf-8?B?ZlZuVWhRRWhYYnVCV0xlRE51SFVsUEZEYVl1dFpyVmh0RjUzUGk3d3BhS2lQ?=
 =?utf-8?B?bWtrVmxZRkl1ZGRYRSszdU1ib0QxMjcxVlBxQVVhQlJFeVQ2M1ZOdmlDMnUz?=
 =?utf-8?Q?rv8aQKoS2LSFMtGxXCexpsg/wB8Sd2rbvriuWyH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bff6d63-3e54-41be-71ba-08d98a776980
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 16:19:32.7291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xeyNVBg0onVDsAOOvYzo9Ulna1FzSXyOPMWIUuC+lrGPd6AyRGKQoo9Byl53Mc0kfuhye/t/76REsjLk3T2yF+7K4G8Y5X+qne2iwM8C9Kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4357
X-OriginatorOrg: citrix.com

On 08/10/2021 14:06, Jan Beulich wrote:
> Like for PV, 32-bit guests need to invoke the compat handler, not the
> native one.
>
> Fixes: db984809d61b ("hvm: wire up domctl and xsm hypercalls")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

