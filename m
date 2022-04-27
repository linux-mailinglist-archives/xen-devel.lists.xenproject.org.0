Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AAC511532
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 12:56:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314894.533168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njfKt-00061X-U7; Wed, 27 Apr 2022 10:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314894.533168; Wed, 27 Apr 2022 10:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njfKt-0005yq-Qo; Wed, 27 Apr 2022 10:55:55 +0000
Received: by outflank-mailman (input) for mailman id 314894;
 Wed, 27 Apr 2022 10:55:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njfKs-0005yh-Lo
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 10:55:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b4252d8-c618-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 12:55:53 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-fxsvVFLNMsWTI_i7R87Xtw-1; Wed, 27 Apr 2022 12:55:50 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB6613.eurprd04.prod.outlook.com (2603:10a6:20b:f4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 10:55:47 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 10:55:47 +0000
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
X-Inumbo-ID: 9b4252d8-c618-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651056952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=skwrGfE8+Sl7mGdnYdHqvyOb61t/CInea/7lOr5rcj4=;
	b=dxD+uqxQ2nsVOh90udvghmf22l++MXymhKrWOfSU4zSZhqTgNbYi7QXcblUxR+wFQr8jV8
	k8KgYNjTOcbxakIW66DBSjJfUm60Ie5K9iqlf0zohmLDnZgkMH3z+pPt1z/bf1vzgf0hZb
	X0spHod+RC6i1GyKabAzLZBMUrhkqcA=
X-MC-Unique: fxsvVFLNMsWTI_i7R87Xtw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eg++lbbF1ENAZ0g9R5j0Iyg+Kh+mitm0d0gaLy6yjnF29LXfj2WukO5aSxlpFy0GdiC/Fi2lPdpKF6LJm+FK9AaWeihZlRzUgKai/XcNZ2/DyPathh9lDJAhURy/tOu5D+QKTq7WOziFbB15WlPBEGrL0j0d6s7TyOKpI/R/IFGBWueZLMIYMHo5ZsKLg7d/x5srB5Wscp5OUNwtf9ypTJ7wLrznH6fduRxa7mOkmatMdGVvEsN00AWmxV3Ke1bERZtx2g8tU7pKNKTOx57nv3h2f8dk89C8fJxzMKEhWAJPgBqtMkkP1fx2BKLSMFnOnYwb/rHQEYTJuYb7S3jt4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skwrGfE8+Sl7mGdnYdHqvyOb61t/CInea/7lOr5rcj4=;
 b=A8UeITQpkS+VbklQSWYmxBstamVZpn7qtuqkB+KRM4vrCVgO67H+7QfSn7vtFCmNE/bYeihKlZuYc9TDnS3vJLRnb+mhmVr/PyeoKc2jr5HtT4Cs0dw7oZg9ByuqxzHcMyGa3vU5zRba3uOO2cWj8mdnhMSbmvaHvKQeMu6StiZKBrUHMewtRFA7HkiIbQpQyDt4K1Mu3LfoPlxIOFW3vC1tqma09nlWe4cGt59IuCur0/YoCLLJHgyMnEpXz66jY99iwAGmRUfDCetOwMwC7jxQWDqH8SNLYFC+gAxyMcn86JSyp6myeUfeA/TmiiB/InjVe0NC9ZtLCyzFfab+1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <58aad4ba-af15-0189-5336-698aadfcf905@suse.com>
Date: Wed, 27 Apr 2022 12:55:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] bump default SeaBIOS version to 1.16.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0077.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e565a385-1949-458d-27ea-08da283c7bef
X-MS-TrafficTypeDiagnostic: AM6PR04MB6613:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB66134908E91EEBC8EE42C23CB3FA9@AM6PR04MB6613.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FfyewvEex8FmStUyfLnAuJzTTaM4eiZgSKo/oT+zgtF6Qj+QRbprWBM1OErJ7K6rUU1G1oILJPkEZVxsvVpJ8ciEDYrfEQp+ZdY1D0Lj/MsxTitRsroMhJ6gAwEihr85mYolD2XYSsq1M2PQPPvOGr/3PiOCJPW45k+5iv1Wg2aDM7kOArDKhf2KYtCkFyUxtr7AJbtOeDQE1BK/iUGVmUwo6r7o9/4tD1pMLxqCpjQip6vJ74xNZ58uQuxStSQhTwfIOhHzlzmqzXFV2WKxJ1nJImu4pQfylGtTOvCajER04PislsfGnfX8I/DcL3spaYlabP2cURE0jdruUEE/dZpOg+hHREy6VVGuCtHfB3cKZ0KzUpE1DAV2GjhsTdIwMcjYedakosRnRhJNg7TL+WkoDPThywNbp8rHQ6HwCqr15GsuRjYSyVaJQOUvT5GaEQlshpIrmtg7dK16j4dENn0C2IIijROWGyZWPP6xHXG+dxVzqIRGeg0mBODtR5ZMbennL9ioLbckjdy87/k+9qXi7GrGapboKUDAggHFhICfEOPfnrBNAD59WT7cZPwv0Cte1RWuiT8c6Wz/SGidSO060/hbQjOP4AXk4I+RAVI31Nv6BoT9GCR1qEwAJcYtIV/j4rf+Fj9dhw4fweXgqZ+U830WE3kya1xQRyxtrwXbCMOSIbw21Dvm0BUBXbuIHlWgid3Jm51M/mi3cqcg9DMdah84U9CRQv8tNp+AeCG52dL/1+T09SEmmSiF3I/N
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6512007)(6506007)(86362001)(31686004)(2616005)(186003)(31696002)(4744005)(8936002)(4326008)(66476007)(66556008)(8676002)(2906002)(5660300002)(38100700002)(66946007)(36756003)(6486002)(508600001)(316002)(6916009)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjhCYkFBTURGRVk1WFBIS3o4OCs1SWNWRTFVWllKQjluOWhvOFpTTXZ2NG1B?=
 =?utf-8?B?NlJZTCszMm1vMWYzVDZCZkNSRnk4VjJUNktNdFE0N0pTdnFBYjNSOXo3cGVC?=
 =?utf-8?B?Wkw0azNQOUNFOW05V1NIMGpNQU9jVDYyVUt6YzFCSkNVQXgxQjZiQ3F2dWZy?=
 =?utf-8?B?eVBwL29qaEtyQk4zVjJiRE1ESkhsRWhsY0RNVnpKR1RnM1pRUnM1MHk5UXB2?=
 =?utf-8?B?bmMvbTQxRi9mQVRKL2Qvb25yQkc2SlZoK2NKNkpjaTQzTk00cVZLN1hHQ2xH?=
 =?utf-8?B?ZGlBQ2RoSlJVb1F6VmI4V3hWQlZXMm53cDdZakVOaTZxUkVHNzNpamlNUnRn?=
 =?utf-8?B?VEYyNElOQXg3T2tYMTg4Mk9tTE1laE5VZElJSzdUYnB5SjE1aDlJMEs2eXVX?=
 =?utf-8?B?aTlHS0JjeDZDY1V2NTgvVXVpbnkvSXl3bUZpWm04cndLSzRhSEw0Z3U2aGpP?=
 =?utf-8?B?aWJCTVA5dWZUUWtOVGRSVjdMMi96bWZuQkkyU3lNZ1A2elk0T2RReUtLOWZr?=
 =?utf-8?B?dGlTMllWeFFqWE02OW9xUUlSRkhxWUNPb0lFdTV6ZHRRalZkTTFPVmVvWEk5?=
 =?utf-8?B?V3R3YUpFOUE1ZWJKVkJDc2pqMEdFVStub0JpcWtuWlpnb3QyMG5IZkVSTTJH?=
 =?utf-8?B?M3JXQWhnVklsZXFwMkh5UHZlbVJZblpidXFrM2RVcGtVbW9OMkJvTXZGUHZp?=
 =?utf-8?B?cld3S09EVXFiTjNmZ3dNRWNBQWJDSUc3SG81dUpsVER1QUJiK2xKMmVheFhz?=
 =?utf-8?B?NVByckhGTm5JVXR4L2NsbHNTK2Z4eTVTWlljSW9ESVp6eFM2dklaVWdyUWRi?=
 =?utf-8?B?blJsSGdrSGNGd1BSNjRqZERPaVRQQTRXdE1NTmYxRE90NWl3ek42UUo4YjJE?=
 =?utf-8?B?ZXFEQTJROFVJRDJZTkx2cE10UHo5K3FhSXZXdng4M291YnYvdEdNN1h3UDBI?=
 =?utf-8?B?S0pIN1pZbGUvU29taEhYZ1dKVjBac0VLbTByMkJsbEdFR0p5WEtJeW40NkdB?=
 =?utf-8?B?ZEE5VEZRVmI0aHpzZ0RyUUNialVvSFVLaFJtaGJpRFRMaVkwb3RYb2ZOT0Yv?=
 =?utf-8?B?Z1lUSzJTNnFubUIwa2YrSkpEVERnY0F4anFSR3JJbHRLbDlLb204ZjRia2Vw?=
 =?utf-8?B?dW04bTBVYUV3S2hmV01kK3RlU3phMEVBOHdoTmQyNGoxSi9DNTgvVGtDSUU4?=
 =?utf-8?B?L1pRZ0J5QlJNcE1xQnBoRUdDSVRORjNweE94U21tdDFISXhPUFJIRnNXZzNU?=
 =?utf-8?B?U2tZL1hLNmFyMUVRSXBjWU5SSnNWK0JkanVpQ2tVTHh5bkdqU0xkL3lIUnhQ?=
 =?utf-8?B?Ylpla0FQQ1ZqK0laVmNYT1hlMTV0b1RQaElZbVRaMXluSGRCYXJyZEorUWt6?=
 =?utf-8?B?bmlpR0wwS2Y2UXk4aUI1NVVLbXJBUjh2WE1xZVhHUXFVS1QvemZ5Qy9QZlBu?=
 =?utf-8?B?V053WWFpYlBlNHFsRlFabWdQSGNqMitjeGhRMHk1WmNnTDNBc2Y3N2FyNVU0?=
 =?utf-8?B?R3hCMS9oQXVTZjd2Qm9rZVM3aUFpdTkwMGRIYTRLM1c2dUJFbEpyL2x2Yk5U?=
 =?utf-8?B?Y3l3cTg1UG8xaUs0Q0lRVmsrWDBGOVpyUXprd2FHRkNGaU8vMkNNakdjaU5W?=
 =?utf-8?B?Q0xwYldwbm0yMWtpTHJubFhob3VFSUtVUFNpd3lQQUhONUhCQTljalVKL2dt?=
 =?utf-8?B?VTAxZG9FUFFwVjBGNWtqVVUvSnFnc0pSeWlCSVRtdHN1aVZmRHpMa0k0WG10?=
 =?utf-8?B?c3ZqSTZ6VVpDSkkrMGVnTEdqSXRLdnp5bWhhWVBJREZGV2RjbGJCSTg3ZzM3?=
 =?utf-8?B?d2Nhb3VuRURBK3hRL2d3UWlBN2ZDa2ZpZ2pka3ZBOXNXeldRaU5icURFOEgw?=
 =?utf-8?B?TDY4Z2RNU2ZON0RKZ2h6QU5HZ09WblkzVzAvNVJoQ3hHc0MzN3lHOWdTQXRD?=
 =?utf-8?B?azFGSU8vaEZHRklFS3Q1ZFUvSDVLQ0R2UnNxQStNWkZTUzRPY2U1VGlhQVNl?=
 =?utf-8?B?aFdzL1NoeW54UkFFa1drMHVrM0dKUHlTWkswOXgwcEFoOHhoNlRRL3BLUDc1?=
 =?utf-8?B?dGxmMzgxU0VqaFhlek5UdHZ1YTBpZ3ptNTd3L2VFQmEycm9FTjFkQU5Hc3hJ?=
 =?utf-8?B?WUNFdFlUZk9SOVhZUVRIRU0yZ1J3YjRWOTZieTZqSk1uY3NpVkswVHBGTWtD?=
 =?utf-8?B?TUlzQjFMVFJKaTdaRXYxdnpOOUFaQkpCT21mVnQ0dHB4Z1RrMVhWZCtrNEdh?=
 =?utf-8?B?ZGhnNmpRamE1NDI5ZDRhSHFLcG1xbkZBMXpISjZZVVowSzRvMGcvVytjTzlo?=
 =?utf-8?B?eXduUXlqZVVhY2htS1RVSElNSVA5Wk9IaFYyTkpRczJsV0RxczZPZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e565a385-1949-458d-27ea-08da283c7bef
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 10:55:47.0797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53KssKYXgIEa6DcY8RQsjXxkr2878WbO0VprWkir70f81tPj/Q2kYMFIf8qot3RTxh7rTGL5TsanLk/4tzbYng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6613

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/Config.mk
+++ b/Config.mk
@@ -232,7 +232,7 @@ OVMF_UPSTREAM_REVISION ?= 7b4a99be8a39c1
 QEMU_UPSTREAM_REVISION ?= master
 MINIOS_UPSTREAM_REVISION ?= 83ff43bff4bdd6879539fcb2b3d6ba5e61a64135
 
-SEABIOS_UPSTREAM_REVISION ?= rel-1.15.0
+SEABIOS_UPSTREAM_REVISION ?= rel-1.16.0
 
 ETHERBOOT_NICS ?= rtl8139 8086100e
 


