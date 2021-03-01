Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E783232802F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 15:02:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91537.172939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGj7G-0002Za-7M; Mon, 01 Mar 2021 14:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91537.172939; Mon, 01 Mar 2021 14:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGj7G-0002ZE-4A; Mon, 01 Mar 2021 14:01:42 +0000
Received: by outflank-mailman (input) for mailman id 91537;
 Mon, 01 Mar 2021 14:01:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RrjX=H7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lGj7E-0002Z7-F6
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 14:01:40 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28cbd892-144d-41c3-94c9-a9c4839e7bb2;
 Mon, 01 Mar 2021 14:01:38 +0000 (UTC)
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
X-Inumbo-ID: 28cbd892-144d-41c3-94c9-a9c4839e7bb2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614607298;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=O5AEz9nTmvG94Dz/cZ00sMyD8v8tmrNrIFGLwZqaMJE=;
  b=fw0rDzhBFYFXKNCgQKoVMlnaRo/nlVhiZkdDOFBdjlqOWzuyABtjShpW
   WfVMbVCBD20b0HtNxpDr6lxjy8DyzZV8Cryt+lxhUy6Lv3vvTPFLsm11G
   UftABkdDCXiEqs8rd6fQjN+KcJlNuIUAbfWaQCgpz0xZyld2H7HlmUt81
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rMLn6bj7Mxcp9bZvQjv/xeZlwnfurQ4gHBMWzf0587OqCyUPCvxkOjQB0NJuWcUcfFi9Txq0qz
 U2EN+NRxn2LdCk0c8YTZ31Z2cEZMrQrXGJtHZvUiOsNtcqyOG1ejVVLKCWhVTeJu+aqqwAUvm0
 dbT2Y5qXCb3w6C7HF3tHb8FvdHBioyiJ0VUSKeIcaKBWg3rQleKtfdXkAmWZMu+IAIb9IMNdhc
 qafBahFFhcw3pjws/cw05Dt8tFG3sRKKvpRsUK7OKYxnEnzP19nbuxsiIPn5yBejgF/oIYD4Nw
 NCc=
X-SBRS: 5.2
X-MesageID: 39636946
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="39636946"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaQtpyi+hhGoZnXIOJUIgUXbFCcGQeq1fsFY0y75PVyFAoFUHBWeEUYbpdTNXw3h5h+YCLPDHvZs5CMlZG73kpfR4zaHSD0d7fAjlD6MGjwmapCTE+Sh0kPIbwNagGYdXK9wrZ9nsyh9lxZMzSBmtXa3ooTR5DbHPCmqkeylbZTg6jXwYf8RmqFxCKPs1FjtGB85Eh36PJ9B59UhbwdYFX8OfNpCdPHBxNJdTfh8SKojZsSUCIxacYkrxGpIIdZbzUymjux5yOeZALSuFH+BmrAMViHBwtok150MBY6cw0fIoP3tSrMdTpuqcU+jd+GaAmOa/o6OqNpBR/+P7OH4AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5AEz9nTmvG94Dz/cZ00sMyD8v8tmrNrIFGLwZqaMJE=;
 b=JmsUifwB91IyR5j7bybixCSAjXBCfStIFgIDW3mA28qrF0Q8FmtQGk6xQRyaptJbAvLyBgxGosqr2gBEjun1OG/XB80bRCr2zIk8f7tWVpEHsKXXAKR0I4lFmYIGfl6A5Lf1kCNAiAwgOIqXLkRaU/lVYSKHK7+8YjwXJTpbQmocaqMaLIDPFYyItc4wj5pDsCeU9RYpIv0F0wJChat/4DZZ1HiqmFYRMRMsyVWL8NKRyhwQYE20QQt/9vmQOnNxurTIbLVovwRUSXN7e7iEqeYbjyVqaeIhLCUR3NPxti933GTemg16+a7JgMV7BaTunbgqYx0oA5I0f536guihTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5AEz9nTmvG94Dz/cZ00sMyD8v8tmrNrIFGLwZqaMJE=;
 b=Y2Xausy7RaT5Kd08+m2oyq76nLW+EQWczvKXCP6Fc0XV6bkU7qiOojwkp2s+CS59LWsPZvRDn/gfLRuX040WUPTd/QCbeYLmB2snVEShRWUYkdjsvbz6kbxzknEfRtmAKoy9hXAsQBswrpEF1R1Qa9bzXY8SFGwgFjI1GSdU1Ik=
