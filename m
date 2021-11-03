Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B16443FE5
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 11:17:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220715.382088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miDK2-00005y-3q; Wed, 03 Nov 2021 10:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220715.382088; Wed, 03 Nov 2021 10:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miDK2-0008VZ-0g; Wed, 03 Nov 2021 10:16:46 +0000
Received: by outflank-mailman (input) for mailman id 220715;
 Wed, 03 Nov 2021 10:16:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cnt2=PW=citrix.com=Jane.Malalane@srs-us1.protection.inumbo.net>)
 id 1miDK0-0008VT-ER
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 10:16:44 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 240456ae-3c8f-11ec-8564-12813bfff9fa;
 Wed, 03 Nov 2021 10:16:43 +0000 (UTC)
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
X-Inumbo-ID: 240456ae-3c8f-11ec-8564-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635934602;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=LA+q9BOvPMAKMPqWR34ZneJsOyz3Xvj1ovS95lTqUk0=;
  b=VTYblxxG7ptohST6zpt4O0LDteghRZQVMn43ssztZiG1kYPu3v5yOMXR
   /zPNaOlW8pTR9qGFxmMz+4dXhcO2gm7d9AjslOGv45VBjCSK0HG8iM9pA
   SzKCXboq9fsC9E1RM4e+gGmGO6+txIaalrAzeXv7cMVK2PiY2yrjtc0bl
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: A3oNscJ1DI9DkUVpxRz2xRdLoQM4jBO7SR0VK+Kr0ggctV3daFYUhqnSGCipHVgd+x7/itt3V/
 ernZ7/h2pdLDmSuozK38rBqFq38/gPswszJWJyQlXMsgwbwm45yOlzasUBq4V+FlvmeWXv1Iib
 Ovh8VTU0ZoMp/CvegwprDgHx44kzYxSgp3oeQ4L0TTQe0eqEqLbbmXnOEt2QZtKCAwHkMA/Xjy
 veQdV72S2TiWLQWS3We5PmwWIPEUXAjq0cv//2hHwD8vjiEObfYhGztL89+nrs45z96NcBqOBp
 jBi+rP9MwOLyPuyKAsk2nGpm
X-SBRS: 5.1
X-MesageID: 57353191
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8fiq9axGQhJO6loNQDV6t+dfwCrEfRIJ4+MujC+fZmUNrF6WrkVWn
 WoeW2+AbKnfYWH3eNB0bo+/9BhQscLQyN5kTABu/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrZi2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt99V4
 vVstJbqcloOA6qVwdo6Vx5gHi4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoruYqKsStGYobs3VpyzzxBvc6W5HTBa7N4Le02R9t2ZsTRq+PP
 qL1bxJpYRCbTTFzFGwbI6higszvlEfDLBtx/Qf9Sa0fvDGIkV0ZPKLWGNDScNabSN5Vmkudr
 2Tu8GHwAxVcP9uaoRK79Xariv7KjDnMcosYH72l9dZnmFSWgGcUDXU+Xly9p/67hkegWsl3J
 Ekd+y5opq83nGSiStjmQxS5ujiKpBcaUNtLO/I240eGza+8yx2CGmEOQzpFadonnMw7Xzon0
 hmOhdyBLT5lvaCRSHmd3qyJtj70Mi8QRUcSaClBQQYb7t3LpIAokgmJXttlCLSyjND+BXf32
 T/ihCojg7Qei+Yb2qP9+krI6xqzorDZQwhz4R/YNl9J9SsgOtTjPdbxrwGGs7AQd+51U2Vto
 lALv+K+zeEEV6rQsxGKGbwzO7Wu3/uKZWi0bUFUI7Et8DGk+niGdI9W4S1jKEoBDvvoaQMFc
 2eI51oPucY70G+CKPYuPtnvU5hCIb3ITIy9Dpjpgsxyjo+dneNt1AVnfgau0m/kiyDAeolva
 M7AIa5A4Zv3YJmLLQZapc9BjtfHJQhknAs/oKwXKTz9j9Jyg1bPGN843KOmNLxR0U99iFy9H
 yxjH8WL0Q5Dd+b1fzPa94UeRXhTcyNmVc+m9ZQNKr7cSuaDJI3HI6WPqV/GU9c995m5a8+Sp
 i3tMqOm4AOn7ZE4Fel6Qi86M+6+NXqOhXk6ITYtLT6VN4sLOu6SAFMkX8JvJ9EPrbU7pdYtF
 qVtU5jQU5xnF2WckxxAPMaVkWCXXEny7e54F3H+O2ZXkl8Jb1Ghx+IIiSO0qHJVVnrr7pBjy
 1BivyuCKac+q81ZJJ++QNqkzk+rvGhbn+R3XkDSJcJUdlmq+49vQxEdRNduSy3VARmclDacy
 SiMBhIU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTOm4rima
 MVU0+r4bK8NkmFVvtcuCL1s168/uYfi/ucI0gR+EXzXRF23Ebc8cGKe1MxCu/QVlL9UsAe7Q
 GyV/dxeNenbMc/pCgdJdgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYsadEr2
 +YsvsIS+jeTsBtyP4bUlD1Q+kSNMmcED/ctuKYFDdK5kQEs0FxDP8DRU3ek/JGVZtxQGUA2O
 TvI1rHajrFRy0eeIXo+EX/BgbhUiZgU4U0YyVYDIxKCm8bfh+9x1xpUqGxlQgNQxxRB8uRyJ
 mk0aBElefTQp29l1JpZQmShOwBdHxnIqEX+xmwAmHDdU0T1BHfGK3cwOLrV8U0Um46GkuO3I
 F1MJL7ZbAvX
