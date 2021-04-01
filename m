Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC10351482
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 13:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104384.199643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRvZx-0002Nr-Jz; Thu, 01 Apr 2021 11:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104384.199643; Thu, 01 Apr 2021 11:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRvZx-0002NS-Gg; Thu, 01 Apr 2021 11:33:37 +0000
Received: by outflank-mailman (input) for mailman id 104384;
 Thu, 01 Apr 2021 11:33:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRvZw-0002NN-1H
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 11:33:36 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81af3c79-b175-4bf5-8366-e0d5e750fdd1;
 Thu, 01 Apr 2021 11:33:34 +0000 (UTC)
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
X-Inumbo-ID: 81af3c79-b175-4bf5-8366-e0d5e750fdd1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617276814;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=E9Bof/P9ivmijchbbNvr/d9Cs/Off1vuyFeRE3O+sMA=;
  b=H5zGFaPIB/enyJPrfTznVuNR31zuV6BcJatqolZDKBXuRjZ1k8XHPXpk
   NySOsFSBHKEcPeblKkbrUdWIhoJvy7oi6l9z5UF2m2Z7ORoyWSvRlqLkb
   EXdGWXgKDuwG428NSN7c4h4rqtFggbOclUobLliqjaQlo9SFJLuOpFBVA
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mscDtZEnalcGFKjeO3s1M7QK4wXEs7csF7O+08OM4S+MKx+ncWMFBEEGK7HKRfJJk63XeezxWt
 E+1oJbpKq17Okm3ud59Bi/21n89uvusUKl1gmZHehHD2MMvqBoBIzvjtsQJ/rDIcUEjsUk6zLv
 go1ScoVfRL88Iss57AhIU48ybLwHiMV8j+vwxZ0G8KmExkuR/vD5TBTQt1pXS0V2w0gxmN3LCR
 Xro8b+GqkbNxfPaOIeJSODhZL1rvKpzFhO9vne1Z3yCLIpTW4X1LUL3mqt1LUT3hyTkO7dJnrw
 hrw=
