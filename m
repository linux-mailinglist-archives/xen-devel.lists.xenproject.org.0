Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B2F358328
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 14:20:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107251.205029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTe3-0004eq-NF; Thu, 08 Apr 2021 12:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107251.205029; Thu, 08 Apr 2021 12:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTe3-0004eR-IU; Thu, 08 Apr 2021 12:20:23 +0000
Received: by outflank-mailman (input) for mailman id 107251;
 Thu, 08 Apr 2021 12:20:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A7yC=JF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lUTe2-0004eK-9q
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:20:22 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9348f01c-e5f0-4f45-aae3-5a6da1e777fe;
 Thu, 08 Apr 2021 12:20:21 +0000 (UTC)
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
X-Inumbo-ID: 9348f01c-e5f0-4f45-aae3-5a6da1e777fe
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617884420;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YekTlhNkbIV15dspazgDtUk/D+z1UBkzqLsyX1bZ1XI=;
  b=Z+lqUSiCrj+amG7XppCwEUy6HQHxY/SuuF07+h4izf17wTHRUwMMQY6p
   K8csGIma3mTKoLyoV9g8Ldx5bRmW74mYcf0ogUPV1v1ORkIZA9/xSrRQ+
   74esWqZ5d0gnYXR+hVfnFpPIMz8LzK+9CDG1ZPewk7ZEkRJOgcfWPwvI1
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: e/EW5tJA/Gl+k7s7KZW9i4eAmDL26KYH/j4aehXmNVrFJhUFKCPbKRq7peEhNafKYKR0+5JNDr
 QGqRy5umcuJ80iOYn45ETbufRVyOYwxSbQ8/ueqbGlrCxXEdtebph0xR/2WvFzrl4CpLK0SLFa
 AtxZjGCVKo5N++OepJpefCs1M+AC1ZJmNqIDKJBibEqbsHCgZXSd34POnkJQce+lQGtZNk3wi3
 qMMonyV8FCusJV9yuweBDQ1hXK93V+xN1DYyaRyVi/1cWwHKI7lNtOupAj81HXHaw4p9pN56yc
 0oE=
X-SBRS: 5.2
X-MesageID: 41533695
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:igCEYaEBglL8G1vEpLqFOpHXdLJzesId70hD6mlYVQFVfsuEl8
 qngfQc0lvOhCwMXWw78OrsBICrSxrnlaJdy48XILukQU3aqHKlRbsSibfK7h/BP2nF9uBb3b
 p9aKQWMrfNJHVzkMqS2maFOvk6xt3vys6VrMP/61socg1wcaFn6G5Ce2OmO2l7XhNPC5Z8NL
 f03LslmxOadX4abtu2CxA+NoCum/TxmI/7ehlDPhY76WC15g+A0qLwEBSTw34lIlFy6IolmF
 KlryXJop+Nntv+4R/a2m/V4f1t6abc4+oGPuOgoIw4Lj3tjyyheYhuXaaT1QpF3N2H2RIRv/
 Tn5zsmIsRv+1PdF1vF3ifF6k3b/xsFr1/k1FOCjnPoraXCNUwHIvsEv611WF/9ySMbzbZB+Z
 MO5U21nd5rKCmFuyLH693BR3hR5zGJiEtnq8E/pThiS4cEAYUhy7A3zQduP7orOjn104wjGP
 kGNrCn2N9mNWmXaH3UpQBUsaWRd0V2Gh+HR34LsdCO3w5Xm2hkz1AZyNZ3pAZ5yK4A
X-IronPort-AV: E=Sophos;i="5.82,206,1613451600"; 
   d="scan'208";a="41533695"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuPU9ayLbNydNnlkt8vYlKWMF5ipmkNk0mOk9rSwoJXHLkkJFN8Y4/IDsYtm3MTWVgsYGHWnF8Nzi5xBsB1iKMtVSEr2mhTII5LaSy6L/nzKcMkLRXjNmBPoTpn+NcF58mL1eVPiV/yPpkhQ4TNhls3Xifmtpf2fE6RJ64jO1nNBokAJ5KG8U58IvMsqo6T1OhzYTqKXTRlsX2acgf1rVWcS/BHp6yaN7gMlkTBnm9QmI2sRuZs+e1qQzdzEAx6R4tJE26E7LGnfTRtfEeNdz6TNKXEo9WtiSU3ImitMU6OMoMryqH8UTNc39a2AMNf+B2B02F2Ge/2pjhQvYwuhmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YekTlhNkbIV15dspazgDtUk/D+z1UBkzqLsyX1bZ1XI=;
 b=RDlzYrPlq6q/79+UJlBWcPplb1/9R0IFuZiWJlSFVfWQQ5baPhJ0bLwsqtje47fXrLxmuS/q5oRe+NWbRB10dXqVY6B6g71N/L6z+b/bH0nnpJFY8+YhPpY/2WUBKLRE6onKu92rytfPOsLjN48vavqHgTmC64nFAazKfTzkfRkPVy1UR7YNV1+byzJ2QOIZkd+i4xstxXrrX+eiVQwxnO88QXjkZsh/AIKCBvMhNyEYwd5/pJqY+ddx5c7WJRElG1pZNO1b0mygPQvPiHWbigFhUy/CbG/ABpSk5TbOU86uFh3M7kMDEmYdPtaHLIkjGVNqObJX67EM9fVAf0u0yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YekTlhNkbIV15dspazgDtUk/D+z1UBkzqLsyX1bZ1XI=;
 b=stnDfJW+4JU1eu1gU/Rdfbfc8DZ4dAhi2zDR+3jTUYnriPV85dT8tKiJfPY1eGyDQMoBQh3du48CEX12//NeHqWvCO6qStw7cK0ltRwR1RL+rAQb7Mf7HwmGDFtMrSCRqqL3IPdu5xq1+v3hCZ6gsq+8w8qkACz3d7e2oWWAbFw=
