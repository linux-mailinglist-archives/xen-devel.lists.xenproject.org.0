Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EDE78574A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 13:58:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589183.920976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYmU0-0006gX-5q; Wed, 23 Aug 2023 11:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589183.920976; Wed, 23 Aug 2023 11:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYmU0-0006eI-31; Wed, 23 Aug 2023 11:57:08 +0000
Received: by outflank-mailman (input) for mailman id 589183;
 Wed, 23 Aug 2023 11:57:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/AP4=EI=citrix.com=prvs=59274c529=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qYmTx-0006eC-V2
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 11:57:05 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b5188b6-41ac-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 13:57:03 +0200 (CEST)
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Aug 2023 07:56:59 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5487.namprd03.prod.outlook.com (2603:10b6:a03:284::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 11:56:56 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 11:56:56 +0000
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
X-Inumbo-ID: 2b5188b6-41ac-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692791823;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dO8nthrLPK99O/mOiQpQJjzeKKBVcHN/o2qICtAJ/XA=;
  b=Us9pGnWnHT2HH40iwbVzEIvXN2Mu0izygjsJHEX/VE+SerEDeUuaY8Pz
   QnviSiRPyBqtZL5GG6bUxGLhbuo50WuzTwGYtufYUcGfomQTgYDQ1yZ2+
   memVJGCCtOr3+fW/ndzVjkjy50X8+IuH+nMbyxfq8XUhMRoW4bA9wIAj/
   0=;
X-IronPort-RemoteIP: 104.47.58.102
X-IronPort-MID: 120252634
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lDqlEKKpDAZOWjSkFE+RApQlxSXFcZb7ZxGr2PjKsXjdYENS0zRSm
 jAaXjvVb62Ka2X9fo1/ad6+/UtQvp6GzoAxTQVlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA7gZlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5oHEJp1
 d0HKAwPRT7drbuu2pWFVOlj05FLwMnDZOvzu1lG5BSAVbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGLlmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHmjAt9ISubknhJsqEGy+0E9Ej5Gb3XlhqeipGS+cuNnN
 ENBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQEnsIrQT0h1
 neSgsjkQzdotdW9Vna15rqS6zSoNkA9L3IEIykNTgIH4tzqiIA1kh/LCN1kFcadjdDrGDe23
 zGDqgA/gakeiYgA0KDTwLzcqzelp5yMQgtr4AzSBzqh9lkgPNTjYJG041/G6/oGNJyeUlSKo
 HkDnY6Z8fwKCpaO0ieKRY3hAY2U2hpMCxWE6XYHInXr327FF6KLFWyI3AxDGQ==
IronPort-HdrOrdr: A9a23:cgB4uq3BoCBBhab9BoMVLwqjBfdyeYIsimQD101hICG9E/bo4v
 xG+c5xuyMc5wxwZJheo6H9BEDtexLhHP1OkPos1MmZLWvbUQKTRekJ0WKI+UyCJ8SRzJ856U
 9qG5IOd+EZZTJB4foTi2ODfOrJD7O8nZyAtKPm6zNIcCkvUqdn6m5Ce3Sm+o8dfng5OXL8fq
 DslvauYlCbCAUqh7+Adx04dtmGncTPiJXlJTYeHnccmXCzpALt0qf+Dx+bmjwDUzZDqI1SjF
 TtokjC/6C+tPP+7RfZ2wbonvNrseqk8MJHGMuPzu4KLTn24zzYArhJavm5pTUop+Pq0nYG+e
 O82ysIDoBI8nbMeWPwmxf3xAX69z4r5xbZuCSlqEqmm9X9WDU5T/VMnphYdByx0TtbgO1B
X-Talos-CUID: =?us-ascii?q?9a23=3AeAn6Z2lSHvpfJjo+CR5HHLf1l/jXOWLA71DwAlC?=
 =?us-ascii?q?4NWRCZuO/EEeK3516k8U7zg=3D=3D?=
X-Talos-MUID: 9a23:4DT4Cgox2OK2adSbJp0ezy1DCepG+Yf+Mm5TtssdleOEHB1IJDjI2Q==
X-IronPort-AV: E=Sophos;i="6.01,195,1684814400"; 
   d="scan'208";a="120252634"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Df9h5AtUEKrQz+/FkAf9nUlAhbaIJqPlibRlHByBcHU5odc946klmtRjHhIm//3FoBf0avlBWomDl2RHlRB9Aab/7KvKTqfYLI0kqXurqeSlp1bxQPdLIg02PF5aK1zmwDPk9TTT+eddoRvGEJ01kWS41q2qdhr59EmzXIgcrPNGm9tmrqscGY8TVVHMGe+bn0aPuk5+7X+vS6l0V3ziMd4E8YtdlpnQFP7AlVGbXLwZijWiKa2WMRpmQl7TOoOVhzgny1zZsiwl6Tr0Wl53z950fsKz4YNcovI4YoFZih2X5vEKHuSJAIcAK9jrZv7nd4pdYSHBlTOnMxJHRbJx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0Wug4dijtKcrLO1XSoqljFh6bVixogOAiEtJ8eHht8=;
 b=k8qKI8Eg+iWKh21hjXfFYUac6LEB6e92MFmGB3rzoQEqghUEuvHuBfP+37kNA0FWDC6R+RKsEVYc08j8xrpt7FP226EHVh1BP3KJF1dsUmP9xYgPEQ/ZL9uuI+QCWB6v919ndzddsdbR39U8f4Me8dTaAMyh5h2GdSiofAogz7ajqmKmDt8DlQJ4Rzsw2kWoNhMC/DGpSAP/0Z2kYx31jjiJtRSefHXG3XRxkOGzhIJEY7F6W7uPOBwtSQFXNdlVLV6xg9a+ESBQ0YIyUNxmPe+FBWq0RScaFzwGS0aD71I/SlAh2CMOKO7WO64Ey6ZJT78Fni61yWZgLkaT3hLZ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0Wug4dijtKcrLO1XSoqljFh6bVixogOAiEtJ8eHht8=;
 b=tw6K1mNxfeERLLnXueDw3klk5Sc3AtWLXSM8hU8Zxzh4O7A8h+Eg+awiR9eY5XNHvnOBgmnV6yFaa4sxon9ev+nAqpsrey33AJcyXSn9WRn44hKScO4PotAYk9W306dTYdjUy+VTmCTd1dpgzFBVJfVIcOMs3ezjrbUcXuFj6M8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <327109c1-f8ad-f8c4-01b9-ea19dc5df247@citrix.com>
Date: Wed, 23 Aug 2023 12:56:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/vmx: Revert "x86/VMX: sanitize rIP before re-entering
 guest"
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20230405215245.2137356-1-andrew.cooper3@citrix.com>
 <ZOXqQrFOpofVR_B3@MacBook-Air-de-Roger.local>
In-Reply-To: <ZOXqQrFOpofVR_B3@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5487:EE_
X-MS-Office365-Filtering-Correlation-Id: 72c80e8b-a9d7-446e-bbc7-08dba3d00c12
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V0On7ynHOLx13kJ96YJR8rzBsnLAxpLHWrZfLddY4pEHUOITMSEkjNNrZ6juTPsBuWEBo1s8Q7vz5RSEcP0/2PFr6B2gS3gerDwJUfewDVzXZbjPNsrwRTQIuqtHgDQwMxoElW/7l7kwbLnt1oC7FvTMRxbEMDQrr0fqKt2Tqoy8wmK+GrQmMzWMjpRu8f102e8F92UTUaCtB2uRZKAgsGQ9cy832Lwnl7/S9tW3GPKFPDjDdy3BVARgd+SymyH+Xwl1KPgiUtJLaOBL5ROPpWXxB27i3utm01AQawWvGFNmzleMMYcDBMYOqw7mCVpvCThgQROwuovad2PS3Z7r+iwzZ52+jX89Yu34vqRwUIHVaqJLfuHW2BpkwdfvWn3Uz5Z/5qyvN1C03XE7zb97yy0SkrCzkxP67Mw8mj2NKusl5zUoeSB3ppYOTdE99zDoe6woI5RToQbqGQrtFqHp7SzOw0TXAWK1hTMeD0lx0zpGcHczSY/tnPaEDgXCN9GSf8kX4WJgOXFCeYU5nG5XAUv7217WumGvxROeVRuHBTLosBiYtSEpKqipHem5cwVBf6YjXkO6BBGO/daER17I5Rs2CWfw/Dads5o6v1qskCGe4udYDoOGYzVewcawgLJTCNZaHE3OQubpNsUzzrOFUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(2906002)(83380400001)(6506007)(6486002)(53546011)(38100700002)(5660300002)(26005)(31686004)(86362001)(31696002)(8676002)(2616005)(4326008)(6862004)(8936002)(316002)(37006003)(6512007)(66556008)(54906003)(66476007)(82960400001)(478600001)(66946007)(6666004)(41300700001)(36756003)(6636002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDc4bG1vUzl6NjhiRnUvdmp2V3hnZHhldmRNSFVoNXc5S0dKT2FlRHY4T1pF?=
 =?utf-8?B?TzNWNzJMdk9DNlROcUl3ZHFEbjBDTmhvMTdmZ0NIUkNMWXpKcnZXOXlHWUIz?=
 =?utf-8?B?NmV4M2VUaGQwaTlyLzZHTjlRUzJlK1JpLzNndjJkdm5VVHc4ZG01T3V6Yld4?=
 =?utf-8?B?Zis3MWJ5Q2ZBWHBNSVJRT09KODBWZjdvR0RxUHZmYyt4M0luQldsMXdacHVM?=
 =?utf-8?B?WVpQaHBwWEw5TmdMcUNzOHRCOE5tdjFTS3ZlcWI4M3hUL0NhanZtbDJ3MXli?=
 =?utf-8?B?UnZLVGlDM2lIaHhHZXRBdG92ajl1L2ZxNzU2M1VVZzNPRHNxQ1E1YTZoVWlu?=
 =?utf-8?B?RHc3OEMrYkg2TGJnZ0lQZ3NpNXhiOEIzLzhIWUhBN3BlaHRNNys1S2Q4L3RE?=
 =?utf-8?B?bDZlUUgyS2xwWnRDcWN6RHJFWjVBV21ZWTBrTlFnSGpHNFRSYTZ6b0ZGUU1k?=
 =?utf-8?B?VWp1MUcyY0pDTlFVTjJzcXNjKzNTOEFYaWo0SGN0MWFuTmdLazlNalkwR3Fu?=
 =?utf-8?B?SnpzSE4zYzhTZG9EdXpzQmt0c2c1enZvMVZxQWQ4MzBnS1lyYUZxdjZWdGRL?=
 =?utf-8?B?VkRSaFkwQnhValEvbG0wejZEUVRXTy9oZ0YxdUVrUjJKR0l4MlhEeWVYdFZH?=
 =?utf-8?B?OTcwbjc3Y2dFbFVYMEh3SEwyMlU5NVhIL1UvcFNFdXVTdk53RXZzT3VJK0Ra?=
 =?utf-8?B?UTJTQWpsMDJiUnZ0dEtSd2dpWHhFQlBCU1ZFeE5DaXRuNldsWlpnL1FqRjR2?=
 =?utf-8?B?VEFENVJzdkJwaG1Kb0VJL0J2b2VBbDhoNFlRdWNDYUJpaXordHlCQW9RVWd1?=
 =?utf-8?B?SFhaTjYzdGhRbThDUUdtWmFlTzQ5VTJKY1pVZHdBcjl0bHZwUFUwQ0tIcVdQ?=
 =?utf-8?B?dkZxNzczelhYdG9pUE1JQS8vNTRNcStEMll1Njl0U2lwSURad053a2Uvd2Zp?=
 =?utf-8?B?T2V2TWcwMk9vSXAxYkUzbk1meXhBeEVJdUV1OGdYNTVVWFZVSlR3bHFVVExO?=
 =?utf-8?B?Y2k4eUtmN29KN3FJK0pQWGdsT2FpYmZyeWxWcEFrQ2pobFp1NGc1Ykt2NFJw?=
 =?utf-8?B?WUd6a3F2U1V2K1plbHkzUm1VMGFrVG9ObXR0RGR6b3prc0VsZ2dPVUZaQjA4?=
 =?utf-8?B?N2hRY2wyK0ZXVll2LzdSQnV2NE1yaUVYU0NneTdBYXEyZVVPekNTb29Uc0xB?=
 =?utf-8?B?YWVRc2JMYk9EcW1IY3FoTE1vUGhjVzRpSHFSL0wvQm1rWVU4Z2RuNDBqYkxN?=
 =?utf-8?B?c1lKaWUzMHBvWHVMZGU0bERDeFVQSzVCMldaV3RjNngvTGpRb2JrTmRvSmYw?=
 =?utf-8?B?MlkxUWxDRUJ4WG5PcEE3YzgyTisrZkdKTUlEQ0ltSXJvQnBBU2VJeFhkT2di?=
 =?utf-8?B?SjFOeW9ZTmFxU3RWKzQ1a3ZVSXZaMTc3YlhIeDc0TE5lM0huM2lBTldvVFZI?=
 =?utf-8?B?VHVwWnl5OHYzMmlZOGV4MGI5WUV6cmxaNUoyZFpSU0JGaVJTbmEzc3JaWW9S?=
 =?utf-8?B?YlcrU3UzRXAveXVrU0dzZmlUQmpKeVczVFdRQXB4dWdSdkdJVWw2WHpyc2Rq?=
 =?utf-8?B?aUl0dkxHV09abEZxQ1JJZXQ2Y2MrQktrOGVSMzZiQVJoMFlMdThQWFlTQUpF?=
 =?utf-8?B?dXBibGUyT3Urcm9oQ29ERm0rY3ZvNG4wdkw4V0JoU1lBTzM5bVQ5KzFVNjBS?=
 =?utf-8?B?N0ZNM3ZNaWRTNE9adWJQdnphb1JFbXlCc1FZMW1VdmFrc01oU25oQXlhQVZo?=
 =?utf-8?B?SmQwNTRXanlYRDVGTWpLWkxiUi9GM0xWV1hjVDlOOUcyWTVCcitwV2dQSytR?=
 =?utf-8?B?TFo1aFM1NGdZcnlOZHZ0aVVOUTVWUVE0bXovLzhscmtoeG11K3NPTkU5Q3Ba?=
 =?utf-8?B?U2JLemxVQ0pPWTFqU2JJUmJkOHNhK2hSM3lHU0hFRXNZekFKemErNkxteEl5?=
 =?utf-8?B?KzQ4bGNkdXJ0QnYrUnB0c094VnZLano2d09PY3IyV1FqSU4xc3RyZEV4OWdE?=
 =?utf-8?B?SCtoMkhNK1VuR3llc3djME5xTFdYMW9yR3Y5OURTbWlPRXRlUFJvRWMyek9q?=
 =?utf-8?B?WU9jQUhXNXRKT3pPNUNid2taSncyTHI2aFFQRDVKVmJ5Y0NFMFBoTUpPd0VU?=
 =?utf-8?B?eVJsdzBQRXJpNWVlM1UvOUg2THNFVlQ1RTVoa3lON2lPVWJlUGdWRnlzZ3I1?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7V5v1CV005dKbBbbN0e3xONC2nxIxV9JOyutlmt/2tmpL/5pFkV0TDWwgMGMTgLCxZ2harpnAYjVVkKghaAyV9SuKsWDuGfd02W5swS4U/SBC4G6fyu4qPtf2unYlIKXnRQjxbiLETUhHhH10XnzrAH1pzahznjc/MMEcJtidNbs/xQWoSCe5OxX/tnHHvNgJAJD22vO4nKBElip0ek7tfV5zp41s76DsYkhbfFGoYN0BPjPXT0lOdFY/nqbM4/zedq5ODBCEulsqUvk+u5J/CU13q7XCb8fke6ZR0MJVhWrPxMJ2XMyAPXWKYUM8GIxbhFBsMzzPz5q3+9VSilzs5r17l5ltDsOdu+quhfCQSFZZS6XKq1JPIIYu0LSqIzqKEbLP6+dPDwKcDM6PY4EFOI8CvqTeUi6MGYaEwbULZqPvYCPHLpM9Z/zhZop4NYTXd85EbCY4gr4r4mw5f3hsqxP7BTAtOo6CuZe0jx80CI2oZ/2Wu9L2WL5d79TIqj54dv9/F4RERXNn9tTbe+dU8gKMnwDqdYZc9iRIP09iTuUkSfKU7erNuEz0ljWcW9udeY9TobQ5r8BbgYAo2gCzen2+q3rRPAJxrHRykC7AoSIQuxmXljf03mkLhl18zML7obdXqv2qReo21bI1ji6dhqiIjE5yoTUDfQCmpZC7/KOq9OYY1Lul5SivIxt6Oak5bkqOHJ2J18dWcrRtFmydKxN1jw69+/cbvWPno6FoQVJNpOhNInI+ogIeu5XQEU2NPrwjII+5YLLeK/9n/3BqOkewXw4nK6ks0i6tBY3brCatyANER/uRZT9wLRfbteepUgRNOWEv8ypT3Tg6xVXQzREz8rQawGRNsCC1st0+lg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c80e8b-a9d7-446e-bbc7-08dba3d00c12
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 11:56:55.8039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8iKvk4zH59VNrwXyYvPHnxGHF7K/bcGY8dCzgRI6/Tyj/jxVXYhPIHLy7DNpDQmpRuS4B3kT4WmxX/rdvwpiQbfK1BI7UXHya0EqoukxFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5487

On 23/08/2023 12:15 pm, Roger Pau Monné wrote:
> On Wed, Apr 05, 2023 at 10:52:45PM +0100, Andrew Cooper wrote:
>> At the time of XSA-170, the x86 instruction emulator was genuinely broken.  It
>> would load arbitrary values into %rip and putting a check here probably was
>> the best stopgap security fix.  It should have been reverted following c/s
>> 81d3a0b26c1 "x86emul: limit-check branch targets" which corrected the emulator
>> behaviour.
>>
>> However, everyone involved in XSA-170, myself included, failed to read the SDM
>> correctly.  On the subject of %rip consistency checks, the SDM stated:
>>
>>   If the processor supports N < 64 linear-address bits, bits 63:N must be
>>   identical
>>
>> A non-canonical %rip (and SSP more recently) is an explicitly legal state in
>> x86, and the VMEntry consistency checks are intentionally off-by-one from a
>> regular canonical check.
>>
>> The consequence of this bug is that Xen will currently take a legal x86 state
>> which would successfully VMEnter, and corrupt it into having non-architectural
>> behaviour.
>>
>> Furthermore, in the time this bugfix has been pending in public, I
>> successfully persuaded Intel to clarify the SDM, adding the following
>> clarification:
>>
>>   The guest RIP value is not required to be canonical; the value of bit N-1
>>   may differ from that of bit N.
>>
>> Fixes: ffbbfda377 ("x86/VMX: sanitize rIP before re-entering guest")
> I think the fixes tag should likely be "x86emul: limit-check branch
> targets", since it's that commit that missed the revert done here?

Well, not really.  ffbbfda377 really does have a bug, irrespective of
the changes in the emulator.

The presence of 81d3a0b26c1 is why this bugfix is a full revert of
ffbbfda377, and not just an off-by-1 adjustment.

>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

~Andrew

