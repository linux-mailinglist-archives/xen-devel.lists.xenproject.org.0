Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911C07EE1D6
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 14:47:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634235.989633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ciN-00050v-5Q; Thu, 16 Nov 2023 13:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634235.989633; Thu, 16 Nov 2023 13:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ciN-0004zB-2F; Thu, 16 Nov 2023 13:47:27 +0000
Received: by outflank-mailman (input) for mailman id 634235;
 Thu, 16 Nov 2023 13:47:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r3ciL-0003dG-Gx
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 13:47:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab7b8ffb-8486-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 14:47:23 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8973.eurprd04.prod.outlook.com (2603:10a6:102:20c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.8; Thu, 16 Nov
 2023 13:47:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 13:47:21 +0000
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
X-Inumbo-ID: ab7b8ffb-8486-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlL7ooIk5ib95FfX26jrAzpYs36aAGNR4MCLh++NE1TaQlPdFyPir1bPSxTY//xKfWpgLVvjv9PIvokEeQ+WnYNwEqRUn9QdOsYzVxw+RO4zHzs9i3e40C11FuQHgw+bjL6KgNfTAeopBx4q3h9K3otjBEQQ+SUtaRMZiKuib6SvYJj2Fn7MCu2N/dAndgZgR3TtVMDH7aHhR5gHO+6EwTPY+K4qYWT96P6d3e8VM18Jj9Phq3GkeBk2hgN/yBR58GZ92cBkHJV57HjwfoV8PWrZ0PIzQDrW35xOutsxGSYglbgC40ESnAk8SawsjXbPfW7lz4vu769Tj3xF80VBdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21bfP1a8vc58vTNWpsCvgoeAH47g9WRPqWztSSvlClg=;
 b=cB93LPZb03gkfHKLJk0u3l6Vi8LDMxuwqldYDrH+HgGzxvVjmQzJAaJf88RnXF6UmfBZPothStPV+S8sTnfPvCdeqqIf5hwgELAXy1VrBVjVMPfK5Uf5Dnk8b0Whdn7MjzsZE30kiqBJk/WoZ213d8MlhL1mQ/+uxSdQQHP76peBplq0vb+0rk9tmbuXrF3YS53HfF8wh/93maHVrzelglUd8/cS+dvfwqQvyISX/kBfIPHH7xae6Y5tmcCRnaIwlkzUciJbCf6bhMUI6xTH5Nb3mZ/o9Otd5xMitjGCI+g7oeo+ZCm88sWZuDD46mxBo2rMs6W6KS1Bo9XqnBILDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21bfP1a8vc58vTNWpsCvgoeAH47g9WRPqWztSSvlClg=;
 b=zVSSsoZ7e9YJrxHMsP/C5vYxLjEfAy+ZYZL3xwOtavOTaI/2xdM1mpfVCfcEpMpPCT9BwbP/WV+tujNskyD0kf/2VZtdwY21hbOJBspeU+9/pgAA7f/7QJL275uAPrN7bI6JqKib/hHy5NkXgBAVmRdj7numDoZNeMczr9V/XEazTm0R7iXgP38PWP8+Jassx6KKcqp7LK/Ju7dRTi9A13QfEGyuBpxL2VDfiFl4RkMCSKna/MTsNSmbdsBG5O2ca1MBqdBYsTK1iQJVauEGpoxyM+POGFmp5Xn1C3eeOl+iN3jrkHkIDxCjgdgnoNyZWgqkEMenLZMLYjlAUqjWrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3627a561-939c-472e-840c-6925f4774631@suse.com>
Date: Thu, 16 Nov 2023 14:47:20 +0100
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/5] x86/HVM: adjust save/restore hook registration for
 optional check handler
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <08e0708c-17e2-4a5e-aaf7-5f60a40f76db@suse.com>
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
In-Reply-To: <08e0708c-17e2-4a5e-aaf7-5f60a40f76db@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8973:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a40075-5414-4073-5175-08dbe6aa8e4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aY6fdQwETr0hc4YDiJStX+xqq0Y3qgPPieN1csxbDu5AOsFihnf/3QGEttdQvc6dMP4BlaxVXSDQk9cVjvXVhZwBg9r4MDPQwgtDdIRFPCHXrfTh1A0Kxl4yzP+oaTyQyf051WzUTGmH0cfIlw81d0mvVOMoPJ2WEu1AQds/u2KUtQwqUlinQip06bbozx5IkYJj5AJ8pcdfvd255D5LNiFybWNZSSGuRxq9WKrsnDD3NlL7LQY+ClI9kHcBCu/PLf+hEPNxR5IDf+KHUENf4sHVHaKYOW17L19f7/ul7jwbmZ9heVLpdNB/aDDSYhynJRLoi6fdRsRtXs6jHSE5vGsfp8VVeEMJTlLTwCz1m9UgBCWHdgEtIpK3Xyf8o46D9TQR0q9oPX3hYcfFNfQD/bx6OFg75issf8iqGSOpe5JY6DOJOMPPHtwke5MlMcpHQY3oAz13On3BRd+uTq7sCWeJ4ddGTC/duC3K4Fvc4qBN2D3qZYC5Bnn1Tuj8XQosZsXE9e52AH0K14DVnL6WG2VKmRe/uhYThEIwjyzVSvF/qktJeiJG+CJTMGq2/T+Xibs8asBV/ZS7qOwqVWu5BM/KSSSoxPkq3xTEsRvkS1pNTLt7iP5VuGTKCFgRs9RXKl+KlCCtB9y4Yt1PQwMYjw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(366004)(396003)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(38100700002)(5660300002)(2906002)(31696002)(8676002)(4326008)(86362001)(8936002)(41300700001)(31686004)(6916009)(2616005)(316002)(54906003)(66556008)(66946007)(66476007)(478600001)(83380400001)(26005)(6486002)(36756003)(6506007)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cG01UHIvZU5VSEVidWZwMVVKVjQyYnZaMFU2NDlOZVoyU3VxSGtZczB4SXlr?=
 =?utf-8?B?bldyemo3Rk9qUFhDTWNZTUFVM3BlYUhuU1lPTjNselBHYmxqdXZlNUhsenVh?=
 =?utf-8?B?VCtBNDUvZ2VUWFJXQ0t6cE52bHB3KzB4QVN6RGRzN3Y0bDIyeURCV20vR2xn?=
 =?utf-8?B?WGpOdTFWV1pVL3BNQm5wSDhLaXFCNjluUkZyeEFSMnBqRnZ6MzR5L0E1YTF2?=
 =?utf-8?B?TjFMejIxVG9iU1A5UDZNZDBRbVpLbkZLOXc3RHFqOU00cjJaNEtibjhkZ0F6?=
 =?utf-8?B?dWtNbTFsOXRCQ3N0WGpZYzIySFRiZnUwOXF3czQvNzU4bjgxSmhyZlFqY3c4?=
 =?utf-8?B?WmpSTWVLR3JzM09zVDFJQk5GOXAwNnp6dTQvVjM1VmZCWmZwa08rODl4cUox?=
 =?utf-8?B?TVFFZVFUSzVnUmlRY1dkMktFZzhEaFpvRm1ZK1NaZlZTU1RuWkJzZEppd0pO?=
 =?utf-8?B?b2tNanpxaEpvOEw2bnhKblVWQXNHdCs5K29DZ25sQTk0WW92UmNHdXp5Znpk?=
 =?utf-8?B?Ry9JakhGNWRCTWl5ek1neFlGRGJJbUo2T1VZWUxOL2RGUEVYc2ZoQllLamt4?=
 =?utf-8?B?WU9Dc21rVzhwaS84Ni9iQXVkSVpTVzBhZHV1YnpuVW9TWXFkQVF5NlFnblov?=
 =?utf-8?B?OFVJRHN6LzVBc010WWp4MXk2ZDM4bGY0Z1dvSTRWTUJNL2htZXVYdzJEOXV4?=
 =?utf-8?B?Ykh0SkRyOHI3UXdFL0Y5L2h2eURTZkZkYnd1Y0VKU1ZoQUw3Z1RSZTc3WlBo?=
 =?utf-8?B?d1AxbVdPSHE3YTR3bUFoZWZOcjlSbWpkZVQrVWw1YnpabG12ejYyemlMZEhw?=
 =?utf-8?B?RlBmVjZ5ZUoxSklYZWErVnRxRzBJM0NiUHM0TEQrN2ZFV0kxbUhkMUR4bG11?=
 =?utf-8?B?eklXeDJoSDJvWDlreDJ3bGlzeXB6YmN5VUFXNGRJaGxrck5LNSs4T2VyN2V2?=
 =?utf-8?B?TmpwNmwrZTE5WHd3c28xcDZvSW9VZlc4K0pDRUtNVDJHa2l1T3VTc1lsSEV6?=
 =?utf-8?B?UjBHa0tDbjk4MWswSGFtYkJtanU0ekw2d1JZdXFmMEcvVnBFOXRIVFl3Z3I1?=
 =?utf-8?B?RjZjTHpFallacENEQkFWa1MwTGd2bG5PL0NkNm52dDlJQklPRDg0eWV6V3ZF?=
 =?utf-8?B?QWd3UFlKRGs5UFgvaTM2Y3E4MGlQODllZEpadTNZMFppN1JpQndvNWZLODV4?=
 =?utf-8?B?NDdXYmJrR0J6b0hyUXM3L3Q2TUc0QVI0UGw3YWFPS2VsZzF4Y1BlQVh5YTgv?=
 =?utf-8?B?VGZJN1IxcDZmZTRJK01ZVmFCUlcyWkQzcUFsU0xSd09iWmNReUN2eVArQ21t?=
 =?utf-8?B?Y0ZLTVZNVDFKTFdOcTBkQlhDWjZKLzFmZ1hVU3JGQUJ0UUlRekxTUGVSR2FH?=
 =?utf-8?B?U3hZTUNkZU5IUFJBengrUFYyYUdRSktueThiemt1S1V3QmR2Ny9kM3lTbVVS?=
 =?utf-8?B?ZFJMMkRlM29JcHNKMWlrcVJkakk4aDNwZHROMFVtMEkwSlZ2cUlqUlNhalZ1?=
 =?utf-8?B?RkVBaGFiMXo0YzMxWGFRRVZVOE1XSWRHN0J5WHkzakhRb1hSUGdJS25EQVJL?=
 =?utf-8?B?S2xwREVoanliSzlDWUZUMjRGV0hMVFkzU3lmcUpDM3NRUmM3em14K2ZPL1Fz?=
 =?utf-8?B?bnBKK2ZQQ2hTb2FlTXZsZTR4YmpQdDR5UFl5R3RjSW1PN0xBWjJhNk83VDhK?=
 =?utf-8?B?VGF6dmxUc0hLUzNGcVR3V3pMeWJPNWFJWThhN3NTeGpEM0pVUXNhQ25GaERN?=
 =?utf-8?B?ZlFERXk1ZGtmOHgvdFlRNi9Vd0ZTYjBtcVpNcHBjUndWaHR5WkJoSHcwSXU5?=
 =?utf-8?B?NXlPVjlMa0dRTEFDWWpWN05uWjRkQzlOd1hUTGdaOXl2VHZKY3BkMHd5T1VC?=
 =?utf-8?B?eS9Pazk5RmhOU3lCRmlvVmJnWGZNanhrQWN2eXY1YTlKL1JVRk1lQjY5bnl4?=
 =?utf-8?B?L2RGQXNMQ2RQUkI4djIvVUNtTnhydmtKeDlYNDFIWHNiRW8yeURNSXFGek5q?=
 =?utf-8?B?Z3I4b3Z3eVk2Q0xpMHYrbVZWWEs5d00rN1U1dUpFNHZocmNNMGpPTDdoYlho?=
 =?utf-8?B?WjVWTlNXS2hKeUhtZFFERGNtSmJnOEJGckVVZks0RjgzajRvaVB2cVByMDU0?=
 =?utf-8?Q?fzcb1pkeCG9m8q3Gqcn6qGs7c?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a40075-5414-4073-5175-08dbe6aa8e4a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 13:47:21.0241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqzTESIq3euSh3HS+7CIMuJmtLbYQSB5N9SeyUgOBilGg7LN393vR2DRQfjKxA4mpwmFSK8hSTG3ElfbgoYgWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8973