X-SBRS: 5.2
X-MesageID: 40821259
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:KUE5rawHTCXz65q03Me9KrPxg+4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnm6JdybI6eZOvRhPvtmftFoFt6oP+3ybtcheQysd07o
 0lSaR3DbTLYWRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRC51IxS0RMHf9LmRdQg5aCZ0lUL
 +V4cRarzStEE5nEPiTLH8DQuTFupn3j5rgexELHFoK7wOJgDOu5tfBYmel9z0ZVC5CxqpnzH
 jdn2XCl9memtyY6juZ7W/c6JxKhMDso+EjOOWggtUYQw+c8TqAS59mX9S5zUkIicGprG0nid
 zd5yonVv4Dlk/5WkGQjV/T1xL70DAogkWSu2OwpXf4u8T2SHYbJqN69PpkWyDU4UYho91wuZ
 gjtwny2us1fHGw6BjV3NTGWwpnkUC5uxMZ4IgupkdSTJcEb/tppZEflXklY6soJj7w64wsDY
 BVfaThzctRGGnqC0zxgnNi25iFUHg1A369MzI/k/3Q+T1XkHdl9lAf1cwSk1wRnahNO6Vs1q
 DqNL9lm6pJSdJTRaVhBP0ZSc/yMWDVRwnQWVjib2jPJeUiATbgupT36LI66KWDf4EJ9oI7nN
 DkXElDvWA/VkryAaS1rdx22yGIZF/4cSXmy8lY6ZQ8kKb7XqDXPSqKT01ru9e8ot0Ea/erGc
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5ISR0+OmMTWMYfn39arM8r7Ff7IK3IJS2n/Cn
 wMUHzYP8Nb9H2mXXf+nVz/QHXoVkvj/Y9hMaTT8uQJobJ9crFkg0wwsxCU98uLITpNvugdZ0
 1lOo7qlau9uC2X8A/zniJUEysYKnwQzKTrUntMqwNPGVjza6w/t9KWfn0X+HOGIxR4Xv7HCQ
 I3nSUwxYuHa7irgQwyAdOuNWyXy1EJomiRcpsakqqfoeDoZ40/FZRjfKBqDw3EG1hUlG9R2S
 d+QT5BYnWaOiLliK2jgpBRLvrYbcNAjACiJtMRj2neu0WarcQGXWAaQDaqbM6SjW8VNn9pr2
 w015VarKuLmD6pJ2d6qv8/KkdwZGOeB68DMB6If7xOmrfgeBh5SECDgTDysWBrRkPas2Epwk
 DxJyydfv/GRn5QoGpR3KrR/FRoTWmFZE5rZndmsYpyKHTeth9IoJq2T5v291HURkoJw+kbPj
 2AWzcULw907/2c1RKeml+5ZDgb76RrGtaYIKUocrnV1H/oFZaBkrseGeRIuLx/Msr1j+MNWe
 WDWgOcIT/iEdk10wiNqntNAlgtlFAU1dfTnDH15mmx23AyRcfIKFN9XrcBPpWy6XPnS/vg6u
 QwsfsF+c+LdkP/Zd6NxfuJM3ptKhbPrXW3SO9tg5ZOpq42vKZyGZ6ecTag7gAw4DwOaOPP0G
 UZS+BHxZqEHKlFVckbYThY8Vokj87nFjpgjiXGRssFOWgwhHraNe6T67XGqbATElSMzTGATm
 W3wml4xbP5RCON2r4RNrIoLUlXYEY67m5+/OnqTfyYNCyaM8VC9kG9KHmzbft0T7WEA6wZqn
 9Bkp21tt7SUyrzwwbLuzRnZopI7ma8WMu3RCaBA/RB/dD/GVOChMKRkYGOpQaybTuwcEIDg4
 JZMWQWc8RYkzEnyLQN7RLacN29nmsV131E4T9mkVbx2o+ppEfjdHs2QDHxs9FxRjlcMn+BkM
 Lf1/OXvU6NuwR45Q==
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40821259"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMkVWnh2LgXamTSc5M5KLVBR5JIwjmm44a7564tUZ+9ek0s/YRgfnBlJJCDIH4fgP8mckdY1OTyCx5AiADRRIh+Q/hoPwZOEt4XPpE76+RFgwrn7/uQHelEkCRff3nnFir/2qlDCQ/c0YCiuiMP6GCsshJvMauz5U/JhYiOfB4AMGX5BuOqZhmFioxq8+1+z25vr93qamRDPc//F0H41PgFz1+InFm4AUIysddXg5bNgw5FOfMvahVP2PR9SWwIuL99yjdA9fvRzM7QDXWLjtVj+9LNp7QsUzizNcYtp0cVARFFn9cSWFna+SVSVGx1XZ7MOsg5Jagp0bsMaDeLFPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9Bof/P9ivmijchbbNvr/d9Cs/Off1vuyFeRE3O+sMA=;
 b=mFqlwAtaWkMkvLbGE7cHKJ6131nyPSTEjfTRhnueAnczyfRLdpSaAkOHrg2arV024yYVhz1KuLVCZdhcMCA5YThubTTu36sTf+sXf1jpyvPQlXa2g3ghvTHnqR82R4Taz/68PxdDbcqA8G1SS6nl6lvH3UfdLH9j8kSpGq01LnNFwRoykyFTgaYLHCs+ZtyBxQHBqud6WHI8XbMyCTOQcmrKUwU/ToHHbG5+X5CiDUI1SzKuRd5rSKWTQLQJHJ1mHYY7wfLiuVtx6jgf+5h80P5WDYL9+q26M6QbQ/JjeaOGbxR1P3ImsLbtzatktQiIHQP5a30VyE9F/MTrN6lyWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9Bof/P9ivmijchbbNvr/d9Cs/Off1vuyFeRE3O+sMA=;
 b=BiL9k/CVrAgc/PRQnKOVDKfte72dddbYjgylMbvEaDVHDcFcXrNJ/WE+Sh1LIbYjE9Pb1TAtGLAClBANF3Q6MpnJB1mKxPNmn5YySJ7xMZWAPN0zBfg7k0I0isJjtAOAfKbM2xB6UAKsBFp6vYiFr4G9e2QfFe6R9PDqPuDxdK0=
