Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016334D62D2
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 15:06:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289054.490368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSfu0-0004rs-3B; Fri, 11 Mar 2022 14:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289054.490368; Fri, 11 Mar 2022 14:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSfu0-0004pn-03; Fri, 11 Mar 2022 14:05:56 +0000
Received: by outflank-mailman (input) for mailman id 289054;
 Fri, 11 Mar 2022 14:05:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXIo=TW=citrix.com=prvs=0626a3ed1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nSftx-0004pd-T7
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 14:05:53 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ab2f32a-a144-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 15:05:51 +0100 (CET)
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
X-Inumbo-ID: 5ab2f32a-a144-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647007552;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=w7+YEg80/LjQfksqt8crA6jdF3y18KR4t7mzfmWIFEQ=;
  b=HO4XO+FSdDLdhHrgtAKRq94Qgmp9DBkBoyJGzWt+LRDUelXK7KP/nxyz
   NyMwLaa690WkWjWhNgPiO3jLCRM9SMpZHkQe2AtmZ2QJWnzSkslKB1c0+
   uWDWeEyHMB5+sdaO7L2LAEc6o2b3ACnp4zDgIuvD5mE2iash4kVhFtyi4
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65486906
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pb8Yjqh7dcV4rF41duIPT/rgX161cRAKZh0ujC45NGQN5FlHY01je
 htvUGjVaP3ea2akfYh/PY7noUMPvsKGztI1QQtp+S1kFH8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFrU4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YRY4MITg28pDaDt7H3lgLbB39rPKG1Hq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiDO
 5pHOGIxBPjGSwNQZkY4A5kYpui5u3rdLxtAiHGoiJNitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4Avw0wS3O5PTvwSWVXnYUUw9PZNEcnZpjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoCtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT0uDA3Dt4ade51q2VtW
 lBdyqByC8hUUfmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehs3Y51bJm+xO
 BaN0e+02HO1FCL7BUOQS9jsY/nGMIC6TYi1PhwqRoYmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnKOoNBJcgxScyRT6FKfg5U/S9Nv6zFOQQkJI/TQ3akga8pimaFUnf3P5
 XazRglTz1+XuJENAVzaApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:NJhQ86uQSbOhpN8q99jsFfjH7skCmoMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtVD4b7LfCZHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkDuRYTzrdHGeKjM2YabQQ/
 Gnl7Z6TnebCD0qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPwf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0amSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7tvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WjAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 RT5fnnlbhrmG6hHjHkVjEF+q3tYp1zJGbNfqE6gL3b79AM90oJjHfxx6Qk7wI9HdwGOtt5Dt
 //Q9RVfYF1P74rhJ1GdZQ8qOuMexvwqEH3QRSvyWqOLtB0B5uKke+z3IkI
X-IronPort-AV: E=Sophos;i="5.90,174,1643691600"; 
   d="scan'208";a="65486906"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxoHVkClVwAlSDL1UYbKjQbJbaP1W868xXXmc4ueGOocRcgNgLvf3AF+rjknI2a/AQ8eZE0EJpp90bjB9eXNNQTBC6r8UesQiOiPJVIAOVLCNW4SwJsuNwmdrdhcIDcaZDwEAJF6PiPImXwPnmA60vhViPXk5MtyUVobAobOqtgl3g8snos8Vwj/fyLJcFcdibme+VCfmpr2c4rhIRND7giJOuGslJm2gy/0DqRFi0EF2YM1xBgV5zwtBahkPyFcti09/mY0DfegihK1bpED0SEL8ZDY+ypRQPhfLGbVnMV4bYJyd5oS1GtwT3o42WThAkHaFDJAEcpUDCyRW6GYhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5BbK7KsURF3cQSO399ioLmdycALGg4i7zDBaV8o6VM=;
 b=J7XTY+zCOaLz16MJgM1pdzGmyb3uHZxtshHQhQwxdMHJNlrhTe6iDlEDU9u7tKdfxxvoMkMtqCewoJfs01eoc3IQkwX8/j8RYWe+mbUFBVkm0dEPR0Rw7bWueAtvZhg8AwFmw6+lU8lobYSiLsF4eytIYbKj77mAcIGKjx2YILfZ1oLsFmVye64REf+XPjiD4rzHU1nhFIyFZcYpvnSTPRGCiwJymEQWGLpJkYl8u14Zb7u+xRL+4bVua+odoOwE2NbrmeqvzYpl6XO6unMcUFNWmpJWrUh2/dfnUTCiuo0Kl07MIjAC2tuYqQ28PxiPd2VL6dlS/IaCQeXwiCrRMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5BbK7KsURF3cQSO399ioLmdycALGg4i7zDBaV8o6VM=;
 b=nbPmpLnz4Iq7kPdmRlQtz/lzms5XuhrPH7tFczxYVYNDTocS6hFIQQmQqfzpFrjjWcX0a1t4qw1sy47STk12ZRaV9Ekwcg0X8RXat/HIsR4ck6iQAWBIh7Is3OHulJ7xA5Zy/s/AS5CnFZudiBQeFvNaAJih8R9uMXk+sTPQYRo=
