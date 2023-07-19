Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C247591DD
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 11:44:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565711.884117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3jd-00035H-AZ; Wed, 19 Jul 2023 09:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565711.884117; Wed, 19 Jul 2023 09:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3jd-00032f-77; Wed, 19 Jul 2023 09:44:41 +0000
Received: by outflank-mailman (input) for mailman id 565711;
 Wed, 19 Jul 2023 09:44:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM3jb-00020n-Me
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 09:44:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0ced962-2618-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 11:44:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7404.eurprd04.prod.outlook.com (2603:10a6:102:8f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Wed, 19 Jul
 2023 09:44:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 09:44:38 +0000
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
X-Inumbo-ID: e0ced962-2618-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxhycjgnFzL0sauS7AGzGEQFRuZOGE8SGi7fFiBdSy5mvE4g0LlRZin0lJC57tbF9bZFkTfgaqujqdoEKTUQYeWx5ciYzmEz6ba7OZq6yt9MIxbcwZ0xiL2ne3acZLLByPmOIsPPWaomASKcpgXh+kDoHPvPmKv0N/t+MHqHh4qgvJrIlwSOUsB9b3WGJgGkvEJw3EUeD1lRd/sq7sfyb5Mp9hRU78jYJGhPTOWZfeQGox+lio6ggNw0WanlZcrl/VUIyDti9FGd+Lq8FGZCzUeEMjmGg+uVreaT2Qnz6UEpcBOBrcPV4YZiQ+knYBWbMRQS/1yYtV0rpLBEF5Ge7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bXX4UWXnWt29w89tvGp0cf+LqZaRKTS56ciKBNCO2k=;
 b=chJPDsN63bGiC5KKPXJoTd/Ee718+TJWIQz+N7KG/UXhGLVojZCGyXcn72ChWvAq40UPzXQbvyt/oeBrJO08GUyzMWx+TW+vOT3qRsa4DoP9HU63rnxmhMfDbGYWl9hwKjemLCwU1IAC+dmMsSVcFPmEcK+E1c7MMyLXMZvflRGyQV5kXl9jgid0Dh+rn6W0IZq83IJoJlNrch81ivk0x/owHrZNXvfXCJPGUk2Ye8aVsKsAMuq+kRc0+17LzuFIu8hiF2m9UwpqoQBToJ5L2f3jgSMVbqwjaWL0foOeynVUmMUe+eYhhSn0PcXCL5FGJodZ/9bqm3zfuVk3TXlCBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bXX4UWXnWt29w89tvGp0cf+LqZaRKTS56ciKBNCO2k=;
 b=ITYxGJOpNogGKV1p+LELNBBJb/XBXslDIDzpMOAxbApo3961+6eHdCL/zIaUxFTf+isIPusVYtXwYjqN4nd5HT7up/RZPhNXE62tO9fttBBNfQu2Hlj/F89cSQEDKhKVvx3jokgMrX3ZRm2jRADsHhptG+qgNP9+YlSyu03ReHdvaoWLyi5/YhfjXGp3JUnPIVt0T73rXPbj01Cs+V/Ke7KRnOq751SWp5pAJQJgGgFCeix4QJ8Tr8gjSsj5zIst2yuKIu1uchNLi0O7mEfD5LoqsfSHHIk2s4RZxe0Ve5wIIGyXit5s6Mh14L4uoQ4oe+mizT8S+JtFJEWRkzvwSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d1ae6dc1-215c-4953-8937-1b32cc23e308@suse.com>
Date: Wed, 19 Jul 2023 11:44:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v2 3/4] x86: use POPCNT for hweight<N>() when available
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <dace10da-f108-fbe5-da4f-0e4497f512d9@suse.com>
In-Reply-To: <dace10da-f108-fbe5-da4f-0e4497f512d9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7404:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dc46d60-1cc7-4f3c-f604-08db883cc47c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p0wJNMSdNYXQzpTy27aJ8wIMdpD7P82qGQaVnWMJJU2YaaqhGir2N23DRQ9tEk4HG2GGT6hQFnyOsx9h5oXnsselb2d2nOLW08qsiiUat5exaoBSJNkN68EY2MSXhOJdVEb3Ga7rnIsWKId6gpPQ/0BBa1BJN2NhiXuhipNRtI0kp8931ZC6Zn2W+evmrdr8Nd5nj6S1/EO+TerzTu/ubWqYvKTVtcjU9CGlzOP92i3fhUkmq0PP4nM//5TnlE18XPlAkAx2PWV45SXb8mBqs/WLODc5FAB/3/WEl8QZyKFO7MJoFNqTWd5xvO23S0LBq6sqtwkK9NVKkmzIpWXq9HrHIGfNnHInef0Kzy/33BAp7wetmYki4yysMvXgK8cOQ9koDFcTUWogaGntmtXt2Gs93nA1BQxXZ+3QkWppZHmgqxxGjuAsQ8WnZ0HhsXQ3HCBiWwn/tFTO+dO3WheV5EQ8wHH5qU7IeDkreYQYt7QqgRh+7KzhakHTiiqbkPUcLew8dxkU8FoxuCkIdi//8utN5vr1qMHwa9VBxajwIuU95BT6yImk0RztRku/l6wP3T6TA2s7K/50HDzhhiyDrqvAKsGF6MeNL7HDKOsFEzfSpNXvwpj0d0ykA8LoOAw79E4/tC2gxCxZRAWxai/85rA8UGzD2+XYMujbqaGvdp2TO+OPM2yfeltDJcZ+T5QW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199021)(31686004)(6486002)(478600001)(54906003)(2616005)(36756003)(31696002)(86362001)(4744005)(2906002)(26005)(6506007)(186003)(6512007)(38100700002)(6916009)(4326008)(66946007)(66556008)(66476007)(316002)(41300700001)(8676002)(5660300002)(8936002)(16393002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGJrS1I0MFNZSSs3YmJHM3BObExhRFJ6TEZKeTltZmd0b0h0STV5VmlwcWlH?=
 =?utf-8?B?d2ZzMzc0VHU0N2JJLzZWSkRyQi8zNVkvVDU3N0llZEV4cFlDTXNQZWxYQW9P?=
 =?utf-8?B?UkU4dTBSbGcyVXQzQ2JuMHo1dWVQNmx5bDlVaHA3ckcwczI5bkhkc3pxS29q?=
 =?utf-8?B?T2pkNVlPVWVGMWJMbjZ0emkwcjlSYmU2K3htVUgzSEZDbDRaOU0xY29CVllh?=
 =?utf-8?B?dFZkbWV6QlVwZDNmU3BIeXJwbFo2TEdrN3RqM2kvNmxrdVlSUnRNQ0x4dzRU?=
 =?utf-8?B?aUJhUVhBVHJ3MThhZVhaaUU3NHNCK3p3Q0ZIY1lkYjJoYmo3UW8raVRQaEVW?=
 =?utf-8?B?UVNhdE41MC9pNit3ejJ1YmQ4bkRSTHhUTnZmbWkvV1dlUkJkOGNDSFhCSys4?=
 =?utf-8?B?SkZPdkZWV2tTVEN3Q25mL1RhMDhEbkx4aGF5Nm56OGM2Sk44ZStKUFQ4b282?=
 =?utf-8?B?OTNyaTZEbXBVaWZZWGdmMVdzZGQrYVloc3FMMjhPNDdHR0lEN3E3cGFZMmlY?=
 =?utf-8?B?bTJwUFcxdjRvZHVuRk8xMDJkUmFxQTlZRk1Ia25ON1F0dWFMcmlwMjREZENY?=
 =?utf-8?B?ZDdac25oZytIenQwZ0ZMZWtlNUo4STFDSnFNVTNmZ0JPeWs4RENNQTd1aFBN?=
 =?utf-8?B?ZUdtQmRxWlJ2S0dUSkNNVklmNUJDby9yZzM3UnFDU3RmbGt2TlJOblNoSmpi?=
 =?utf-8?B?RTNaNHAzdkprUy9MWDQ2ZXRvdVd0QlB1Tk16bG1rY3hnSUlFdlhjNm15YTJE?=
 =?utf-8?B?cGVpa0ZRNHJ0eEhwUnZhTlVhRmE3eGd1azY5Vjg2ZGlwMEpadHJnSG0waW5V?=
 =?utf-8?B?Mkl4RWRzQzh3STVZTzhMZlkrQ21aVklMVTB5NDU0YUFqSHhHNGZmdzdsTkZt?=
 =?utf-8?B?ekxsc2lhZExFRitHYjJNblRncmRBSmlxWktvZ0hHNHA5Z3NYa0ZCVXd6dEF5?=
 =?utf-8?B?YjBZK2oxa1puYlFYa3hnSFEzT1g1TTNQd3dvVlhGb2s3T0FJWFNVZkFwblpZ?=
 =?utf-8?B?Zk1FWVJOQkwzbi8yTDRCMTZNRzZOTU1QQ2hpc0hiZzNOM3lJQmNGZmhWY1hv?=
 =?utf-8?B?ZWhDQ0J0UHVsT1pIZUsrcjhSUzFMRXhEa04zbURIL0xyY0hjVzJJUVpOVHkr?=
 =?utf-8?B?bFJobTFJeVFZeVRzaWxpM09JYXpUVkZoRStPMFQvQjRMckhWWXcvTUlpa3ho?=
 =?utf-8?B?cDQrZ09UM1dZVmZSL2UxS1Z5WTBFVUxUQmRKUjVsd3U1amh2VkQxdWFkYW96?=
 =?utf-8?B?SnZLM2xJOTlicU52Y3pQTkxha3A3VzNBenk5WEM1dmpuTFBmZ3NXWU52NU1t?=
 =?utf-8?B?M1B3T1Y3aDZ5S2NwWHFrSlAwdElBZHdMY1E1T0FCcXg5WUN6MWprVUFpRkU2?=
 =?utf-8?B?Y0VwOXE0UW9UU3p5YkxHc0JWUER1TVB2WjQzeFFGaHNwQ1NjVi9UT1RNd204?=
 =?utf-8?B?c2d5QzMxeFJMUzl5N09yZVdoMEJqTmM1OHhlSkd2ZmM2K2tPa2dGV2Flem5h?=
 =?utf-8?B?TnRwcUdPVFBlQ0h3bXJvTnp3b3JMOEFFOUpqMUlRNm1MdGJSNzkwOGludFhs?=
 =?utf-8?B?UjNpSlVvTllFRXM0NlBua0ptd1hJZFV1Y2lrMUFnN2hWYm15WGxCYzNYTm9L?=
 =?utf-8?B?VDZCb3VaU3p6RnRoalM3L1JCYjJ5UnB1a0ZBaEVUZ3hrUVdoOGVhOWF6OG5R?=
 =?utf-8?B?T2poWFdGc1RwWXBRU29Xd0g0SWxpUzRHbTdoa2p4ODlpajUzTjY4OFVnai9Z?=
 =?utf-8?B?MzhpcDBDR1pxbHpOWmYzM3hjeWxHamZ6VHdDS2ZKbmtYU2IrVDY1OUlxUk83?=
 =?utf-8?B?SHoxcFJmUkhkekJvWUZ0V1cyTkFndUxhTndkQnBhRkEzcGJTN2JmWGNqTDUz?=
 =?utf-8?B?Ry8yTDVrUXo4TGdXWkJIRkZWd2pZNEtEU1V5UnhEbUlQR3NYVVFRZStEYlpP?=
 =?utf-8?B?S2Y3cGVlcEtLVmYySklucWxwbUh0cUl1TjZVMmhLaVJuTis5YkxPdUpwdk9U?=
 =?utf-8?B?N0NuRyt1Ty9MSStwOEZNQnJVbm1IMDFZVWg2TWtlVXpFV25iZ1F0ZTdKMCtE?=
 =?utf-8?B?ZjNCR01Rb2ZUeUdWT0tWM3NOMm1uRS9KajZBS0M0SFJZblR5NUd1bVkvU2pu?=
 =?utf-8?Q?jwNi5ZNNNBBIwyBON0TM0Y29p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc46d60-1cc7-4f3c-f604-08db883cc47c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 09:44:38.0031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4iWv9d+/OM1sB+c4zMCTer2oZvKkHBDC/YphOlV4zXUrUGq7o/3XEVi7AmjTlou13/XwnSY9bMLVLNRXVRIY2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7404

This is faster than using the software implementation, and the insn is
available on all half-way recent hardware. Use the respective compiler
builtins when available.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -475,9 +475,16 @@ static inline int fls(unsigned int x)
  *
  * The Hamming Weight of a number is the total number of bits set in it.
  */
+#ifdef __POPCNT__
+#define hweight64(x) __builtin_popcountll(x)
+#define hweight32(x) __builtin_popcount(x)
+#define hweight16(x) __builtin_popcount((uint16_t)(x))
+#define hweight8(x)  __builtin_popcount((uint8_t)(x))
+#else
 #define hweight64(x) generic_hweight64(x)
 #define hweight32(x) generic_hweight32(x)
 #define hweight16(x) generic_hweight16(x)
 #define hweight8(x) generic_hweight8(x)
+#endif
 
 #endif /* _X86_BITOPS_H */


