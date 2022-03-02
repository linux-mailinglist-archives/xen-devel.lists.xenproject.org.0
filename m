Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C074CAA08
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 17:21:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282455.481168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPRjB-0002XD-V9; Wed, 02 Mar 2022 16:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282455.481168; Wed, 02 Mar 2022 16:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPRjB-0002Uw-Ri; Wed, 02 Mar 2022 16:21:25 +0000
Received: by outflank-mailman (input) for mailman id 282455;
 Wed, 02 Mar 2022 16:21:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LB9Y=TN=citrix.com=prvs=0530a50c4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nPRjA-0002Ua-LN
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 16:21:24 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc0670af-9a44-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 17:21:22 +0100 (CET)
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
X-Inumbo-ID: cc0670af-9a44-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646238082;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ujXqZwAfA+8GTDK8Ti/0+OUd7Q1Au1G+zo9WP3I37rI=;
  b=CH6/rmHd/WhJX2T2jA88ikR5V0hBimdu+yUGLh48FRoLNqkWAittdj+L
   Y2+Lkx1A4kgoC9/Fuo4AZ3a90fURcpoWkl7ZNnZQs6oJELxuyimRES9q+
   osamUX7x1ZjN4v8haTSlWDSmhWoaJBDuthoYc9ND6j0BTwgTsSdJT20uP
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65321239
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zFcgoa/aCYBQXn1Dem0IDrUDdH6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GZNDG7QOv7ZMDSjLd0nb9++9k0A78SDzdEySANqqCs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oDjW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbC1CiIYFI/oo946fEQHFXt/PoZn6KCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4TRqyHP
 ZFIAdZpRC3COxxjCGgnMtUBs/yarCbieTtitU3A8MLb5ECMlVcsgdABKuH9cNGQWd9cmEreo
 2vc5nn4GTkTLtnZwj2AmlqSgevIkTL+SZglPrSy/f53g3We3mUWThYRUDOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYDX/JAHut87xuCooLW6QuEAmkPThZadccr8sQxQFQC1
 EKNnt7vLSxitvuSU3313qyPsTq4NCwRLGkDTSwJVw0I55/kuo5bs/7UZo89Sujv1ISzQGyuh
 WDRxMQju1kNpeIOlICK13LjuAiLicWWSFQ05S72Tn3wu2uVe7WZT4Cv7FHa69NJI4CYUkSNs
 RA4piSO0AwdJcrTzXLQGY3hCJnsvq/Ya2OE3TaDCrF8r2zFxpK1QWxHDNiSzm9NO91MRzLma
 VS7Veh5tM4KZyvCgUOajuuM5yUWIUrISIyNuhP8NIMmjn1NmOmvpnsGiam4hT2FraTUuftjU
 ap3iO71ZZrgNYxpzSCtW8AW2qIxyyY1yAv7HM6nkU35ieLPOifEE9/p1WdiiMhjtstoRy2Pr
 r5i2zaikU0DAIUSnAGNmWLsEbz6BSdiXs2nwyCmXuWCPhBnCAkc5wz5mtscl3het/0NzI/gp
 yjlMmcBkQaXrSCXeG2iNyE4AJuyDMkXkJ7OFXF1Vbpe8yN4OtjHAWZ2X8ZfQITLA8Q4la8kF
 6ReIp7YahmNIxyekwkggVDGhNUKXDyghB6UPjrjZz46fpV6QBfO9MOidQzqnBTixALr3Sfii
 9VMDj/mfKc=
IronPort-HdrOrdr: A9a23:7wGUea2bc3lglMzVZJdGUQqjBVByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhRQpENRGtldBm9Ce3im+yZNNW977PQCZf
 6hDp0tnUveRZ1bVLXyOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mOryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idgrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1vDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amGazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCR2B9vSyLaU5nlhBgu/DT1NU5DXStuA3Jy9/B96gIm0kyQlCAjtY4idnRpzuNId3AL3Z
 WADk1SrsA8ciYnV9MMOA4/e7rENoXse2O7DIvAGyWvKEk4U0i93qIfpo9FoN2XRA==