IronPort-HdrOrdr: A9a23:XS/l9K8curj5lfNr+Bluk+DcI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzsCWetN9/Yh0dcLy7V5VoIkm9yXcW2+cs1N6ZNWGN1VdAR7sC0aLShxHmBi3i5qp8+M
 5bAs1D4QTLfDtHZBDBkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.87,205,1631592000"; 
   d="scan'208,217";a="57353191"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+hZntU3QlWS4gXH5Tf0GRbjfNfmfY2Gznfx0xBryMSVHHZKYo2aKaRYYhyslso0HKWZqUwy4F59GoiZVg7RG4zuVebB7pudZcJWHPChCc8s+XPflpddHzdm5JaWumlLOcAbAaz8yzBmNuIHtSMSYLaglOf+OlDsBVOCn5fdu+8R/WUQd8l4vUWVfuZnf4CGZ32Dpy9JVCOUMCAolaDSMYF/Us/a0CKmvG6yNxk3H2nECMRAZR+sRQYO7MY7KxRzvVOju4BNNzXLDJ8yRWAjyAAz5NcfPElNRYqvVsu7yNOIl/JC/zQvN+NwfXtYYMiq3mZYBK0DKMMRtQ0WjxXTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e76gYoFEE1U/5XZzjhE4eMZALnGdwyEsgYPnh82HamY=;
 b=Xj9MAmQUoOi5WTkf1Yte/nqlgcLGg2TYrr8dyZ7fsb1JxDor5M754ICpcBp9Ue8T+LAouiHlcIFdbyiba3zicozcTTGPt1mMZMGqf9qHSKApiwSPpmB5ufmIlJclizaT1qJExQQRtESw7IWZEs5kkTCsIJNyMmIr/w/z7Jgmx66AyZpdwloMddjNmkSz8umS0FvFYi6VGNoNSu/oIQaLSGAzQ9Qo1jiYUXjjlzp9ZxsA3CvaaK/bcVrXk8jhszJPJN0E2Ia7uMgR/F7d30+Rfpw0Gj9OnFVK3BwpD7iBKm+K3FngqgM6jf9xr+GYqLMckfmBUi39V7+Tl0WdO3tlpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e76gYoFEE1U/5XZzjhE4eMZALnGdwyEsgYPnh82HamY=;
 b=j6r52Il0QFdWX5QgVyW5bYc7gKTvQ8RNG0lJJymdZCQh7oaTiNFIJBVlWJpnY4I08GtClw7U+Yls++eDktpPpPBRGJRXjdu4gKbnmi2ixxC5p9//+k6CsM0fKS6q8GOb1ThmHstgrxMOcqtxd40fxa4+t6+2kN4t15/DZUMQJ9M=
Content-Type: multipart/alternative;
 boundary="------------szIPHiIE3j04PJNBfH0WEAiA"
