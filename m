Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E24456D41
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 11:27:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227745.394028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo16c-0005iH-AE; Fri, 19 Nov 2021 10:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227745.394028; Fri, 19 Nov 2021 10:26:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo16c-0005gU-5W; Fri, 19 Nov 2021 10:26:54 +0000
Received: by outflank-mailman (input) for mailman id 227745;
 Fri, 19 Nov 2021 10:26:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mo13P-0003FS-QB
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 10:23:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0845628-4922-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 11:23:35 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-V064zvpUOR6KQK9OlhyBEw-1; Fri, 19 Nov 2021 11:23:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5168.eurprd04.prod.outlook.com (2603:10a6:803:56::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 10:23:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 10:23:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P189CA0016.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.21 via Frontend Transport; Fri, 19 Nov 2021 10:23:31 +0000
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
X-Inumbo-ID: c0845628-4922-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637317414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s9lhd4h+5NCuGWKWiKjPu07VXVlsfujEz5D+3IHDPrs=;
	b=EhAPmzz8mYpSvpOxKtS1UdWNJ/Rx27Mtlv5fl3BcbV4xLOT4n82ZUn2Cd63NHXv9eCMPSV
	kKCmxqIaIlzgm/23SJ9JS3pw/lzEuPcgPK782+MP7fYFeqOIP0PZf+viEvdtF3tnK6CHR3
	cjiRrl+V6f9koA+039U4Q37yg5jNLPM=
X-MC-Unique: V064zvpUOR6KQK9OlhyBEw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGFx1LVdpmNl+Jq2QE1XbnjByd6FLV+2KG8l93sLFRUiRSuY27yAzBNBziu4xj6chy3HcFtSSMljcR39DgpljkPsRLGnbcNvUZIezT6ebuj/2EsNF6gDsd22ROrLUrpHLHUtuTPXuM2A5f+7CfJjrDvbkQ9lWR9pfa67GsVvb6AFqEgJXuNFROSe0sGyb9DDwwdu5HVRPGZtNLihcMAJLKx++L1E946DCCeYn/STJp/QCu1mNrEGiStkti0iRWqPEpozjkTLzFwiuTA6kzuRFik7+ZyNbMYgccywCRwP1cHXv7SiwFVRlGLIbQc02HHZSwAfQAWigo5B5EcsXVbbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9lhd4h+5NCuGWKWiKjPu07VXVlsfujEz5D+3IHDPrs=;
 b=S/b4mYP2+fMjHu7DSlaNcX7nxPIL+UNBg+xkH1hnrNFHGXclmy1/kaqcpM0Wr+Jml2i+sGOsXLl0vgXeaTNMK7ehi5dvfOPGex4KTONl5hXaOUibaXs+G839ZEzUoOkI/Z7AoGT7Yh6Q72I4+myfNow0hmQl3PrH/20Y1xSAGY3ru3aG8HzsIdlw/KtnMLY8kdfXd9Pe/PNYRvLpPhDZG6nYKX9C7Of2erEYfUOFhCGVmHSavRl6B364q8ZtCpgTxA4PEKo0ADd6LmyoeuBj9AmpVqFizrATEgSO7VsmYPdk5Pdf7f1DesBJ/xAZ+UllQDaAAjdQ89iINln/GoEmpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <02555939-5720-af2d-6a0f-550709aab884@suse.com>
Date: Fri, 19 Nov 2021 11:23:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 7/7] xz: validate the value before assigning it to an enum
 variable
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
In-Reply-To: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0016.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ace4981e-2069-4511-42f4-08d9ab46a36d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5168:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB516808FD6A30C45AC6DC9AD8B39C9@VI1PR04MB5168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1NHDCqwSE2/ncGNNwjfICdVnUdUbqxGEtoE3ncgftQJmvyWlmKrGv3AHE4Zjrkg0IipN+JOydFOd+E61oRO5ouIW4UfVY78Uk1hTyXokABydLACpUv2Qn7ELkvD5fj5UW8HNxkE4n5dVPaJm2DIXX6yS+IAHqAiClgx6DeCAMtYWg+++xAmtM8/iHtC8u8sLaRKOaQnQT5apSWuUbv5lnPFwGGJZHaKjYHAEGjAay8DMA1XQqLUaca2G0g6ZdxgDhOFwW3xKQZvEoY+6dcc9Qw/+NVgapjj+5BmB/oRe0J3K5r5Iio+0B53IqraeYlzOLxl5hFzDUehuAnQYjpmecqhZcNJThIXAQqq4I+uzWm0xTom78LPKuXowhVAslD/rljWpFIyeMuygt+NcS4DfPSZkiPjmEmxvCBIEUsS2hqZ0g8itH34nE1oUFtsWSt7tcZEsTv5ISflrKPKDJ2v8P5CWYQrCNWM0skTkcQWDJ1gZzKIc9IFFqVka6npJNWKvUP0IN8BIfkdQQcJ2Qi0Oca5TU49hknF9XXUB22jpE7MpXbbF+kjsxFrHzLEEGTx7cg5UC+ZbjU2KoN8G1XBpUnPwxLglXooAUhi3020tZ3dZmwC48nGEhDsTWxxwDTtyTeQtEbz/ROROnr0zAmvEeEyWaa16EEcjMqhVUjpq7fhYV6UPzyGoXWpeUzUdF3Vl6fjFvfamkg04m7AgbqnkQnK4TqfEcRDb20Ya9oYI8ZnaG95hq0PbOpF5TQeDNAK5TZcC3GwQEPl9kqrPNabSxeaMbn8IGM5LJrTOAuxigYceEOzDzVGrMNRSwXgTh3PQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(6916009)(38100700002)(66946007)(316002)(6486002)(16576012)(8676002)(966005)(86362001)(31696002)(2906002)(186003)(956004)(5660300002)(2616005)(15650500001)(4326008)(66556008)(54906003)(8936002)(26005)(66476007)(508600001)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTg4SVphREVmeUN6dXROaGRMMUU0Y2dGL2VNMVplL0JhZ2s1dnIwVW1mSjhW?=
 =?utf-8?B?V3h1RW16NzVGSWFKRDNzSGtFUWVHaGpLUndtNVBJZmVwdkRqUHhsQnBLaHh4?=
 =?utf-8?B?T1NRQTFOSjNoSVVLREs3SkwrS2ltdzJHYWJHTXFQbjRwZ2prZVVTS1RJdG1X?=
 =?utf-8?B?SjUyWEZrNTNFNi9HYWhzMVMxNFFMaDdKcFZWUUxqOVVaMEV4T3JaTkFNdDNa?=
 =?utf-8?B?L0ZXeGxMd3NuaXFxRDVCOXZiSVMwV2xQR0J6V1lDZDRZVTk0NS9MamgxMWli?=
 =?utf-8?B?ZlZWMTVLOWpiS3lYN2JINjIvWnJHdkNQdEZlNEVEYU5FMlJQS1ZZS1VMaEZC?=
 =?utf-8?B?U0pCSzV6cldGMTNRZjVkSWhMM2xUcGUrVEJtWGpya25pSFU0U1NRQ1U2S0pE?=
 =?utf-8?B?KzUyMEtQQnVmY05qVFBZazlUQ1Q1VU1KSHk5T2V2UTZOZno3MlNzWlk4OTNv?=
 =?utf-8?B?dDFoNkJLcjMzMFpTQk9jTTZVOTlIN2dCRUUrMkg3VDJoZkpmZzM1djNESElZ?=
 =?utf-8?B?TUk2SEkvdVNQa0ozYVQ3VXFET0JiWHJtQTdzYU5oSUkxZzRSeHpCQVVDSzBQ?=
 =?utf-8?B?TGtINmNKOXdrdWNHaVc4VE9NL1Z5TEEzVlAwM3ZrRk93UGxBV2I3ZmNBOGg1?=
 =?utf-8?B?TktoYzVyQ2thdklKaGpmUzN0V1JZRUFtc3Y1OFJlTGMwZnE4RlJORmZaT2p5?=
 =?utf-8?B?QjVBSmE3THhzaCtXMnFwU2R3Rkd1WTRZRDJ1RkxxdXBwcldtdlpSYWcrYUdi?=
 =?utf-8?B?MGI4bzhVRGt2Rmt0Z01BVnZBTjU3eTBqTEhxRFhxTHZnaHVRdTU0c1ZQbk5q?=
 =?utf-8?B?MURTd1FlZ3JYa1Z3RmhvSFlZMGRGS3VWUWpCMVRqeEhSQUNSNXNjSUZBMnNr?=
 =?utf-8?B?UjBFMS85UTV2UENuWjVad2N4SDljZXIrRXQvajF4YWhOcnAwVzBFK25wVEhB?=
 =?utf-8?B?MkxJWW9rSk9tWEJiUTRJUWYzWlF2K3llY09MYVM0N2RXY2xNRFZrRlNKTHNY?=
 =?utf-8?B?dzVLdjY5MEVUbmJZMlptTkJ6T3FaaExmNGZCeVdlQWFlRXFlQy9yVzlWZytE?=
 =?utf-8?B?WTVMZnZ5YW4wR3ZmNFhqVWpjY2tSNDNxa2c0Mm16UXZGVzRpRThrWVRQN1JH?=
 =?utf-8?B?RkhEUmRTZ3prSmtKTzhkNHlmWmduMXJoeDNJS05BTWREK282cWZPQllQWVRT?=
 =?utf-8?B?UmpLb3hGdGl5V3BYT0Eyb2VqVkxhVDBBRTJQL1lIVmlKNjQyVk9KYTFRdWVv?=
 =?utf-8?B?YTE2Vzkrc0c5YmxhaXQvYkJuY0xhWEszZzVJSkZIN1ljSjlsV2JzQk9QNzc0?=
 =?utf-8?B?MDdYU2trNGQ5WllHZkNMM3E4a0tvVkl3L1ZIR1hOVEtvbGdCeWxKSk5yeE9T?=
 =?utf-8?B?L3JhOUtRVnBoSWJLYW94a0VSR1kxRENIRzZ0cTJiNDFiM2FjMXdGWTNNczBB?=
 =?utf-8?B?MFZpVVJuZmhEcm5lSm5BcFVsV1NEd282QWNlR1Z4VmVqMjIrSmxaN3BzaER2?=
 =?utf-8?B?WFR4L2JzSE51WmJMNFp6M21iNWQwbzRsM00rbGMvOTVma2V3MEwxNWZvUGUw?=
 =?utf-8?B?L2NCeGw5TmNJbEwvQmFyUFYrR1h6SmlLMy9zUk1LOVErQmNSNTZvd0g5RkRz?=
 =?utf-8?B?UXFRVG4vTCtLN1Q4QWZLTldYQW5QNkdjS3BTWWlFZWNsYzhaTC9FWDkrVkE5?=
 =?utf-8?B?Uy9MVU96djlrRDJoWGY2UGRzQzJYTHI5TlQvVUFkREhscmlIanU5LzZMQ0wz?=
 =?utf-8?B?MldXMTVrZDdJRis2b3hLS0JyRG9GdkdRdzdrQmtrYUJEdCtsQWp3WjRtZkJm?=
 =?utf-8?B?MlkwYnhTbXhUUnB1Z3Y4WnhaVER0bjBNbk8xdFgyK2FmNlZLZTJkbnJYZ1Mz?=
 =?utf-8?B?N2ZlNlJHbTBWbFBRenpVdUhWN3g3WmFRVzV3VmxTM05XRkRlZ0xTS1FrNnZX?=
 =?utf-8?B?UUZRdFhnSEUzUk9hVU1vRFcwcXYwbEU3WnpLWlp1L2s0dE4wRzBPVjZuVkhz?=
 =?utf-8?B?MHdTQ1g2NzF6Nks3b2FFdllvKzVLaW41WWhOZ0xtVndrTjdHclJuTEgvdXRS?=
 =?utf-8?B?UXd2ckpMTzhGVndVNlNpUFdFWG1DV2pjY0R4bERFZzZ6dXF0RFd3ZDA3YU5M?=
 =?utf-8?B?aEJYTXdyRDhFWlNZQ05wSllFaWZ6dms3NzBXdGk2ZENCMVp0d0ZBeDdqU0hk?=
 =?utf-8?Q?+el0F70fc5HcwPsHN3j2ru8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace4981e-2069-4511-42f4-08d9ab46a36d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 10:23:32.9372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEIpYqLH4tuD6vvJLV8yRUCkF4QIH6Dl2pBuqxh8Imw8u3lnvhlQcrt11UaHCRNYM2tQvZTp6D1DFmrr82O8Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5168