Subject: Re: [PATCH] libxg: don't use max policy in xc_cpuid_xend_policy()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4fa05759-24ac-5ff3-3db9-94537f6be95d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9abb7b1a-990d-3783-39cc-52503dffda16@citrix.com>
Date: Thu, 1 Apr 2021 12:33:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <4fa05759-24ac-5ff3-3db9-94537f6be95d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0460.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::15) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d24397bc-0135-423f-208e-08d8f501f8cd
X-MS-TrafficTypeDiagnostic: BN3PR03MB2129:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR03MB2129D9255E9720EA9890B5E9BA7B9@BN3PR03MB2129.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z+567NJHXeSn+mRaGnVD683U4M32DmKLvdbYABTnmG3lqSBxYDkdMhpVezhBgZubf5mMzsv/ubHXf7uumJe20BwzNhQjMfWuhhpMIj6JtynGyn2sy+hCPo+rxMT5H5xQ2FM/jPvQH7C/YNYmjTpLrBdZSaDy80biple2AGsRrkz3Av5qeMwBY1wr0yEi10pZVsZxr+6l4lrWTXgo9cX7bQ5xjs1KrHGGiMNuRaDDvZbTQ1vTsI7NQsy8x1bWXQhcE6488hR7v8l0uRN0gvrl/sRyDZCinHBKembHeo6w6+uxcGDDUsm1kOggUHcq+hQFOtv97rdf5MhhOeBjSmqKi82iNmBbI4xZuiyqbWsCQcqGgFKliKCkLPhhcJxunF26GjfV+cCEchXkSC/uNZ84qGjpSAsVmA4VCnJeaSaNbZQPlwrAsRAYZa54gxwubabjmbk1nxVi7wyeg5IOB+6/BtX9BVb8GJW5ncc9nARdcYHEXkFpgSSPmAomuxXlQb720tnx7V6Bmugq6fwbR9JvlluJnx8pno3MWXDfK/mbFuRY4Fu/4qTdUjPvu3g4AtU15U9mtaiRtM5Hy38+J9USagq+3sChhUo879SnU8IWiijc2JHT50X3MM1WvQcMHW6ycwvUBa7+tivrPsC8rKW3sFoKiBvcfav9iXtrCRUft2bim4cC8wv0OY4z5wwNODf/AucfTbGyUsQfLHFPR7GmVE5Yb7ZV791uKz1bF11lG4s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(498600001)(66946007)(31696002)(107886003)(66476007)(16576012)(66556008)(110136005)(5660300002)(53546011)(54906003)(31686004)(4326008)(6486002)(186003)(956004)(2616005)(86362001)(36756003)(16526019)(8676002)(8936002)(38100700001)(2906002)(83380400001)(6666004)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Vlg2Vm5XNHJpenlNaElleGJPMVR2a01SQ1ZULzRRSzNlRHA1VWhaSHJtbjdU?=
 =?utf-8?B?UkNLOWZxbisrYkZyNDFRajkrNUtaa1oxdHp0WTRkeVphM3c0bTdKT3NvWThW?=
 =?utf-8?B?aWpNdlo3cGtOUDJBdmRWVkFLTUgvYVg0aUR6R21GZC9MVExlZksyVk1sL3Nt?=
 =?utf-8?B?ZHpkTXhZK29TLy8vVzRCRFlCRTZLZ1huYmZhZUZoTmpyTDlBME5YaGF3bVJk?=
 =?utf-8?B?bmlWM2hFQndHUDQ4T0RMYzRLUE5WNlJUMEZLVkFlNUxEY01MOVFsU0JPZ1V6?=
 =?utf-8?B?bjJCL0JSd21FQ1V6SDRRM1VkUnlwRTdWWVA4Skp6V3ZXSHJJcWE2RG1FOXJU?=
 =?utf-8?B?SlplQk9WTjE3YmE1aXBmYnUyNlZnZGF2bXdYSGdWQm9yYXlROEwzQlU0U0NM?=
 =?utf-8?B?M3NPdUZsek04SmcrRFpSenN2QngxZW4zUnhEd20vYlVRV2w1d0hUekxYQk1m?=
 =?utf-8?B?V3ZKRFNrN1FKWUJyTVJJdG5DY3l4YlJQRHRHVi93amYrQXhNZGN5M296TVVU?=
 =?utf-8?B?UmhHUDZnNkVFenkrSllyT2dWTklrUkQ3VTVkSFB2aTdRZ2czcWJQK2lwZjFI?=
 =?utf-8?B?NG5HenlvSEJPQTkvYUJOUCtkZ0JGZjNicXFxb3k3Tm5scHJ1MTZzR2NrMG1y?=
 =?utf-8?B?QlgwWU94WE9CcGZLM0QrVTlGdTl4QkxtckpzeVNJN09TVm54OCtqVkZBRWt1?=
 =?utf-8?B?NDZHbXF3SHFGd1RaK2J5Y1JxVkNiTS9MUkJhemxLMlc4L2pHWTh1Y2RPNVdL?=
 =?utf-8?B?Z1ZvQmZvcFFadUVCaVJQY3Z1UCtsK1FlS21XOE5QMEdqRmZmSktqaHFTNStL?=
 =?utf-8?B?LzdTWSs5QU9mRzZHQ3dwQ0pZRzFiM1FmMlFYTkYyRVlSMzdJSVAwSFFBejlP?=
 =?utf-8?B?WEsrb3hNMmpLRGI4ZXRaYjhzbjQ5UTRaRnRESkhoUGxlSTVHcThETlZQODJ6?=
 =?utf-8?B?UGJrWnNONHNiWm9ZeDVabGMvV29OU1grWGJhOUthU3RuaytCenU4TVJrYndS?=
 =?utf-8?B?QW5uc3BmaFMrdDdaT3dkWi81R2VnQS8weWxBek16K1BYMWIyVzFtbWVlTnJp?=
 =?utf-8?B?TDdNeGFPNVgrQjhBRVpTOHBoZVU2QzM0K3pZb1lHM3lyYitpMWoyc1lFS2Fp?=
 =?utf-8?B?MytLYlFXeTNXSmpULzh0bFphUlhPMFZTUWZMZHRBdk8xRUwzZkRmWGxHajBE?=
 =?utf-8?B?eTNlM3VLOWw1U1R3ZDhoZkJsc0FkRXkyMnZxYjNCM2Z1SVlKZFJ4dGY4YWY3?=
 =?utf-8?B?SjYrVXcvL25XcTJrQ0dyNEovajN4amd6NU9YRm1KMzlnT1kyQmVBQlhXelJw?=
 =?utf-8?B?K3htOXZLMjc0eXhFS3JPdTNkVll0OUh5eU1LOTZKR04xWTlXSEFUdWhVL1R3?=
 =?utf-8?B?YVI4MHFVUFlKZUluOUNmTHBTdjdKZ1dJRHRDL2xLVHl4WUxTaFhUNGFqTVFa?=
 =?utf-8?B?UFFNWTY2WHBFTTd4bk1RVVdjQXNYdEJSVjBoblNXRHZsanRSWDFlU05tb1k0?=
 =?utf-8?B?YXhZakZ5MVFJcXd6MzFLd1VaOW9ZZEs3VVNwc2FNMWJVTit5UFFOYzRGZzJu?=
 =?utf-8?B?dkxZTXljREoyVkRXYmxkRWlybVZpbEdNVlBLQzRtREpzRFgyb3RBczd5NHJp?=
 =?utf-8?B?c3pxRTVCS3Y1OHd2Yld4ZzY5RXh3MEc0OTNJMVVPVEFDWEszdGF3QkpiS0I4?=
 =?utf-8?B?dG93bG50eGtNdWt5TCtGNlJNOW1kbUtCV3pTNDRBc2l2VEpRKzFaMVRBbXhX?=
 =?utf-8?Q?NHbomT+ebv7BaD/ZPLldkqz93emkxoaetWiwfOH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d24397bc-0135-423f-208e-08d8f501f8cd
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 11:33:29.3319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: muVuPaAk8WiTXviEQQo3R4vcgclBFZYGd+/7f9B73oe0fal+RpstumTU5J9DnzVP9iFIiIJ3Y1MQk+OaTyY5PTy6cehl+hd5uzL3GJeSp1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2129
X-OriginatorOrg: citrix.com

On 05/11/2020 15:56, Jan Beulich wrote:
> Using max undermines the separation between default and max. For example,
> turning off AVX512F on an MPX-capable system silently turns on MPX,
> despite this not being part of the default policy anymore. Since the
> information is used only for determining what to convert 'x' to (but not
> to e.g. validate '1' settings), the effect of this change is identical
> for guests with (suitable) "cpuid=" settings to that of the changes
> separating default from max and then converting (e.g.) MPX from being
> part of default to only being part of max for guests without (affected)
> "cpuid=" settings.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This is a semantic change for how the xend string works.  However, I do
agree with your reasoning.

I'm pretty sure it won't be safe to backport across my change to
effectively eliminate the s/k options, but that's fine because it was
the same time period where I introduces a distinction between max and
default.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

