Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2359E7F3F67
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 09:01:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638479.995025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5iAo-0006kw-P5; Wed, 22 Nov 2023 08:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638479.995025; Wed, 22 Nov 2023 08:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5iAo-0006ia-MB; Wed, 22 Nov 2023 08:01:26 +0000
Received: by outflank-mailman (input) for mailman id 638479;
 Wed, 22 Nov 2023 08:01:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5iAn-0006iU-DY
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 08:01:25 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20628.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53d5b496-890d-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 09:01:23 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7174.eurprd04.prod.outlook.com (2603:10a6:20b:11a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 08:01:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 08:01:20 +0000
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
X-Inumbo-ID: 53d5b496-890d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMCJLftFiiwTZhz3XsE4elQOOg+XIXNu10RblEjul4Jy/W3d49lVPle6qxiaOkRygmFM2JQb0pVqFQGJechJS8OzUYuYX4TDP2iRTGxqzg+WQRHrtcH/+Z5Z0PZ+Lmi0mSjtcj/xUjQsxALliwrUZRXpV1QWpzky+ej2JfK1DVh47HvTvvfTnU930bjjr5kmZPWcFUVRM7tXZF/Rz+Km5jq7/5nneiHeDH/xd0pHR4fMKXJBZyz+C1cexM0iwFn+ipIcvCP043SFTVUlcQXqwaPbgB46Ylsps2uEeU6y94n896ZUPZJVryQZP1ZHQd5+bv81qpn/oR6FPoOqYfwQIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3m70eU5viI0Vn3R0U+8t5JtOiWSmSULrF3y2kFn+MLs=;
 b=Jde+DFD8CRhf4ZkdMW/iWPSNfyat3Uj5MO1KZ5LJoqHT1ikpyVB8ri0gBu1q8KNClae5xorbgpKqbtPbka5DV2A76MctzI+Yl8gemGxYV8UrJtuONrx+kdPI3gPUHdKC+3BvVsqigRlZjYvIJet1ZkOiDfuRmwI3miatgAnKSlJC5DrW/zImx07G60xG4kzO1ctQuRSMg6+RmbsH4Wimum4nnjjNxGVJvQINWG+Z4/7nSMNVcqRkF7JQYJeIoWl6BRV5dPjA1+I22Zo+ylaQWFCXeXP0Bn4iLu11dT/GavcksI7AwwXzi+yTh7JtXRVzm22haSMR1MUBPrFCReo97g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3m70eU5viI0Vn3R0U+8t5JtOiWSmSULrF3y2kFn+MLs=;
 b=jPMqIwYMrnDrYdmI0JRZANBRtpoYWo7WjUrY22eTyFiBsYtPeeedT8FyyzSnR/f8a0P50XUryl+/VXymxMljLhvYjRGRK9vnW4VGzWOIJCnu93R9gvbvHzwvw2bKWRJ/j5SlBwcfr0ZXECV5GUzWxofuqIfHElT5Z5O6d8Iphnwg1NH6RSLa8TceggWMbO8M9nCfqEqU9lkX7EbvcXs0q3iXwWsJL5rkf91/FQ6VIRi9uG8J3Mh1nH0YFXhrLAJEUKko8gsnTdBTbIPpSijeXgQEzBRzxdJgtWltUMi8+6NlEWXC/z/aB7INxf0HzPjv47ZpI4SUUafaSNGnu+K2HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <109256b1-f18c-4c3c-a433-979e020270b8@suse.com>
Date: Wed, 22 Nov 2023 09:01:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/5] xen/sort: address violations of MISRA C:2012 Rule
 8.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1700209834.git.federico.serafini@bugseng.com>
 <de68f8220fbb97ae6a3382138c23e81d0988a472.1700209834.git.federico.serafini@bugseng.com>
 <19d887e6-8c07-43f3-a2de-88ce0a0c99ba@suse.com>
 <b481a966-4f29-4b05-8246-d3f1eec19d0c@bugseng.com>
 <51010cec-596a-4249-82dc-ac711c3962c3@suse.com>
 <alpine.DEB.2.22.394.2311201603220.773207@ubuntu-linux-20-04-desktop>
 <dc07af2c-c011-4c06-a573-6aa95deb9ec6@suse.com>
 <alpine.DEB.2.22.394.2311211716240.2053963@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <alpine.DEB.2.22.394.2311211716240.2053963@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: 0425a411-2082-4b55-1170-08dbeb313640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/aLfSMHjHHN+uuCG4qzb9+nEq9ZJUH6haWQKez443jOoDPOLG8KUzHXUU9MLqnNM7e2h7WrvYgAGZ2pNTCWC1AWitgWEXK6x/j4C1QfVlS2uKb325GNdpmCi0jMaLOR3V1uD9cd1YgoWjsrB6nkSWG0CFXnZjoK9yKuAg45QPR6hrrtD0ytuFUfRk2eSbKv4z2Jvs99zZNlgJxyHO5lVkqjYJu46WpIiEBTNVFhmQDBnYPhQpGf8UydYpMWi8GWmh/FHQgvJgWafxaakcPUDw+o6Mltyso1PCHfNlEujEXta4nLdOC1XutXtnSCW+bLkcZ/qe3aPg7LZh8fCRi/EcVAU/1LV0Gvxt8FNdYd94u1WutkUYhSLI64+HsYLXcY3BLR982P7QuB0gJ0yBdZzSevP7DS0f5pNppJ0yv1m9b4oDf91fJtPLyHo8KSh4kFrG+hQ6OrefwVX1LNUYeyAYhlEKlRbLbS3GLJtiaO9kSTj4u4iVb1iep5FXpxnqMKse4iW7JSzBZhT5BF25dR/9hEz5n3B2N5Q7qINPA3EhEROYMO5QRs8Ray1JW/VT29ej17VT8r18+pb4wD64j6KEqJ1SCDAKepDH+Hg5cHRsxNEyYTfiqbM+24u2AR1nZhC6yZ/PIKFWxc5EwD2qImWug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(376002)(366004)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(31686004)(2616005)(26005)(6512007)(36756003)(86362001)(31696002)(38100700002)(83380400001)(5660300002)(2906002)(6506007)(478600001)(53546011)(54906003)(6916009)(8676002)(316002)(4326008)(41300700001)(8936002)(66476007)(6486002)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWJRVXBhVnBUK0x4VFV0V2YyN2hVeDIvRkFaWDREY0thMlp4QjlCVFVISTBz?=
 =?utf-8?B?dVN2MEhML1JKajV3RUFtanByMGVjK1pxN1NDd3djM3pQR1NCOGloaWZuVGMz?=
 =?utf-8?B?U2pYNHo1b1lRaDlvNk0rMitJY2lleFNmZ0NYeDUwcjEwMCtCQWNBWlBKTi9l?=
 =?utf-8?B?Umx5emJ4R1pMVEdwQkY2cU95cml5THRoNVBtRSt6cStLTjdodjAyWjdJRkdG?=
 =?utf-8?B?WVcrc3hCQmpFUTlhTUZQRG03MlZlSUZNMDBHK1hMOEwrbThYNGFLZncyRm5u?=
 =?utf-8?B?U0diejB0ekw1OFB1Ujh4N2M1RXRvemZWOEQwdFVFQUQxQUE5NS9XYzFIU1lO?=
 =?utf-8?B?ZEVTQ2NoR21rVGVma0dqYitUK2VCMTBDNGxTeTlrLzRVUUM2dVBITEU1UFVN?=
 =?utf-8?B?QlozMHVQRnlvU1BJMldHaWFCUnpSMjY1SllCQWw0RGNqSmQwMURqWmo2dkpp?=
 =?utf-8?B?VGNhUE9OV2lVc1Zjbzh6MWNyT3QwbEt6UFVJS1lkWXhXaXdqcGY3VTQ4UE1B?=
 =?utf-8?B?di9NTHpWTnkzaVY0bVdaazV1T2RtZE5OMTVnQXRwZi8vWTNhT3FxOG92UUtK?=
 =?utf-8?B?Q0tsNTdYVTVRWHdwZ1R3UENEeWlKSXA2Zk51RFR0dGR0d2hCWVBIc1llcGMr?=
 =?utf-8?B?UDk3eFB5cGFZa1pqTHVxTUZmNURVelc0Q3h2a2pjM3I5TXdPbFhjSUZ6RlJI?=
 =?utf-8?B?Q3g3Nkp4aGxFbmNpeklwTUR4cVFXR3lFTG9LWStRTi93MnBYNnJIbUNOYnFt?=
 =?utf-8?B?b1ZDVGlDdUV6eUNtT1J2T1lOMk1WeEFENndvczdIaGRPSEtQNTlHQjd1ZkdG?=
 =?utf-8?B?eHBoWVh0WnRVSFJnZTFSVUxpME43MmdDK0UrVm5xVXRzZEdEczl3TGFiUVl4?=
 =?utf-8?B?QnJMNmhObjg4c2Y3cUZRNzM3VjAzQVlmcWsralNZZmJaT1RDM3BXY2NaUWF1?=
 =?utf-8?B?WkZ4Y2o5Y25DREtVeGNNd0ZraGVNcTJtcFlwQVFTV3ZKdGxoQ2lHaHZwU1Jy?=
 =?utf-8?B?cVNmeE1GTDBuR29wb2h3dmhHdkFqSXNITmRNTGsvdUh5U2x0bkpiVy85dHpW?=
 =?utf-8?B?bVpEWnFEZkw1ZUs3czBaOHJ0VFNmSGFqb3UreVVwMXQydGo1cU40bFpUWnM0?=
 =?utf-8?B?WHdYcCtlWERuSVc4ZjB2dVRrVGt3amJ1VjM0NDg2a2lhM0xCUXRZSGNtQXFw?=
 =?utf-8?B?Zy9HWEF4bytQTTJaUkxtYUk5OTR4SXlGRzR4SG1ibzdJaC9GTytHSUV0blIv?=
 =?utf-8?B?SUo4SGlUUURCUU4ybTNsdVZyRlBraDdSU0lUTFpHTW14VUVXZkFheE92K0tN?=
 =?utf-8?B?QmpzdjVHbTN6ajNZdnlhOGkwQ0JoeUJJUWN0YndJS2lVWTg0WTB1VHkxZ2tQ?=
 =?utf-8?B?cmdsSEtqY0pBZERiSklueTY3VEc0L3BIcGh5VW85Y1VrZXFRWUdVWFBqdmI2?=
 =?utf-8?B?U3lVdmk4SENkYlFNZzRTVThiYjc5Wk9jTzZ2N1dLb2lSQVRla0NIVFJuQXAv?=
 =?utf-8?B?T2Z0aUpCaGtEeEllcmdMT3JiZnhiYVZ0eHZjMFVFREljQ1dIMytENWduc1lo?=
 =?utf-8?B?b1ZNVkpiSDEwd0hKOEt0ZFFqVlpnSUd2RE5rL2RqWE42VGMvQ3Y3aU9kMC9P?=
 =?utf-8?B?aFZYdFI3Kyt4akZnV09XSUg2dS9GT0tjRk5jck8zckdEejYwVG1oMVppVHBj?=
 =?utf-8?B?ZFZwMXRObmkvOVdENHkxOWRxNnhvanhDV2pEU2JsQ1NKUEcxTjc4WnNsdDR1?=
 =?utf-8?B?b2JSWGxVeUhvK0wyb2Uvb2wyQWNrNFN5VityRmtwVndlNTZGbnk2cit6M0JY?=
 =?utf-8?B?ejB0YmM5OFI2VXVsU1lTS3o3SmJiZGxCNE1udng4emN5enozSFdtSnlYdzlv?=
 =?utf-8?B?emwzUEVpZTZUSi9EMjRDd3FsS1YvRkhuYmV5d2QwMVNHdWI4Mm9KejVyUzdK?=
 =?utf-8?B?SUpkTG1HOHpWdEdjZTFCMjNOU3lYREFhZzlpdkdRa2dpSjZOMDQzQXkwL3VD?=
 =?utf-8?B?WktzTk1sVGp2QzRBZkU3SzA2YmlpWTFPWVprWVhtb284UlIzQ3hvc2t1R3R0?=
 =?utf-8?B?OW9nT05VQU5tV01hb2o1TVlUVWFQWS9lQjNsbUxITXNOSm9zTjlYenRGUnl2?=
 =?utf-8?Q?pfLecxxHFr/8vSu3lEHfMGuFA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0425a411-2082-4b55-1170-08dbeb313640
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 08:01:20.0284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTfmar69Arah+ToT8vEhYYs7ojS/xxWqJ2R9HOtgAEmwQE2z/RqILlLxa3D36yO/AxSqL8Z+rW53yHaRiDxMvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7174