Date: Fri, 11 Mar 2022 15:05:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 3/4] x86/APIC: skip unnecessary parts of
 __setup_APIC_LVTT()
Message-ID: <YitXHaekQk1aK1i2@Air-de-Roger>
References: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
 <c679a11a-d2b5-403a-5341-3e00ac91ff45@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c679a11a-d2b5-403a-5341-3e00ac91ff45@suse.com>
X-ClientProxiedBy: MR1P264CA0129.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38ea09e5-7307-431f-7d75-08da03682e8f
X-MS-TrafficTypeDiagnostic: BN6PR03MB2913:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB2913187B3B090B9B6A9B2AD28F0C9@BN6PR03MB2913.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vahFcLzNISqbpYslP7WGt+8Nr9br3uYcx1pPkyCY8RcnJ3sB/wKvZ7HCGisZZ1NMjEZnVBJVaQjtWUUE3FuPcthrPboj2w0YyPJkLNJr7V5uirGI+GY2/OzktMESCHcCdagkcQew3lMA32KtgbNLeNvg1LhM1SaRuW6wBE8hOWILLDNDR7+9gXQjhxa9wDtp/FsxEEYGlyMClVkQ/DLoPhgoYe/iprJ4TP1vsRiBH107fz3BJLXHAkd/bKvo5/jMe5XfFQrx57tXCIBv7ytkXw+MrcLa+QHgUkI/nDZ3xN3tddvJYCL6KaQCRi8PzEhM0IGbCvOyvm9blSoveNsl3EWsCwza9EFIMFQt7ZKNsQOYLtvjhaMPq64KtEbn94CBq72pHFGWcg9U0rrPAW62e00IaSVpD3vAM3rSh0CuAzdzPOoTvzP9Mppa3754xMi4DneQHeASuBOONBDgqR6qKe1kh8fBZ7ZUh9fIXNqEd/eI5Iv9fEu8tP4NDUClZqO+2yembecUg65Hwm+wYrQk6AtNg5iQoNSPmi+Vv3MtNJse51nxMbvkHeQmdKr7XFpp5Y1zpaY599PlZkWkq4NWNRWKyyun84OwQxMbt+HVzffnbOZpHOwTXcY+kuxDOD4gx2EDSj+gKqQ4NhuPVVZ3ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(54906003)(6506007)(85182001)(6916009)(2906002)(86362001)(6486002)(6666004)(9686003)(6512007)(26005)(186003)(8676002)(66476007)(33716001)(508600001)(316002)(4326008)(66556008)(66946007)(5660300002)(82960400001)(38100700002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjVHY3lBVmxuaENtSEQzODY5V3hic0NrZHNOZ3o4QVBBN1VnZWtCNVlDYUdF?=
 =?utf-8?B?d0ZndzROMmJqRDdtdldEenRjOXd1ME1vQ0p1NWZYaGpBcmdBWHZzVG9Edkpp?=
 =?utf-8?B?TC96Y09zODltLzRGaXAyUlVvWUtZWmQvZnVoYmc2WGdPbGtianc3NE15YlJy?=
 =?utf-8?B?Y3l0RlpqblY3enZOdEdhNmdOQ0UrMjU5VUZ6bkF0THJqRFp3MVVKVHNiajc5?=
 =?utf-8?B?QlZEVyt4K3REVlAxUWw4RGNEcktYSnVwWDVWREJRU0tvaFZ3b3Baa2N4emhH?=
 =?utf-8?B?dEk5UDhZUlhJYWhmTDIwem9MdzZuajJscUhKQ3l0ZWRDNjk0UWIwM1lhRnhP?=
 =?utf-8?B?TmRiRG5RVlFGNWNycjBDQ0dOK3VQQXdqVmhIeVdZTVI0UWkzM3Jxdnpra1Vw?=
 =?utf-8?B?UkpJSHo4U2I0dGxaQVAvUDVEc2VtUzYzKy9FeDlsK3daSytNb290dmJqN2JY?=
 =?utf-8?B?akN2UWljSGw1TlM1eWhhOHJ0RFN0aUp6TEMwdUFUTXFvME9pNHdKbHVSdms0?=
 =?utf-8?B?M2x5YmFxSmVKMDhTQUVETWdvVWNkUU1DYW9EWm9XZzJ3VllmUUczeEVLU2VR?=
 =?utf-8?B?b1dMTEZSMmxTTGZTaU5tbFllMDlTTWx4NjJOc1pCM1RsY1BjblBwUHN3SXdZ?=
 =?utf-8?B?RzlWY0tLS0NsYkRIQ0xRcGYyMTNjM3BoKzFWR2lURExNc3ZxaENibHovT2RW?=
 =?utf-8?B?S0VtNEJWUEcrNHovMmNYZXJpSFZ6TkV5Uno4WkhqcXBVT1NFUm5YZ05IUkJ3?=
 =?utf-8?B?S2FOWGdNSk5DbGFkYVI3N3QvRm02ZjFVZFp2eHJwTVp0NDlhTmxJeGNkWjFP?=
 =?utf-8?B?OWpER0JrK0FrRnNHc0Z6cjBuU1BwR0JLSngzWk9HQlJKTUl4T1hkcURVLzFs?=
 =?utf-8?B?MGJVRGs2SFdtMm9XOGYvcmUyUmdEcUU3RmNqS1h3bTlJY2Y3SVhMdWFKQ0Y4?=
 =?utf-8?B?NnZaY084Tk9KR2xFVHpGNlZZTlA1ay9XV3pNcHpNaEZJNzBNVXRxR3Y0VEhK?=
 =?utf-8?B?d205a2NtTDE3M0Z2bXNGUm8wQXlldUtFWGtWaytDK0oxa0hHbXN6dm9YbFYw?=
 =?utf-8?B?dVNRdFp2M1NRYkNqMGJacUxocDF5TWV4aUV4YWx5QzUwVzJOeVE5TytUMjVi?=
 =?utf-8?B?RlNXNysxaGxSOXdFUjJVUkg4V001NnJrVXBzNHVDcE5qODJDRTBzUzNZK1Ry?=
 =?utf-8?B?ZUdHTVFkZzFEbzJyRnNEQ2trb3J4SDZBRHdXZTV3S3FxNFpBbXdiak5PQlRi?=
 =?utf-8?B?MjZHSzZsMGMyYWc5S09ZVFV0VVBuM1FxNW5WanBpczFEMEtQRCttTUpmTjZW?=
 =?utf-8?B?Z0s1VE50V096NENQUlorOHlwbEFxSHVwejlpdzZGVmJJUHJQSWNqMUxMMWsr?=
 =?utf-8?B?VDZYSGRtNlVHUlpoTWQwM25MTzNQTUQvS0tYQVh4cFZneUVyRFUxQjZRakRn?=
 =?utf-8?B?OUMxZ0wxOXo4Q3U2SVRWVDVraHFsTkk2SmVTdWpTN3JTZlJia0t2M2pjb1Ro?=
 =?utf-8?B?SVNmTW92YTNuclIxWGM3UjdtcDhqZzRGZ1NLR2I1WWs2dVVUbTNoWjBETHJD?=
 =?utf-8?B?WEtpWU55a0IwajV1ajZPTFJNM3NjaWR4QzBFV0FyM3VmUTNDaTJRcm1JRE5s?=
 =?utf-8?B?SjFMN3hnZlp3dlpnOE9VbUhnTE01NDJnM0tndjNWUktFM0xXRGpXMVdHNTRh?=
 =?utf-8?B?OGx4YWc4Tmc1cGZSR043dHBhZTBja1BheEhCTzFYZDdHQkgwcW1EWE95L2hO?=
 =?utf-8?B?N1k0MW92S1hNZFJ3RmVRMXZkSTdjZjRUUVdMMmtWY2lib2NqME1aUE9QODgx?=
 =?utf-8?B?RWUyQW1CRkxBd29hcHhrR1ZXMlJCL3ZURFdRMC9pei91bXdoMm8vM1gvNTVM?=
 =?utf-8?B?NUpSR3ZGUXcyM01ZQWlGZTdrZUh4ZzdPTmRRMVpKaVFnWmJVNGtqT3U2U1ls?=
 =?utf-8?B?UUM0ZzZtTEptZHdIUWJFTEFDTXYyRy8vUkkvT2lpZktza3J5RnVhVFkxczJH?=
 =?utf-8?B?ZERqcHlaaDJ3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ea09e5-7307-431f-7d75-08da03682e8f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 14:05:22.1483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3OZUFMAfMNIk94Upl5uPLkkRz+GelEl9inNcEbfN1KcvcNlvswF4gmKuMF3s4xRLa6b16eN/KmD5uRXtsnOZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2913
X-OriginatorOrg: citrix.com

On Mon, Feb 14, 2022 at 10:25:31AM +0100, Jan Beulich wrote:
> In TDT mode there's no point writing TDCR or TMICT, while outside of
> that mode there's no need for the MFENCE.
> 
> No change intended to overall functioning.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I've got some comments below, now that the current proposal is bad,
but I think we could simplify a bit more.

> ---
> v2: New.
> 
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -1059,24 +1059,25 @@ static void __setup_APIC_LVTT(unsigned i
>  {
>      unsigned int lvtt_value, tmp_value;
>  
> -    /* NB. Xen uses local APIC timer in one-shot mode. */
> -    lvtt_value = /*APIC_TIMER_MODE_PERIODIC |*/ LOCAL_TIMER_VECTOR;
> -
>      if ( tdt_enabled )
>      {
> -        lvtt_value &= (~APIC_TIMER_MODE_MASK);
> -        lvtt_value |= APIC_TIMER_MODE_TSC_DEADLINE;
> +        lvtt_value = APIC_TIMER_MODE_TSC_DEADLINE | LOCAL_TIMER_VECTOR;
> +        apic_write(APIC_LVTT, lvtt_value);
> +
> +        /*
> +         * See Intel SDM: TSC-Deadline Mode chapter. In xAPIC mode,
> +         * writing to the APIC LVTT and TSC_DEADLINE MSR isn't serialized.
> +         * According to Intel, MFENCE can do the serialization here.
> +         */
> +        asm volatile( "mfence" : : : "memory" );
> +
> +        return;
>      }
>  
> +    /* NB. Xen uses local APIC timer in one-shot mode. */
> +    lvtt_value = /*APIC_TIMER_MODE_PERIODIC |*/ LOCAL_TIMER_VECTOR;

While here I wouldn't mind if you replaced the comment(s) here with
APIC_TIMER_MODE_ONESHOT. I think that's clearer.

I wouldn't mind if you did something like:

unsigned int lvtt_value = (tdt_enabled ? APIC_TIMER_MODE_TSC_DEADLINE
                                       : APIC_TIMER_MODE_ONESHOT) |
                          LOCAL_TIMER_VECTOR;

apic_write(APIC_LVTT, lvtt_value);

if ( tdt_enabled )
{
    MFENCE;
    return;
}

Thanks, Roger.