Message-ID: <0230a444-05f0-04e2-c20a-5bb22c0ef63d@citrix.com>
Date: Wed, 3 Nov 2021 10:16:26 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: Arch-neutral name for hardware interrupt support
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>
References: <b34c957f-8439-709c-d8be-cc2f5111c342@citrix.com>
 <YYD8L6MCrpytCkr7@Air-de-Roger>
From: Jane Malalane <jane.malalane@citrix.com>
In-Reply-To: <YYD8L6MCrpytCkr7@Air-de-Roger>
X-ClientProxiedBy: LO2P265CA0263.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::35) To MW4PR03MB6330.namprd03.prod.outlook.com
 (2603:10b6:303:11d::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72bb736c-b2d5-4286-e0f7-08d99eb30356
X-MS-TrafficTypeDiagnostic: MW4PR03MB6345:
X-Microsoft-Antispam-PRVS: <MW4PR03MB63455B492931720D3B6FD8F9818C9@MW4PR03MB6345.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ecVC/ZNKYtq7NzP18dD5V9zDoiIeqPhKGAGsORcIcYGmhdcydwYLYe4JjxHMql499L0d9luBLsTVhi6xr780NI//3untkN8qKpVaRCAnKUEIt/GG5iXB8QJxvxSUegpfTik73tesOuJuYMVLUrBPMmfvhyerB+tDzJ7DuOAZDb7Af4Bv7B86m1OHp17k/iGyCgfkwFbcXesa3oh3jhjCDKa3NkNyIFSbBzFhdk6fn2GifEh8dDBxvn2xOEwjNVxLT5LOi4HV0alRwwKZkpc019cju50pVC7TGNvK5109ly+JnRcihN2KxAWUv6vkHNS3+v0LJ6TZyqUAVhO72LXh5Ufp0itzEglN0DSktGFM1/k/opvIXA6kx6c2ZOPknSG7z9AoamrpSh28HZ5qAx+5Vp7S5Rz6OMlxJWk0lUilVBIy/bDHWS1ZntGAHuJx6FZIAC2Qc6FVw33Cxw+RvMsaqA5YOLXAy7gkHIpVmkLKEcw9uJD2U1Nedv3aEacL+Zbpiop+JlhRPGZtDpu1WL3oz+28qFURvre4YkWSXqLWby/HMiZ1uN8mcVwa4K9FOt6diSh2mtwihR/Va0pX6PPgIF/VQhhGQHYvt4gZ5kjPZSb5wrtpBnbHZ4nZxvsDpMRxoE0Xzoq/5Lc7LYB4tlBaXg5Q+WX6F/AJr3nrkdYbZoZPoJ4b1SXHN1BrlHLlCXp1rgAdynibh8yU12LkGiO0/21nBMt3PUuIgzOX46rpZZimIZ6/rQNIvg68h02BxNuLSednHoeyY5K/uIoGVaGMUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6330.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(6486002)(4326008)(44832011)(38350700002)(38100700002)(186003)(31696002)(82960400001)(52116002)(6636002)(316002)(6666004)(54906003)(26005)(33964004)(8676002)(83380400001)(956004)(110136005)(2906002)(508600001)(2616005)(55236004)(66476007)(8936002)(5660300002)(66556008)(16576012)(53546011)(66946007)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVhXWDA2WWNvMkQ5dVpqLzF4VkN4b3NCL2IrUlpjVnJzUm1uRWxWUmFNMVlH?=
 =?utf-8?B?Z2lRZTRoNlVnRWdPZnA1SUdubUtqNTZTNGZIdm9GNjVFaEs5aU50SUh6M1hn?=
 =?utf-8?B?bURlU0RoTEJ4RXEvcE5TNWZaNzJuWVBsZ0hENmNNbG9STXNMeHh2ak9JbGdr?=
 =?utf-8?B?RTBqL2c0ZGxQRytkaXZsRERXYm56WHQ4S2k2eTRIRVlmdW9IaFM0TG5YbUVW?=
 =?utf-8?B?Y1VTMUdMak1HQkVOVE5VSUdPQjFHemhTOWVPRDJpM3ExOFB0dS9PUVlDUGNO?=
 =?utf-8?B?bjNPR3Y4cnlidWxSWTFvaTFHWmFIeENXQzJUaDBXRzhtOHY0YlA2SE1iNk9T?=
 =?utf-8?B?clVkNzhUYmVYOXN5WFQ0SWM5bEhYYkNKWFNaaDVKNU1lQ0ZxbnNxY0JjeHpz?=
 =?utf-8?B?eUplQVVJT0xwNDRlVGI1bHNSYjB1cnlEdUNUd0syWkRITjBVaDZxQzZTc1hu?=
 =?utf-8?B?WDhoQUU2VDRETjFDcmIxWm0xb2tUQUFlUisxN0FNU2p5TnNydGdZSmh4djdS?=
 =?utf-8?B?M1ZTdm42QVJvVTlsdjBWZE00U2hpMnY3elBZSWZmNE1BRS95NzZEd2dkTXB0?=
 =?utf-8?B?OWR0UUMyUjJXM1I0T2thOWFrVE1OYU56eVJNRi9OemEwNCtjWmhybUI3cWt4?=
 =?utf-8?B?Z29XNEdvUWwwN1ltUmgvUUNCb21uQ0xyaEhlVFNlZXNpcW80cGNmVk1yaWpS?=
 =?utf-8?B?YXhDQ0NvSDBCcmpmbXpsZjNWWlg3S2lUMWUza3V2anlCTWd1QmxyR1pRcFFx?=
 =?utf-8?B?MlkvTHZwTkQ4STEvQTZydS9ZTElOM2dQWlgwZEN1NHVCUFY5Vm8wdkVtT2xS?=
 =?utf-8?B?c2lXR3VqVW1kR3VlYnc3WUJhM1FYU0lNS2M0amNpZG5xMm5wOGpVRWkxd1ZB?=
 =?utf-8?B?cXA2WHFFU09vTlR4U1h0QnFla3FpUjFrMGtLaHBSeVZqL2JMMjN6ZUR4QnEr?=
 =?utf-8?B?eG9DTFhzaW5DWkozQWZQZFpZSFB4cGlPZzdtOGpLWnJRKzkzVnhhV0dhNHlJ?=
 =?utf-8?B?TGZtd2ZTOVM1Yy9NRWxFYTJNSkxuQisxWVJCUnNGNEhSZTZjcnUyVjhGMEQw?=
 =?utf-8?B?S0xpaXFMR0hSQXZLZkx5L0pPcGlvUGwrbXR1WkJaQ2RqV0JwUnpYR3VqMmIw?=
 =?utf-8?B?aUdqYWQ2Sk9oVUtFMnExTjVxcWR5OE5TaDhZSU9wRVZGSWY2cFZnM2I0Ujla?=
 =?utf-8?B?SDVnbHFoSHlSU1BjbVlsY1pWVncvOXBTZGNkODNMR0ZGeHlEcTh4blEyYllI?=
 =?utf-8?B?U09Na3FyMDh0ME5xQ1Z3ajloOUtzVHJVNkh1QjdGbFE1bC9DUHBoWlZyeFB4?=
 =?utf-8?B?dGxQdUVHbHNtR0x0cDQ5eFlnU3cxMzVyQUtYMXRxK1ZCSDRHUDFaUnpBRVZT?=
 =?utf-8?B?bkphR0FKR2dMSmtMNzJjaytGWUprY0s1a05DWHppS0tRR2hNVmpDUHQyaE5w?=
 =?utf-8?B?Rk03b0wzclBIZnBiM2JnRDNYS2xnNjdhWEpBVWVYVXdVWUZyRlVncGJTaVdi?=
 =?utf-8?B?S0dUT09MNGQxRFlaZTQ2UEdOYU1CQ1hGZDVjeTF2NUt4TU5jNE9SZFIxRDRN?=
 =?utf-8?B?S3dmV1J4SkRjNXlVVXpnRHhMb09zKzViMVNra211YU5wSyt5MUlrNWtXQlpW?=
 =?utf-8?B?ZWpBWGNkdzJMRjQ3Rk1kNCsxbXoza2FxUnhWN3h6Sk95c3VVa205TldjWXMw?=
 =?utf-8?B?Q1JGNnRzKzFSKzNHYUhEU1dwZmNaY2k5ZHMxcUEyV0Q3djVkdFllNHFQNVU1?=
 =?utf-8?B?N1VEYVlFWDlTWlh4cG15MnZPMmtpMjFrSm1RQ1ljMHo4ZkdJN1FGRDhEQW9n?=
 =?utf-8?B?cTJVVGRZbGlSQWNFM1BYZnJOVitCS1FHbE5zSU91NVRDL2VkRm5vakxxZnBz?=
 =?utf-8?B?dGEvMzlKQzNhZDRyei9jODNKTXdXWmlRLzJHaEV4SmFRWWtCNWFhdzF2dE9i?=
 =?utf-8?B?Smx4Um9iaDJyTy9OSU5qT0ZXT082bXd5VzUxSXFubk1HLzJtL1NxRnRyRUR2?=
 =?utf-8?B?MWVTNnhrbXljRGR3RU9udkE1SkJxMytQbjZwTnBtSXdha2w3aHdRa1NpeTB4?=
 =?utf-8?B?R0dobGN2aldLNnJabUhQbkhLTnFudGF0bXVnMjZMMU9mcEdGbXhIc3RIKzNo?=
 =?utf-8?B?bXFMMTA2Y1JYa1pJNVhjc0tTR3dyRmMzcTZkSjdPY09xVjNWelozZERaOU1a?=
 =?utf-8?B?Z3BmMnhWU2h4SFFjL3NXKzlsN1M5MFhoa1hhSnRQbTc0NlBvMEpKOUNvNXRK?=
 =?utf-8?B?b1FqaHNrakY3MTluK2c2UlcxTnBnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bb736c-b2d5-4286-e0f7-08d99eb30356
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6330.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 10:16:34.5649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32dIJUkzzfHNzutcJ4UcFWzTxuo/sVwzLEmKvbfN/Sxb2xU6gV//DosUU1eQyOVZSpuyua83iEvvQvy9jPFK+wfe36UNpancdX2zFFDui2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6345
X-OriginatorOrg: citrix.com

--------------szIPHiIE3j04PJNBfH0WEAiA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/11/2021 08:51, Roger Pau Monné wrote:
> On Mon, Nov 01, 2021 at 10:47:26AM +0000, Andrew Cooper wrote:
>> Hello,
>>
>> On ARM, the GIC is a hard prerequisite for VMs.
>>
>> I can't remember what the state of RISCV is, but IIRC there is still
>> some debate over how interrupts are expected to work under virt.
>>
>> On x86, the story is very different.  PV have no hardware assistance,
>> while HVM hardware assistance depends on hardware support.  Therefore we
>> want to introduce a new CDF flag so we can control the setting per
>> domain, rather than globally as it is done now.
>>
>> This brings us to the question of what a suitable architecture name
>> would be.
>>
>> Hardware Virtual Interrupts is a little too close to Hardware Virtual
>> (Machine) Introspection, and Hardware Assisted Interrupts (mirroring
>> HAP) doesn't seem great either.
>>
>> Thoughts / ideas / suggestions?
> Is this going to cover both hardware assisted interrupt
> controller and assisted interrupt delivery (ie: APIC virtualization
> and posted interrupts in x86 speak) or just one of them?
>
> Thanks, Roger.

It's not going to cover IOMMU posted interrupts, only CPU posted interrupts.


Jane.

--------------szIPHiIE3j04PJNBfH0WEAiA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 02/11/2021 08:51, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YYD8L6MCrpytCkr7@Air-de-Roger">
      <pre class="moz-quote-pre" wrap="">On Mon, Nov 01, 2021 at 10:47:26AM +0000, Andrew Cooper wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hello,

On ARM, the GIC is a hard prerequisite for VMs.

I can't remember what the state of RISCV is, but IIRC there is still
some debate over how interrupts are expected to work under virt.

On x86, the story is very different.&nbsp; PV have no hardware assistance,
while HVM hardware assistance depends on hardware support.&nbsp; Therefore we
want to introduce a new CDF flag so we can control the setting per
domain, rather than globally as it is done now.

This brings us to the question of what a suitable architecture name
would be.

Hardware Virtual Interrupts is a little too close to Hardware Virtual
(Machine) Introspection, and Hardware Assisted Interrupts (mirroring
HAP) doesn't seem great either.

Thoughts / ideas / suggestions?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Is this going to cover both hardware assisted interrupt
controller and assisted interrupt delivery (ie: APIC virtualization
and posted interrupts in x86 speak) or just one of them?

Thanks, Roger.</pre>
    </blockquote>
    <pre>It's not going to cover IOMMU posted interrupts, only CPU posted interrupts.


Jane.</pre>
  </body>
</html>
--------------szIPHiIE3j04PJNBfH0WEAiA--