On 22.11.2023 02:19, Stefano Stabellini wrote:
> On Tue, 21 Nov 2023, Jan Beulich wrote:
>> On 21.11.2023 01:04, Stefano Stabellini wrote:
>>> On Mon, 20 Nov 2023, Jan Beulich wrote:
>>>> On 20.11.2023 14:13, Federico Serafini wrote:
>>>>> On 20/11/23 10:02, Jan Beulich wrote:
>>>>>> On 17.11.2023 09:40, Federico Serafini wrote:
>>>>>>> --- a/xen/include/xen/sort.h
>>>>>>> +++ b/xen/include/xen/sort.h
>>>>>>> @@ -23,8 +23,8 @@
>>>>>>>   extern gnu_inline
>>>>>>>   #endif
>>>>>>>   void sort(void *base, size_t num, size_t size,
>>>>>>> -          int (*cmp)(const void *, const void *),
>>>>>>> -          void (*swap)(void *, void *, size_t))
>>>>>>> +          int (*cmp)(const void *key, const void *elem),
>>>>>>
>>>>>> Why "key" and "elem" here, but ...
>>>>>>
>>>>>>> +          void (*swap)(void *a, void *b, size_t size))
>>>>>>
>>>>>> ... "a" and "b" here? The first example of users of sort() that I'm
>>>>>> looking at right now (x86/extable.c) is consistent in its naming.
>>>>>>
>>>>>
>>>>> On the Arm side there are {cmp,swap}_memory_node() and
>>>>> {cmp,swap}_mmio_handler(): "key"/"elem" are used for the comparison
>>>>> and "_a"/"_b" for the swap.
>>>>
>>>> So - re-raising a question Stefano did raise - is Misra concerned about
>>>> such discrepancies? If yes, _all_ instances need harmonizing. If not, I
>>>> see no reason to go with misleading names here.
>>>
>>> Federico confirmed that the answer is "no".
>>>
>>> I think we can use "key" and "elem" in this patch as they are more
>>> informative than "a" and "b"
>>
>> Except that "key" and "elem" are (imo) inapplicable to sort() callbacks
>> (and inconsistent with the naming in the 2nd callback here); they _may_
>> be applicable in bsearch() ones. Note also how in the C99 spec these
>> parameters of callback functions don't have names either.
> 
> Yes, reading the example in extable.c I think you are right. Maybe it is
> better to use "a" and "b" in both cmp and swap if you agree.

Using a and b is (as it looks) in line with at least some uses we have, so
less code churn than going with some other, more descriptive names (like
left/right). So yes, I'm okay with using a/b.

Jan