From: Lasse Collin <lasse.collin@tukaani.org>

This might matter, for example, if the underlying type of enum xz_check
was a signed char. In such a case the validation wouldn't have caught an
unsupported header. I don't know if this problem can occur in the kernel
on any arch but it's still good to fix it because some people might copy
the XZ code to their own projects from Linux instead of the upstream
XZ Embedded repository.

This change may increase the code size by a few bytes. An alternative
would have been to use an unsigned int instead of enum xz_check but
using an enumeration looks cleaner.

Link: https://lore.kernel.org/r/20211010213145.17462-3-xiang@kernel.org
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
[Linux commit: 4f8d7abaa413c34da9d751289849dbfb7c977d05]
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/xz/dec_stream.c
+++ b/xen/common/xz/dec_stream.c
@@ -402,12 +402,12 @@ static enum xz_ret __init dec_stream_hea
 	 * we will accept other check types too, but then the check won't
 	 * be verified and a warning (XZ_UNSUPPORTED_CHECK) will be given.
 	 */
+	if (s->temp.buf[HEADER_MAGIC_SIZE + 1] > XZ_CHECK_MAX)
+		return XZ_OPTIONS_ERROR;
+
 	s->check_type = s->temp.buf[HEADER_MAGIC_SIZE + 1];
 
 #ifdef XZ_DEC_ANY_CHECK
-	if (s->check_type > XZ_CHECK_MAX)
-		return XZ_OPTIONS_ERROR;
-
 	if (s->check_type > XZ_CHECK_CRC32)
 		return XZ_UNSUPPORTED_CHECK;
 #else