Date: Mon, 1 Mar 2021 15:01:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH 2/2][4.15?] x86: fix build when NR_CPUS == 1
Message-ID: <YDzzt1CXau8vKCn1@Air-de-Roger>
References: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
 <1d8d5089-32a9-9c42-5949-8f9cd20f33e0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1d8d5089-32a9-9c42-5949-8f9cd20f33e0@suse.com>
X-ClientProxiedBy: AM6PR0202CA0058.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ee85fe5-65e4-43e8-d3db-08d8dcba85eb
X-MS-TrafficTypeDiagnostic: DM6PR03MB3740:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB37409D68E0AB89A4D6EFD8D28F9A9@DM6PR03MB3740.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lTV8hxWTm8VQvuM2XC7ItXCB7PkG2DX5DF/THOpzdY/PPUwjT+AaTcnAA5BibbynnRJUsHBZgHnAgBXvtEQGZ09f4wNUQPwHyyol8uGiE+AHDr03xExvMab5hs4o7LEUSZVS8JSF1p4YFYZfdYhGPEUP+1D55SkaXtj7z2aQdxIiQg76R9VcBAhxJHjgyv13o6ikBOZxSrSuXv2VVN6kJqvOYguxZXL3/INUF2xjgY3tTKqApbZVr+RlOucf+fasuBJMad4098ESfWRaS2j965ZyaK3AUf2uHJ/YM3cIpTAHqdtiqz7bwoftLyWViMih+ZNZD9XCtkV3bdsiUHOhfcUbm+E0WvXTX0z06ykCNmXsfVD0Szzx09x//LPKbkSS4f4kK696FRpWMdTxX4EFzU0wXyAMMmCvQX6Aj/O3pOD3Hxm6+qins5+OP7T+PkSsPPdY3NzJcSVLjb4Gn1bcsVq/Q+sHsf7eAr3wK3aELuUHaBujfGFR5lFBxYTbjhfzQCh5dHmemkI+m+jUXU5obw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(136003)(366004)(376002)(396003)(346002)(33716001)(5660300002)(2906002)(8936002)(6486002)(956004)(8676002)(66946007)(66556008)(66476007)(83380400001)(85182001)(4326008)(186003)(6496006)(16526019)(54906003)(316002)(26005)(4744005)(6666004)(478600001)(9686003)(86362001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R2FiaFZuTnF0ZEZWZ3FneUwwTUhqd2k5elEzQmlmY2wwQkUxcjlWMXFvSUZM?=
 =?utf-8?B?c1hRb2xpYThWS050UnNwc3BtWXFtSDhBcGh6SUhlMmh0dmcrbGJYTGN2M1kv?=
 =?utf-8?B?NU0vNnhKV05seWRZK29VTnNNOUUxZFFlbXBQU081cWltWnIyTWU2b083K1dK?=
 =?utf-8?B?Myt6Y0NHZ1dacUFkWHpxdWtTeUVySUYvNXBrZE1nTzNzTXJhdEtXTjJCMHJr?=
 =?utf-8?B?WVFTdmVTUGs5RnhaUnNrd240NzZQNzJsWHgwUUFzemtjV1EraFlHOGcwb1JK?=
 =?utf-8?B?Q3BJeW1VaFI2WFFwd3haZ1NXeVVHcXlOWDNiSWpMY0ViYjJmMTZVNGF1YlNp?=
 =?utf-8?B?RDVRMUV0UENoSjNuRXVidmNINHdXVGQ4NFlwT1pOQmc2R0tBUDM4bVN0ZG12?=
 =?utf-8?B?ZUJsaWNiNE9MN1EyQlNjcTRsN3luVHVHd2tOVENVRjMydWtTVytkckNkbHo4?=
 =?utf-8?B?MXYxLzZtMjF3S1JOVm5DNWM1Vldpa1l5ek1JNEdRN0FveE84VVMyQXRCMUhN?=
 =?utf-8?B?U1pzOW5yTU95cFRwajJEY1djcVBPNVVOcHpzWlpldTBqdjRlNUY5eXpoYUdO?=
 =?utf-8?B?WWViRWJIVkthckV4MThuTU5kK3p4VnpHdm8weTU5V0xieXNoMURObEppaTN0?=
 =?utf-8?B?Vnh2ZEZPQVFNS3ZlSW5UNTNTZWlHSUpqMFd5Z0xhZVdhdmxtd3RuTzluYlU1?=
 =?utf-8?B?bFc5eGlldTRPeDFmb0pmT0M0ZUF0aDhWOUlMckduZ1U3cXFTZ3JqL3BxczNo?=
 =?utf-8?B?VWpmRmhXTFVoUDh0UXRCQ0ZSMlNaU0p3WWVIdm9oTFBZVHBOZWpuVnpOWXM3?=
 =?utf-8?B?cnBiMDhVeTB3OU8vL0JLRkFZVXo2RzF3amtzeWRiWHQ5Q25BMmtpQitnVXZN?=
 =?utf-8?B?V0F0RjFUWUpySjcxRVJkWU1yL3pjVUM4S3hsVjRMZmt5K0hyME5jMVhDUWlo?=
 =?utf-8?B?a29WdmxJdVdhTDRYcmFaZ1NSclpnc3JOb2xxQTFkQ05JNnRjV0dLVmdNbFB2?=
 =?utf-8?B?RjdOZzNyU0JqNFRxOEp2VXl4UjkwU09tVkJpTm4rRDlheFJIdW1ndFFIcHJX?=
 =?utf-8?B?dFkvSDRKTHd5emFLZTZSUEpONHhpUGVHa1A2UVk3SXJYMHNGSy84RnFYeS9L?=
 =?utf-8?B?Ui9VOVVMd2M2N09HWXFBT0YvVnJQcDNERTRDVnljUVdad1lxeGJ1d29nd284?=
 =?utf-8?B?RVExWTdVbitWZFBEK29CdFgwMnhuYlZCVi8welhLM3hKVzh2Y2lBRUNvTEpo?=
 =?utf-8?B?dTJDODZ5a0ZUZE50bWdET1dVL0x4OERHMmVSYkhPZHFQWVNQMVppSEFqMEFv?=
 =?utf-8?B?c29DbGZHNWhUWnd5aWVVNG94VFVuSGNDWGVIbFIzMU85MnlMN3Y3VXZrc1ZR?=
 =?utf-8?B?cGdydFZ4STJpbUdaV3ZIUm1WZHZCZDBQK3dvZE53VG9RbDVUWTIvb3Y1c0I0?=
 =?utf-8?B?VDhOREdPL1QrdDNtL08wV0l5S3N4T0U5c3hyTysvUVB3Y21aQk5pSUUwVHFZ?=
 =?utf-8?B?cnJWV1VtV2RIeHJZbnJ2SE5yUm9VSWt5NVFkN1o0QndhOFhqbWdZMTIxNTNL?=
 =?utf-8?B?YkkrQVQzcUQwakxnZzRRaUVhYXEzUUlTSmlvWWtQMGREYnJnMG1LRUhvYTRN?=
 =?utf-8?B?K1VaZ3QvZDRkVThheHdzVXZSSDNwK1ZiNzI4U3Z0c0w2NVFGUDJvT3ErRHd1?=
 =?utf-8?B?ZjlHWlFIU21xWTdDajVTTnFFNFNLS1hIMmxGRDF6OFpPdmpRSlNpWmZ3QU5s?=
 =?utf-8?Q?7hcFEHFfZzneVlyxlXUPpzO98jF+VW3fj+OXx1f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee85fe5-65e4-43e8-d3db-08d8dcba85eb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 14:01:34.3052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQy8mSHv0qOZ/8qHomC5tmOR+sCsyKE9o3ii/AvyZny7aPAuyErXxvMCECYh0Yx5ZPCUVYILziGepiq4s1eFHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3740
X-OriginatorOrg: citrix.com

On Mon, Mar 01, 2021 at 09:31:07AM +0100, Jan Beulich wrote:
> In this case the compiler is recognizing that no valid array indexes
> remain (in x2apic_cluster()'s access to per_cpu(cpu_2_logical_apicid,
> ...)), but oddly enough isn't really consistent about the checking it
> does (see the code comment).

I assume this is because of the underlying per_cpu access to
__per_cpu_offset using cpu as the index, in which case wouldn't it be
better to place the BUG_ON there?

Also I wonder why the accesses the same function does to the per_cpu
area before the modified chunk using this_cpu as index don't also
trigger such warnings.

Thanks, Roger.