Register NULL uniformly as a first step.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -374,7 +374,7 @@ static int cf_check vmce_load_vcpu_ctxt(
     return err ?: vmce_restore_vcpu(v, &ctxt);
 }
 
-HVM_REGISTER_SAVE_RESTORE(VMCE_VCPU, vmce_save_vcpu_ctxt,
+HVM_REGISTER_SAVE_RESTORE(VMCE_VCPU, vmce_save_vcpu_ctxt, NULL,
                           vmce_load_vcpu_ctxt, 1, HVMSR_PER_VCPU);
 #endif
 
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -458,7 +458,7 @@ static int cf_check pit_load(struct doma
     return rc;
 }
 
-HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, pit_load, 1, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(PIT, pit_save, NULL, pit_load, 1, HVMSR_PER_DOM);
 #endif
 
 /* The intercept action for PIT DM retval: 0--not handled; 1--handled. */
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -692,7 +692,7 @@ static int cf_check hpet_load(struct dom
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(HPET, hpet_save, hpet_load, 1, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(HPET, hpet_save, NULL, hpet_load, 1, HVMSR_PER_DOM);
 
 static void hpet_set(HPETState *h)
 {
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -793,7 +793,7 @@ static int cf_check hvm_load_tsc_adjust(
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(TSC_ADJUST, hvm_save_tsc_adjust,
+HVM_REGISTER_SAVE_RESTORE(TSC_ADJUST, hvm_save_tsc_adjust, NULL,
                           hvm_load_tsc_adjust, 1, HVMSR_PER_VCPU);
 
 static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
@@ -1189,7 +1189,7 @@ static int cf_check hvm_load_cpu_ctxt(st
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(CPU, hvm_save_cpu_ctxt, hvm_load_cpu_ctxt, 1,
+HVM_REGISTER_SAVE_RESTORE(CPU, hvm_save_cpu_ctxt, NULL, hvm_load_cpu_ctxt, 1,
                           HVMSR_PER_VCPU);
 
 #define HVM_CPU_XSAVE_SIZE(xcr0) (offsetof(struct hvm_hw_cpu_xsave, \
@@ -1538,6 +1538,7 @@ static int __init cf_check hvm_register_
     hvm_register_savevm(CPU_XSAVE_CODE,
                         "CPU_XSAVE",
                         hvm_save_cpu_xsave_states,
+                        NULL,
                         hvm_load_cpu_xsave_states,
                         HVM_CPU_XSAVE_SIZE(xfeature_mask) +
                             sizeof(struct hvm_save_descriptor),
@@ -1546,6 +1547,7 @@ static int __init cf_check hvm_register_
     hvm_register_savevm(CPU_MSR_CODE,
                         "CPU_MSR",
                         hvm_save_cpu_msrs,
+                        NULL,
                         hvm_load_cpu_msrs,
                         HVM_CPU_MSR_SIZE(ARRAY_SIZE(msrs_to_send)) +
                             sizeof(struct hvm_save_descriptor),
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -784,9 +784,9 @@ static int cf_check irq_load_link(struct
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(PCI_IRQ, irq_save_pci, irq_load_pci,
+HVM_REGISTER_SAVE_RESTORE(PCI_IRQ, irq_save_pci, NULL, irq_load_pci,
                           1, HVMSR_PER_DOM);
-HVM_REGISTER_SAVE_RESTORE(ISA_IRQ, irq_save_isa, irq_load_isa,
+HVM_REGISTER_SAVE_RESTORE(ISA_IRQ, irq_save_isa, NULL, irq_load_isa,
                           1, HVMSR_PER_DOM);
-HVM_REGISTER_SAVE_RESTORE(PCI_LINK, irq_save_link, irq_load_link,
+HVM_REGISTER_SAVE_RESTORE(PCI_LINK, irq_save_link, NULL, irq_load_link,
                           1, HVMSR_PER_DOM);
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -773,7 +773,7 @@ static int cf_check hvm_load_mtrr_msr(st
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(MTRR, hvm_save_mtrr_msr, hvm_load_mtrr_msr, 1,
+HVM_REGISTER_SAVE_RESTORE(MTRR, hvm_save_mtrr_msr, NULL, hvm_load_mtrr_msr, 1,
                           HVMSR_PER_VCPU);
 
 void memory_type_changed(struct domain *d)
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -300,7 +300,7 @@ static int cf_check acpi_load(struct dom
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(PMTIMER, acpi_save, acpi_load,
+HVM_REGISTER_SAVE_RESTORE(PMTIMER, acpi_save, NULL, acpi_load,
                           1, HVMSR_PER_DOM);
 
 int pmtimer_change_ioport(struct domain *d, uint64_t version)
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -797,7 +797,7 @@ static int cf_check rtc_load(struct doma
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(RTC, rtc_save, rtc_load, 1, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(RTC, rtc_save, NULL, rtc_load, 1, HVMSR_PER_DOM);
 
 void rtc_reset(struct domain *d)
 {
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -631,7 +631,8 @@ static int cf_check ioapic_load(struct d
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, ioapic_load, 1, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, NULL, ioapic_load, 1,
+                          HVMSR_PER_DOM);
 
 void vioapic_reset(struct domain *d)
 {
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -1145,7 +1145,7 @@ static int cf_check viridian_load_domain
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(VIRIDIAN_DOMAIN, viridian_save_domain_ctxt,
+HVM_REGISTER_SAVE_RESTORE(VIRIDIAN_DOMAIN, viridian_save_domain_ctxt, NULL,
                           viridian_load_domain_ctxt, 1, HVMSR_PER_DOM);
 
 static int cf_check viridian_save_vcpu_ctxt(
@@ -1188,7 +1188,7 @@ static int cf_check viridian_load_vcpu_c
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(VIRIDIAN_VCPU, viridian_save_vcpu_ctxt,
+HVM_REGISTER_SAVE_RESTORE(VIRIDIAN_VCPU, viridian_save_vcpu_ctxt, NULL,
                           viridian_load_vcpu_ctxt, 1, HVMSR_PER_VCPU);
 
 static int __init cf_check parse_viridian_version(const char *arg)
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1591,9 +1591,9 @@ static int cf_check lapic_load_regs(stru
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(LAPIC, lapic_save_hidden,
+HVM_REGISTER_SAVE_RESTORE(LAPIC, lapic_save_hidden, NULL,
                           lapic_load_hidden, 1, HVMSR_PER_VCPU);
-HVM_REGISTER_SAVE_RESTORE(LAPIC_REGS, lapic_save_regs,
+HVM_REGISTER_SAVE_RESTORE(LAPIC_REGS, lapic_save_regs, NULL,
                           lapic_load_regs, 1, HVMSR_PER_VCPU);
 
 int vlapic_init(struct vcpu *v)
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -449,7 +449,7 @@ static int cf_check vpic_load(struct dom
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(PIC, vpic_save, vpic_load, 2, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(PIC, vpic_save, NULL, vpic_load, 2, HVMSR_PER_DOM);
 
 void vpic_reset(struct domain *d)
 {
--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -113,6 +113,7 @@ typedef int (*hvm_load_handler) (struct
 void hvm_register_savevm(uint16_t typecode,
                          const char *name, 
                          hvm_save_handler save_state,
+                         hvm_check_handler check_state,
                          hvm_load_handler load_state,
                          size_t size, int kind);
 
@@ -122,12 +123,13 @@ void hvm_register_savevm(uint16_t typeco
 
 /* Syntactic sugar around that function: specify the max number of
  * saves, and this calculates the size of buffer needed */
-#define HVM_REGISTER_SAVE_RESTORE(_x, _save, _load, _num, _k)             \
+#define HVM_REGISTER_SAVE_RESTORE(_x, _save, check, _load, _num, _k)      \
 static int __init cf_check __hvm_register_##_x##_save_and_restore(void)   \
 {                                                                         \
     hvm_register_savevm(HVM_SAVE_CODE(_x),                                \
                         #_x,                                              \
                         &_save,                                           \
+                        check,                                            \
                         &_load,                                           \
                         (_num) * (HVM_SAVE_LENGTH(_x)                     \
                                   + sizeof (struct hvm_save_descriptor)), \
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -88,6 +88,7 @@ static struct {
 void __init hvm_register_savevm(uint16_t typecode,
                                 const char *name,
                                 hvm_save_handler save_state,
+                                hvm_check_handler check_state,
                                 hvm_load_handler load_state,
                                 size_t size, int kind)
 {
@@ -96,6 +97,7 @@ void __init hvm_register_savevm(uint16_t
     ASSERT(hvm_sr_handlers[typecode].check == NULL);
     ASSERT(hvm_sr_handlers[typecode].load == NULL);
     hvm_sr_handlers[typecode].save = save_state;
+    hvm_sr_handlers[typecode].check = check_state;
     hvm_sr_handlers[typecode].load = load_state;
     hvm_sr_handlers[typecode].name = name;
     hvm_sr_handlers[typecode].size = size;


