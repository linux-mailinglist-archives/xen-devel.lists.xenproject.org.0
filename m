Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06BF67C6B0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 10:15:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484853.751698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKyLZ-0003VK-Jo; Thu, 26 Jan 2023 09:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484853.751698; Thu, 26 Jan 2023 09:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKyLZ-0003Tc-GB; Thu, 26 Jan 2023 09:15:05 +0000
Received: by outflank-mailman (input) for mailman id 484853;
 Thu, 26 Jan 2023 09:15:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=71dA=5X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKyLY-0003TW-8n
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 09:15:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2047.outbound.protection.outlook.com [40.107.6.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e93dd99b-9d59-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 10:15:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6889.eurprd04.prod.outlook.com (2603:10a6:10:11d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Thu, 26 Jan
 2023 09:14:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 09:14:57 +0000
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
X-Inumbo-ID: e93dd99b-9d59-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUkRYXfjCWdFAWWENBlBK42ErIP1HCzUv/luReeTVIkMZmq9hBEKlPwIjvNovJzSpZU4DIesLpemiHvm6PWvhZtAM+2E2B8+EytEBMXeaTCRuu+tqpv5Wpfw1CiTa4M5aTvXn2AWylrClu13uMb/g4icP7XSMJMX6lD0kRGq8xuHaUieKh7G9aA/AYJI2QAryNK7rqV8/fJw2tFMEOlrnVnm4i0tIhTAGfORzc/HLt25EX/JHVrjMVpLILyjSVEV6UAxZFfBvtobXICoH8FUws0DViXQ4Ad0SGz6/DUc5G+srVrw3un4hlKfiv+Hti+vxHo3Jz4G4Np6O8IRvlEzwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3y46onS+R+2h2xkxHtZmw8U0u00amcjJQwPunPuj5Y=;
 b=UMMl0YiefOXnrku8QgJHLFVntBy9eZp3gWBsvXzAh6rPUXaZgYUeHxTbwZQOITYbxkHI0TCyg9Zfw0TdICF6aN8JLiMT8D0KZbWd6RQ+TpaKrz9b2MhAyuguSzphCGlNTjZ+qgRKTWuEnlJbpKErFY7fX6TIbbKuRfxZ4/8TUG0Syw8ab/WLBGFPa5sNw5v2WSCWYyRd6hA5oDmtBjsXCxYHrG4kGhExF0OTJSyPL1RK+J/NZW4TvQIkR1sGZCoVJNrqOjV/I28FYOluH4CNPTsrfGDxPt3+qQEePc69rReBIk+Yw48DPBskoCqZPQSLq356E3Bt9FSSz4V9Kp/AVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3y46onS+R+2h2xkxHtZmw8U0u00amcjJQwPunPuj5Y=;
 b=eKBP/g2/IV817524EJrL8dlyoWs/rZ0OMOBww6zV1tL1e/4U2hVV58wwqRHEiX0kZbeuBfTVDgHNs4AhEFmhsFrN62gdj0/UqOhKMGJEU/V80WTGtxLkfi2UZT7TKbLyQlOGpxvn/OVQovULXiMdypssVDAqDiXIsErqAsSArzWMecGFu4MBWaf5LADeRo1ak4L8wXZxEi6kqIn3vw5U/HK9Ny/K4HWtzSzxJt80fn8kx2xUIUONi0EWmcUTcA5fq3OAXDWKMi9E9Q+WK/TXbw2FR3sbBRjrjy8vhs/eA6arZKEXZurVh1O4mNIfTcoheE0nOrQocu6ldcFB6anW+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5804fff0-b26e-bcc5-fc76-7e2be09bcd71@suse.com>
Date: Thu, 26 Jan 2023 10:14:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] tools/python: change 's#' size type for Python >= 3.10
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230126051310.4149074-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230126051310.4149074-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f4e0eee-0ba4-4f24-ebe0-08daff7dcaef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vLKivhn5wrOWFQOzkTUmTLU69B+a/CxGn56Ti8bx+qO8S6Fomkz0um3R80CX1W6nWuoIktNi2LRMWxqX71FbU3VcR+950Hd3vIOHlFoNFhFJfRkEovkG3TAx2U8xXWCV5GM7+azB0JOsEYXOinMLecCMUTxYb1ShjFG/Hu9+WnFUmr7k4zvEOKRhfz8ngxIVmprTx0R2eNH/0w88PgZYE3cXmy+MMtv5ZJExFKW1pK166UHBgcvLgI8KAatRF10WSkDI6Jm9uVOP4ohuuAZ3WCs6+NZ+8EiEW+RKD4ClAOgzQo/Gp4Z2eAkOhETpMMkFkq6m0QEyMRs0Kx8+uD/jWunAPa2IiXM0d4/6eaSyCjXYH2dEYgvlTsbRcsvvXrDYh0BQytrMTnrxILe4rfnyJ/ufUJV6/X2dwIK3M8yzYoBLs9f23zYqS7Dg2zAYXyQK+2fiR1vM9YU2sDr/bfkY5jgw4Qx6YcvWx6xbTZBpzE6OjbVR3DXErC57yeDS+yjuOVqXHpHWzhQzeRT20KtHUEff8/o+NBNgtdGMK8PrT4qLfa8eYG64oh/xZbIWzo1ZIpPVueqjNWVeaRJGX/NbBSoJaDvQXObHRCxolamdK4I7aYTrBUmbg9TckUwoGCK+Xn6ZpdQDsotXoQNrWhNSSkzomGmU7w2mndJRisjrpSV0e3feF1pRgmS1TUEy+WWR5CYLRrbCrb9ztbCtKXo8ALG32Ci8BAn8c5mgeq9WqV0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199018)(54906003)(36756003)(31696002)(86362001)(478600001)(316002)(66476007)(66946007)(6666004)(66556008)(6486002)(53546011)(2906002)(4326008)(41300700001)(8676002)(6916009)(4744005)(5660300002)(8936002)(2616005)(38100700002)(6512007)(186003)(26005)(6506007)(66574015)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alY4QXlmUk1KUjRPeTlTRUkzbk9BK2d3ZHArY3FXMEl0RHlGaVFURStVTGlo?=
 =?utf-8?B?Y3RuaEs0WmZSRHhpY0FvRklJak9aQ2ozZ3VZRFlMeE4yR0h2TkVoTlNMcENX?=
 =?utf-8?B?VDdteFFhdHBOTUxnZ3IrYUhuMkkyZXJXZGwyYkswamF2VFRZTXJzWmpJaDlw?=
 =?utf-8?B?TnQ0NGQ1VURaalBwWFQwcURnQ3NVUldIcGttL1FSRlhkQVpsb2lGRFVsbldq?=
 =?utf-8?B?cEZNZjZERUdzSlRvZGNSVVp2Yit2SXJQRlFlNVU1cGZwSGJ6NEdteS9iaW9j?=
 =?utf-8?B?N284ZktMODhoTy9uODdCWjNrYWVSaXVRSENPWmdINW5IdlUrWjA0MG1LbVZ1?=
 =?utf-8?B?V3VSandRK1RveEt3QURnbG9ZVDFIMWJZa1pFd3hXY0t2ODB6a0htdlBKVzVl?=
 =?utf-8?B?eXo5bWpjcjFZcUJqZzYzSGVkdFZjYnlvczMvOFpGa052WjdtcVZOUmkvcUEy?=
 =?utf-8?B?ZnhQa0QrVkxaUUMvMXBsYkM5cC90VlJUV1JSb3RjUUVaVUUrU1g4bCtxSk90?=
 =?utf-8?B?M0NPLzdhQzJHcWYwL2pPN2FmRmdJYkg0bmd1Wm1iL0dxOEFSdzZGNlpBNlJs?=
 =?utf-8?B?TjVUY1RDWldYbVF5aFVqODBleCt6T2N4TTBpd1l2Nmw2b3hkQm5hWjMrMHNX?=
 =?utf-8?B?dnc0c0ZETW1nR2VEZGhsZ0ZjYmQzM1B3RngrbzN6WmVqWTEya2FTTmVMZlN4?=
 =?utf-8?B?bDJIOUJtYmJJR0l0V0Z0WUdYcW1vWk5PU3piSk5rMS9HblBYMGZWejliR1VX?=
 =?utf-8?B?bUJOalZ6bDJnckxjZ0RHUkJGbUF6YVFmd0wvTHB4WmdvVEN6TjVoWC80QzBm?=
 =?utf-8?B?S0kyZG83YzVrUERqWWxPSjFkL3VGWTBHdVdVNytMSlY5SXZKMVE5aHRxaTdY?=
 =?utf-8?B?bTA5ZW5jV3p5bzBYbmU1SWRnVC8zaUdkVzdGdnA1c0xQYU1wLzhDbWtUa29X?=
 =?utf-8?B?bEw4b1BORDc2ekNLWDdUUVc5bm5rVFk2RWpvUDlNd2ZQaHZHT1VORmthTDJ6?=
 =?utf-8?B?T0xKalAzTDlaeUF6V0lQdGtTbWFsNU9iYjlJTWo2ajJ4L0ZBVXdCRi92bUR5?=
 =?utf-8?B?U21VMlB5WkUwMWErM1pYTkpXVmdFbDI1K09iSUVQRmVDaHdQRFhOa1Y1WGli?=
 =?utf-8?B?QVFZYXIya2ZLWEJBVnR3a2ZrWndIZk5ReTk4R2JhR0ltejFpL1BnZkUveUM4?=
 =?utf-8?B?K0NZSGEvajBrWmdqeCtkelJ3cE11ZlJHZWEzYkhqRXhIejFRaHhIYUxWL1Mz?=
 =?utf-8?B?V2dzUmlwbXJtS3VxbDAwQ2NkbjRIaHY3T0oydXdHTURCOG04dzVkSG5aMWpU?=
 =?utf-8?B?eXNndHdRbjRkUElEbWpDQmtqV0tFbjBBN0hWeXNKSUdPcjBSRzF3WEt1ekh4?=
 =?utf-8?B?OFhYWStjZVdtb1JNN3FKNTlyMkxVTTVHd1IwMXN0TFRNOTQwWkpjQnFhZS9O?=
 =?utf-8?B?RnFlRm5WSlVvNnBOSzE5SmxFN2ZIY2lMNkZkWHZDV2hDR1BpcWh4dC8rOGgw?=
 =?utf-8?B?MlhETHJ5ZHBOMzVMVCt4OWdhWWphZ2FOSGh4ejJtOXQyMk1aRnY0WHlyUmZF?=
 =?utf-8?B?VW1nWk1vL1hJdElNOXg2YkNWaldQNW1hbCttM0pxSDRkMXViZzM3Y3VLQlNa?=
 =?utf-8?B?Wk44WGZWaldxaE9kdUtjRHpMSFp5Q1FPZ0I1VXpGODYyQmZCNllCR1N4eGVz?=
 =?utf-8?B?am80ZjZDT3ZyMDRqeTE3d0kwcW4rd1JtK25zNWowTmhFOXJ2UjRuTXd2Q2xu?=
 =?utf-8?B?UVR0QStaZ2U3YzI2NDVYcXJhTXFTS25IWEVGbnFBTmdWbVZqSFRkS0lBZXRN?=
 =?utf-8?B?ZWdxM0d1blpuTmtQWTl4YWhVZklyNE1KZmFJYnZJRnVob1pyRFVMUTZnNjVY?=
 =?utf-8?B?SXVWSHBKL0lqYzlsdlF0d2o5VkgyOXNjQ2tDQUdlRnhSV0pzR3pYdnpnNWZx?=
 =?utf-8?B?MFdpZklVVGxjNnRSR01STk1rWVBaRUZrWkd2bURkazg3TGttbGxvZWdkQm40?=
 =?utf-8?B?SmNON1EwS3p4Y1ZVdEloVEJhNEtqTWRzd3Z3d2NaTmRlUkcreVNaLzN5enVo?=
 =?utf-8?B?MExFNmFITlh3Kzk1S0hQdG80UnRlWkk0ZTFTRTFzdkxDTk51NHFsb1NTZytF?=
 =?utf-8?Q?RtIoi/LQunnRjhxeeLourRDGe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4e0eee-0ba4-4f24-ebe0-08daff7dcaef
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 09:14:56.9093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gM1ackvDxblD5Ljmh+SZ7s2L3U+X5L2d8zIhr0xW8MaVHX8azYVetrToh2n7m+3VoJfK9v/1wdUYRAEBPVxyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6889

On 26.01.2023 06:13, Marek Marczykowski-Górecki wrote:
> @@ -1774,7 +1775,7 @@ static PyObject *pyflask_load(PyObject *self, PyObject *args, PyObject *kwds)
>  {
>      xc_interface *xc_handle;
>      char *policy;
> -    uint32_t len;
> +    Py_ssize_t len;

I find this suspicious - by the name, this is a signed type when an
unsigned one was used here before (and properly, imo).

Irrespective of the remark of course I'll leave acking (or not) of this
to people knowing Python better than I do.

Jan