X-IronPort-AV: E=Sophos;i="5.90,149,1643691600"; 
   d="scan'208";a="65321239"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5SttxiP6IjiZ4p/Gzh6mG8YawtIWJNO0V0haso10zw79lHgE3Ia9j9+X8mKcCa9FIc7XY0LrrMS6eK6L3Eg0M10ZOmw5PZna1ezzSdHQVfsMWMbHVaXqiMpVnkxB9jjapSwaQZqQ0BfFnKpwZzvv2whPD/Lwn0AUiyU/irjSPIcktnaQVwXWekCxcZgim52up/223OEkZlx2m/I8u5KskkNn3lHrsqUoawpYOZQ1YXQvegPvEnfIfnANn9cWOds7qbLmeGF6SJ7RLpKbwvYqKG/jr5lx6kSvWh7F9o2HvHgUCTs8Dc8UXuxCVFpENpCs1wiJwoE6mW0PDBkDjBrWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZpyGQ8H+L7AQnCTzm0R4LjWbwQk+nOrsSEUT6rC4ds=;
 b=OYXuBW85MqzgqKtTY4rA1JNDotF0b0sk7O5bwkas1j+XsZPPMpNwNnc+iBnhyvdLUeLOuxvP8qN+LfqFwJGBCbaIDPXL0zUlaFjRhqjYJuMhXxYGxI8692AxaO3xTO/lnzCTWRKK+10ZytBPWjHsKdPq7+gDcs1FZ69GA+nTnFJjlhSVS5pPyLWegK17tJF2Lj1BGfcqgDKRXFMBjIJKVV7ZBMRV7Zd+W6i3267uvWJ4CTxhmYQFnok8F00Ih9eZtW0h7F1kihhTtJYWgqQO5hUJ/7Qb0T9FWRNJX/eoWQRxR2tyryGAF028CHUnmrPP9fNcmdXVwNWuNNWqaFbPSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZpyGQ8H+L7AQnCTzm0R4LjWbwQk+nOrsSEUT6rC4ds=;
 b=dbfe7Vv+sjOL7zVbk3rjw6mplaothXYGM7XxUJF6OHZVAzp17JZbWUSheVdwljeyzBvDQlxU9gYcztNVHaPLYb8dgtfYapRRJS717IqSGI1qpWNMzYOh50l/2+c7StNjjnzy6CZMf6wH0l/OJ7xot6cI0NldwoTyydMDFYO0SpE=
Date: Wed, 2 Mar 2022 17:20:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] livepatch: set -f{function,data}-sections compiler option
Message-ID: <Yh+ZYbl6lKR008Yt@Air-de-Roger>
References: <20220302134425.38465-1-roger.pau@citrix.com>
 <f67e599d-4dfc-c98e-75ee-8510237cd527@suse.com>
 <Yh+RcFLjrtLk/ixx@Air-de-Roger>
 <4636a0d9-a96f-fa7b-3e08-595420b506e4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4636a0d9-a96f-fa7b-3e08-595420b506e4@suse.com>