Subject: Re: [PATCH 01/11] x86/HVM: avoid effectively open-coding
 xzalloc_flex_struct()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
 <a6a27d6b-58de-1654-1f2f-8631a34a1281@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e74fcc2c-1731-c183-0e57-deb432a2a49c@citrix.com>
Date: Thu, 8 Apr 2021 13:20:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <a6a27d6b-58de-1654-1f2f-8631a34a1281@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0247.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::18) To DM6PR03MB3627.namprd03.prod.outlook.com
 (2603:10b6:5:ab::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01ce9c5d-7e1f-4d9d-ce55-08d8fa88ab27
X-MS-TrafficTypeDiagnostic: DM6PR03MB5226:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5226FB1381407C6C14B816D8BA749@DM6PR03MB5226.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eip6egwrsihtKG1GshCP7KQtH0oKsuC9dE6ZRTBRgcHDM4O9OVZwDgj+UdpLLm7hVqnYmcuUwLQ7poyk+pl4knckG+8Ibymy1ixYn5HkmAHdH5VLXdLks89wogD1sWs5zzmsB1a/M3L2eTKSS1HrsklzcL8gxl9LrgVmDe0qr0//chUn4B5bjcK4xSsUmsi8lkjvepNK4u4bDlG3aHXj5mVIQJ0BV+n6ffKXfNsHJQxHOMWVT2WyYAUssdkceKS3g5tZjv7fFPWFKgNAHig7+3ZJWX+tw57IbBGsJVOiGeF7qHm1L9qvnCPfaedNUMUxY+JJ4F1hePhqTx+e5dOQPNsN8Ry4LR9UCJc9HbkKIQ/ymuNl9ph+yHRTOuuO9Hg9DYRD0q7ZOXKt8SHtwgW4e6rVzdIY0Fam6u4904sdkKv/sW/Erey9CJCbF933eTRqT67G39Ujnfhr6Pi6JmziHKLE7q25OJG6bYdkc7NyDKvTzbBb/IkoyXGN6wlP7txH9UD+1voXr29ZpD4P9doLC5DdJwM0K5RZHXgPWpYuFapxEGwxIpcjZQ4LdhjWwGVhqEPAeve9kDd9crCsALPIQyHRO4kqEQ3HEsHkMVqXV6M0XJs3euM/0bnUThotW1v07kVAd+QSo8x05kfXuLqO5Tn1/MO80aYos5dhUcH4mcdURq/nyPnbIvO1c+MrSIv4K9Lyhv3zFgvjxwaksd/KuYq6LNqHbpR5NIoABu54BkE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB3627.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(31696002)(16576012)(316002)(54906003)(38100700001)(478600001)(4326008)(86362001)(66556008)(2906002)(66476007)(66946007)(36756003)(2616005)(186003)(6666004)(107886003)(6486002)(4744005)(956004)(53546011)(16526019)(31686004)(8676002)(110136005)(26005)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UFMxMU5HK1JHcHNBQnZlY0hMRWE3SXRFeEh0Nng5amgwKzU3N3NzU1loaGpp?=
 =?utf-8?B?Y0lYMXVISzc3Y1lSMUlRSW85T0dOdzUrbEFhTHhVc3pGV3FSb0xleklTaUhL?=
 =?utf-8?B?elQrNUtGRzVWSkJqNkFBL1RBTnMwNE05dXU1YUE0T2NzNUNRa2FxWlVpa2xW?=
 =?utf-8?B?bmEzdXI3VmUwcmRtbG4wQTd1WEM1djN1amtYcU5ZWXlOMUNudWN0TlFreFJG?=
 =?utf-8?B?S2VEQnFIZjUyVXMwdU5zNWJnZ3p1VkdGMGM3TkkvWDk5R05QMHR6bjNhS1Rh?=
 =?utf-8?B?ZWtUQnNnL0FXMWZZUkNjRmpIaW90eDVYSGVxVmt3WDFuWHNCMC9zRkFtR2FM?=
 =?utf-8?B?Mjg1bUsyVXVNOEJlYXVMQWl6RDhhb2xSVFFoUXl6QklxVy95eUY5TFlSV1FK?=
 =?utf-8?B?Ym9QSnhYdkpmVC9VM2gzYzJhSHhKZlhZRE1Sb1BqbGJDdHlrT1RROE1yWjh3?=
 =?utf-8?B?QjRJZk12dFB2dW9QK0Uwa1lxcUNtZXU2VHlweDJVT0g2c0gxWk5yVHpDSkZw?=
 =?utf-8?B?YTRkMURtbnF0TS9ES0VzdGhGQnBYRzdvTVoraFdyaVpZbkcrMkFPUFM5Zk1n?=
 =?utf-8?B?WGpqMTRnS3ppUkFrVkV5T25FRzhzbmozSkJKeEpYWU9iR1ZJU2ZUZ2RWODdi?=
 =?utf-8?B?MXlZMGNOcmp1ay8vVEdVODJJT0lUdERYS3prR2FOeTgvdndOSmdMbTlDY1hy?=
 =?utf-8?B?YnhEQytsaE1zVnc3SElPMXRZcmJHRWJTQlJDMys2YnllNUt4bEtEL0Mva25B?=
 =?utf-8?B?QmQvRHljVWdCSEdCeEZOUUZwSWFYQndTdGs4ZExObUlaTzVTRXJnQjJqNFo4?=
 =?utf-8?B?d0ZtemFwTDh1M0EyL3dmdHZtQ3FLM2p1cTNNZ1JYT1Y3a0h4cWhiUlQxQndv?=
 =?utf-8?B?MDZFemp1UnQ5aFhHUzZKWjdvWUlqaUlhMnF6N081R3dKZHNjRWhMU2RjQU9N?=
 =?utf-8?B?bE9pRXppU1hEOFRURWIxNERWTk5EaTQ2ak5JNDdrSEtGTTNCaThhUG1ZU1o4?=
 =?utf-8?B?aG5FQ1lReHNYeTE2U1BpeU1tRnV6cDE3akNtQVZnbUZaTTMxN1VQTXVtZmlP?=
 =?utf-8?B?Sy9jVG1YZTloU3ZaWnZvWS92dDZEMit2bkF6UGt4SlZTR2tZcnU0OGlzN0pW?=
 =?utf-8?B?a3JzSkFIWXl1blZlYTB6YjUyWXBYdnBFcmxtSmh1d250NkhDdzdhYmFmZ0hh?=
 =?utf-8?B?YjUwRDR3NElGK0tLTWRnR1FkUUdKaGN3ckJRdUNZRnU5ZXBEQXNiM1dNK3Rp?=
 =?utf-8?B?V3lNdzJaY1JrbjB2NkhMRkwvY0VUWnQvcnJQYllDblBMWW1jMXZtM0wxZDNq?=
 =?utf-8?B?emhzNlN6VGlGcW15b2FITkh6WWxJcmZ3V1VWd3k4YUFBYitnRDBnMDF2WGlG?=
 =?utf-8?B?S0xKN0FMa0E5a0lHYnhPYTJDVVN0ZzE5V2xla3NiK0pJMVZZWVpOVGJqV2ND?=
 =?utf-8?B?ai9lZmVJeG9vbTl5NkpBUFBzL3p6c1JQSXkwT2t0QlZEcDI0Yk9HRGxmVUU5?=
 =?utf-8?B?UTVSL0ljQk9sR1lTQm83Tkp3TDVpMXJkaVRqVzcrNnpTdTcyVVRSY09yazQv?=
 =?utf-8?B?dUJweDU3a3J3YkFuK1FXV2I5RFMyN3Y2aGtSWDIxUFE4VE5HOVNoYUZCcmw5?=
 =?utf-8?B?a3h4b3dqbjBFL3hsWXFWdVB3c0t4TWVEb21PamQvd3BCOHYrekdPNHZ0SHRo?=
 =?utf-8?B?cFNORG8vQTVTL1E1VEtOMkRoZGpPQ3VraHBEL21CVjAwUUtpalBjdUROWFdt?=
 =?utf-8?Q?Wrth687mV1Zi2bnbRjKS8eOYo6NilBN+YWorYBn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ce9c5d-7e1f-4d9d-ce55-08d8fa88ab27
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB3627.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 12:20:17.0212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ocR2ZQFYbRSygMfJ4wj7z71PSV5qDLM+xG9fY14kfw2a3xaC53UfeJDdI7oTdoRfqsU1BpeSOeAv6OvJoWTdkTG6MyF3qrpTE4PQMYB/Hh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5226
X-OriginatorOrg: citrix.com

On 08/04/2021 13:16, Jan Beulich wrote:
> Drop hvm_irq_size(), which exists for just this purpose.
>
> There is a difference in generated code: xzalloc_bytes() forces
> SMP_CACHE_BYTES alignment. I think we not only don't need this here, but
> actually don't want it.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