X-ClientProxiedBy: LO4P265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fe3fcc4-15e0-46f1-2d2a-08d9fc689f80
X-MS-TrafficTypeDiagnostic: DM5PR03MB2940:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB2940BD0FB4663C140375590A8F039@DM5PR03MB2940.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U7S41yYkfx7xlNDZkN/pFmyn/FzfIWVUnMnlIcGlUdFSS1g/VIUNjgDRgaennV2YSBIwmAjyjX61tGNOJ36WroyGPoogvfR/bhPeRrdDHWh2CXd2nIIlvadoU92PNpvIKglqZiv31+QzKoRVj+hqqK+AeZKWJB2I5NaXHbyWrMoi7k6tCaILg4HIPWXnhfl2LBPk8ILzcHbbiM9kKRUGgJPMM1ongZ3Y8yDGhBMtZNhDGDJd0Wbxhp7sDE3+RUQzmCowokHD7OdM9KM6sLsc73uqqLpr5Wa5Uhr2Jk6WwGl6f1wVd7cLRfjr++xNxfRSeiN/O7eMiQBANjVsejHLD6OzvUy54L4GSPJEwqQ2IxA5CTs80CgvNKAXWFHzXh5p7qt5ZkNeTyu1G3ezil7kRfjrj8hRS867TsovVmXAQ+Tw8gOZ8o/87y6gOsVJ9x6WC93LvP9blRo3am0GAdOjnMPcVXUTzn7TqNCFQRDFC65EfVPpblQnxqQYq0uIghMl4iOCNe1HAkpOZyJVBBLjPoHRblyXnxSxMqakDQskUbcaqxVMUoqnRIXpopz93dxDJSNKnesKj3lc11FkvUfz+NAtff9LjJ+tDN0WsUmrTyz6VmNaewQQODHiFBmx41U1a0Q0GrLtpO7VJqBAA9EutvYlCc89dVtxi4N7+k8UAvCFAxghnMlHVrZzVUkfEYqgL8667w1eQhD/Wa5FzrXylg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(86362001)(8936002)(8676002)(4326008)(66476007)(66946007)(66556008)(33716001)(85182001)(2906002)(6486002)(508600001)(6916009)(5660300002)(38100700002)(316002)(6666004)(6506007)(53546011)(82960400001)(83380400001)(9686003)(6512007)(54906003)(26005)(186003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWRSSXpzQ2RpMGRhZllmVGRGWHhkeW5EVVhDNmhpUEViM1BZbEVBbTFQTmZr?=
 =?utf-8?B?OVIzUXJMRGNxUGoyc3RxeENacCtxNlRaZTJRWlRVN1RMK0NQRGVSdDNjdE1K?=
 =?utf-8?B?MnlrUjBPTktWM2xDN3QyN1hPL2cwQTkvd1l1RkhVVnhUNTFhdXVJQ2dJdU1Y?=
 =?utf-8?B?Z2E1NFllUzI0MjBPWUsvUGdXbW54U2F5ZWtCVVIzZ0dIYVFCaS9LVU80U2wz?=
 =?utf-8?B?VW1WQWk5dnZEcmtJaFJFL3grZS8wZ2txWEpDNGdoWUpNYVNTeXQ4UFZmVEVQ?=
 =?utf-8?B?SnNIdEpEUHBJVm5FblhPRy9QMjVKZk5OcFV5SzdYc2w4Y1JTaHhYSXZRWHhx?=
 =?utf-8?B?WWtQYzZMb1pXc0ZvTmhKQlRrMnpGZkk4VWY5eFBNRUQ4b1VnSGdMV1hWZkVI?=
 =?utf-8?B?WjZNN3VqQWQ1NUsydTFpKzJ3TzAwSVJDTllqUWFhRGt1c09IT2M1NDNsb091?=
 =?utf-8?B?aTZ2dUpVdGdtdzVKNkZhbVhwT0Y5Slo1eGFSVHgwc0FoU1pDZjV3ZWFFa3gw?=
 =?utf-8?B?aTVqTWJraVUrbHNRYWxqOUFRZmdHSGJrMno0U1JHc2dBS0R6dEQzSVcrTWEx?=
 =?utf-8?B?a0p2V0RCRUgvazhLdVVwalBBdFM5RUpnSUdJaVlJaWptY0gvZ3FSVEVaYnZq?=
 =?utf-8?B?WTZiQUNOQk4ydG5vK3c2Wk1DQmNXN0J4RHM4WDdPNCtvdzZFTkdvTk02ZUln?=
 =?utf-8?B?RWRhVWJlTXdhS3JpLzcyL0NnbEtJZ0JsMDVpRm5kTUM1YXdtbjd5MWdlRnNQ?=
 =?utf-8?B?cTZ2L1ZodTJqYzBhN2dBLzA2eFN4YnI3bmRVdEY4djhOc1hNZGtncU9sY3FO?=
 =?utf-8?B?MDBxaGZsbjcxZVZTOGdRbXB5MXZ2WjdFSS9Sc1lOdHhpdytjaEhyeEpmSHYy?=
 =?utf-8?B?QzhYY29VZUNyaEVPUGJHSytOSmJaRzF1aytMMnVUUVhtYkN5Sm1TTWEvM1hE?=
 =?utf-8?B?UFFqTFptNHY2YU8vQUMzQTYvK0lCY0hhM3dabnd5QXdybWtiSWd1MXpzVmJN?=
 =?utf-8?B?cFA1aGd5RnVTV0pWb25rN2hITHUrYktZV2NJVlFZN0RmdGhaaUlFRnhkenlw?=
 =?utf-8?B?aHkyRDhRakw2cUIxbStrb0dGWkYrZ0swS0dTOFE0VFhpWVJSSHBCL0lmbmJ0?=
 =?utf-8?B?TWpiWWVkZ3d5NENwT3FZNGxNOEw0bUVybUZTdnhYVzJWY25tTHhVVTJtSTY3?=
 =?utf-8?B?SXRjbGIyWkhIMlBzaklNbWRvZmRENUkwYkZFVERWeGw5bkoxR2xRU1FTQkln?=
 =?utf-8?B?WEhjWjRLZGJER1NtNUFKMnFNbmpVTWdCQ3dBMDF4ZzZaR25UZFlBL0hReDll?=
 =?utf-8?B?MUg1SitFRUdKTDFjZjB1dWpsMEVGZVdrMkM1MXprYXJLdk45blY2ekVwWW5C?=
 =?utf-8?B?Nk1SR3Z0Y01NSGtOcVU0SEF2aEQrdGcrVy9pMXZReHBDVUJDdnNkWmVONUFz?=
 =?utf-8?B?bG5kNVl1bk9lYWxvcWFzSXdyYXl6cG1SLzRvcjJqL1luUVd0aVNBYktyamRY?=
 =?utf-8?B?bW9GZHVvVTdCZ1I4bmRPeDVIZlk3YWFoU20va2RUdWhSZFdOcUptU1ZqQnpv?=
 =?utf-8?B?Z1dMb0tKazRnckoxWStvUnJwdUlCdFBGYWVZZktScUgxM3ZlVXgrTkJMOHFq?=
 =?utf-8?B?L1lKS0lzSTFXWUppQmRNWE82dEVuMmtjcEJReHR5b2hTRnBPaTJqTDhSSFYv?=
 =?utf-8?B?VkcxcCtOYy9jT0FmOXlnb2c5dHBsUWVmR1pPc1VndnBqNUo2REo4OFl6cW5o?=
 =?utf-8?B?TTNpOHljWFpRRzQ0Wm4zYkt3c1BzY3BVdDZKaW01TVNMZTZLYitBQjI5dGZu?=
 =?utf-8?B?Q3ZHelJFbi8zVW5DcE1RWDYrVzlZai82UnFVcHRNbFVteER4NkxJZlBYODd4?=
 =?utf-8?B?NTZEUGtpSGZudk5OeUM2OFdsUGlMODltY2RWTlFxRmxrVWNaNW52a1R5Y0VI?=
 =?utf-8?B?Nk9QV3ZFN2NjOFFNR3ZWa3VoYTVHVTVzOTZwUC9CeFRMUWNuaEthVjNCWGVP?=
 =?utf-8?B?cElleGhMaXVIU05uMjhnYmQzVnA3N3hHRTFKdWw1cC9GSTBIWU55MVJzaExx?=
 =?utf-8?B?cmx1cUZIbk5odkdGMWx6RzBnRlRZUFN4bDdObFRQeTdXd1o0K2R0dTBjNHJQ?=
 =?utf-8?B?ZHAzdUllTGM4blBVa1BJZGMycHdsN2d1T0lsYW45V2QzaWZqMkVabm9LdXFC?=
 =?utf-8?Q?6f4iTIGgb7tLJaBNeJyBSj8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe3fcc4-15e0-46f1-2d2a-08d9fc689f80
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 16:20:53.4286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6iijZYmnzvfvN7xeb5Upx72ycujhQBkMzE+Fv79CFvNWG1vX33rik7BMTg/gNGzygkSn0D/Mm1F2RWX01YB5qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2940
X-OriginatorOrg: citrix.com

On Wed, Mar 02, 2022 at 05:09:10PM +0100, Jan Beulich wrote:
> On 02.03.2022 16:46, Roger Pau Monné wrote:
> > On Wed, Mar 02, 2022 at 03:41:21PM +0100, Jan Beulich wrote:
> >> On 02.03.2022 14:44, Roger Pau Monne wrote:
> >>> @@ -292,6 +295,9 @@ SECTIONS
> >>>         *(.data)
> >>>         *(.data.rel)
> >>>         *(.data.rel.*)
> >>> +#ifdef CONFIG_LIVEPATCH
> >>> +       *(.data.*)
> >>> +#endif
> >>>         CONSTRUCTORS
> >>>    } PHDR(text)
> >>>  
> >>> @@ -308,6 +314,9 @@ SECTIONS
> >>>         . = ALIGN(SMP_CACHE_BYTES);
> >>>         __per_cpu_data_end = .;
> >>>         *(.bss)
> >>> +#ifdef CONFIG_LIVEPATCH
> >>> +       *(.bss.*)
> >>> +#endif
> >>
> >> ... are these two really in need of being conditional?
> > 
> > Will drop if you agree. I didn't want to risk introducing unwanted
> > changes in the !CONFIG_LIVEPATCH case.
> 
> The only "unwanted" change I can imagine here would be that we place a
> section which the linker would otherwise need to guess how to place,
> for being "orphan".
> 
> >>> --- a/xen/common/Kconfig
> >>> +++ b/xen/common/Kconfig
> >>> @@ -353,7 +353,9 @@ config CRYPTO
> >>>  config LIVEPATCH
> >>>  	bool "Live patching support"
> >>>  	default X86
> >>> -	depends on "$(XEN_HAS_BUILD_ID)" = "y"
> >>> +	depends on "$(XEN_HAS_BUILD_ID)" = "y" && \
> >>> +	           $(cc-option,-ffunction-sections) && \
> >>> +	           $(cc-option,-fdata-sections)
> >>
> >> Is this for certain Clang versions? Gcc has been supporting this in
> >> 4.1.x already (didn't check when it was introduced).
> > 
> > I've checked clang and it seems to be prevent in at least Clang 5,
> > which is likely enough?
> 
> Clang5 accepts the options fine here. But that wouldn't be enough,
> ./README says "Clang/LLVM 3.5 or later".
> 
> > I've added the check just to be on the safe side.
> 
> Well, yes, if you're unsure and the old version can't be checked,
> then perhaps indeed better to probe.

OK, so I've managed to probe clang 3.5.0 and it does support
-f{function,data}-sections so we can drop the check.

Thanks, Roger.

