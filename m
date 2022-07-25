Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41018580192
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 17:19:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374650.606768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFzrS-0005fy-94; Mon, 25 Jul 2022 15:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374650.606768; Mon, 25 Jul 2022 15:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFzrS-0005dA-60; Mon, 25 Jul 2022 15:19:10 +0000
Received: by outflank-mailman (input) for mailman id 374650;
 Mon, 25 Jul 2022 15:19:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oFzrQ-0005d4-OD
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 15:19:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 201ab18c-0c2d-11ed-924f-1f966e50362f;
 Mon, 25 Jul 2022 17:19:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9630.eurprd04.prod.outlook.com (2603:10a6:20b:475::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Mon, 25 Jul
 2022 15:19:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 15:19:04 +0000
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
X-Inumbo-ID: 201ab18c-0c2d-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BR6JaZIO8e65Nha7/5a4ntCW74FP1EPICFix6sIVmGzUGk7XM44xfDB68dwg7kXXdmG6u3lbITmBTdtlVP5kNfKUjHo+wVqr5BsOIYSqtM3sZrscqyzw27QbP4dAzU/zClcC/ST1HjRzEfsJPuONM5h0eOiCW3tiqSVsuF6M+X8J/UEphvYh2dMTk58Dh0q0GZQHA7tn6IZ2POBJOtNUs068ARM7FpynF+YLTDvzh6EQWVzCnRqPJXuTZSdu0H/nMho4BlSf4fP8Ygh9/oMlnox1ikMgmXw6kBxjooh4fbiApiN7kF/1lTNam40B1iF5A4DjswZ2Dvdgq3exEMHTeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IbqQ68jT7ZGxS6o6tDsOo1+4EOVu2o8VCYhp3hPcIQ=;
 b=dDQieC7i19vKHu2i6S8IBQMgs0l/H3Th+S/RJATDS/SeOSyp69XIOwQ6mzsI4xSvarfu56Kp0PrdLveTZgjbqSx+gsUKAW1KibktTmOo2Hesf46s7r4bHSUuMkdDyvi66lPkldj1lEyt/gjHlm8J67SGnRJ+fxvw4bvR3oSRzycVxCNF7IOGzgKsZkoLxIzaoKDtOV95bFa8e8HC60AmDPjfAUkRZ65tcv6y+Fj/8fy0BcdusNvy8ACNDw+VTBJNhiQA6msguBSYMo170k1DUidewvyvwUz9Qljt9q25MRz9KLiA75ONtDsKrxvIVxk+grlfY9F/D5RTy2EprW8jiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IbqQ68jT7ZGxS6o6tDsOo1+4EOVu2o8VCYhp3hPcIQ=;
 b=5W90DkCE7Iz79ny7TsPlYRfHDYjC9ZN4X69jmLevLAupQrVjtkOAn3nXfPQJGNDUtXBOlqHI3Y+aMGXLRj6eDltUNw42fkXDiOrvMWOpFWbB3A906gUfx82YPXYDyWMTLDzCm04AUCEiu0qD/WLXxLDctxlkrGZ24lo4zEqPGq4GCrCofqnv6t4a8RAfJhf3wVz8al/8cqUg+CmiyXxx+X9J2McPlBzP9xMiY9MFuIYVdMy5Sr74s5a6Jm2K1+x8KYzkg5MZAw3yO8l1w2AGPzOEwjmy1NtXQEfAr8RtCliraE4TRQ5iUaHQ6F+tT+V87gahblZBHm3YdIlHWZJo+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cb2a3ef1-ee5a-dcaa-944f-9a53d828392c@suse.com>
Date: Mon, 25 Jul 2022 17:19:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] common/memory: Fix ifdefs for ptdom_max_order
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220725144455.7666-1-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220725144455.7666-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b090e224-fc58-4a28-6690-08da6e5101f0
X-MS-TrafficTypeDiagnostic: AS1PR04MB9630:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fHLzrJwjodgEegqeGz3s93mNE2v1S54riaS8gqCWB41O5k8JOvUbdrFHvtpusF4YzqP2iz/l6i0kkPVg/Bp22EdoqxltghXX/67HJd59DbvsaGX/o5xZsPReVbKcB0FifJd+zTz9USIKTde/MQWu1ppeje0V9xcuaTN7IP6VKdQPKKKHT/9yNNIs4Nnz85rAwlYrrS/txoloY6xw8MzB0QgSv2qNrbSYJYkI92hQ94l/05Qns10d+ys/h1BEPBhAlAka5PjknngcSWoPav9INdYwgRQ+JyxKfyBSSC4DZrEETti/T6wmcNHWQS6IFEa/CVzSn3fgCxwm9UuEOru180eS96PxH73TqmFQfGUYqO4KXnE4XPNyPwqfeZGj6vIVObpGJYhkpWGabHHZQ03RDhJXHkdQq7EJ/q5+86pjQXwwiBrD4u1IesX9JkeUmseFB/OLcHEjiXOVhi61kegjG3tfX0bbs4cFjEv/u4dI3hExHUjFp4nYOCqWidNzKLDqRNDRuj6rckTdJYlPakL/FY6/a+RAzqcyF0d/2NvuQRvPAsD2VMjjiUW67SWw/Ml9Vum53bm+1SDAysmDn2nAg4L6RLNowR920q+lVjNgpwoiw7hfQ39K9kkL5Kv57uTOKgDE1nfpP2B7Xh4waIwbwVkWRtqtpV50tnYZKcD7kYSpiLhF50gWKUt+72kruFj6REmcr3TGkcHFM94SnLMxXJUho3ceuWrAnuhxQXEzJikPTsz50nZ6c8c7mTnUK0G8wSw2XqWdquUHJN43/VugkfLpr7cWuU/aOeNQPIEDkqvyfgQ++N2sYR8jyKtPYQHxq3ZuZZS1Cz7J6W+31zqkbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(396003)(346002)(366004)(39860400002)(38100700002)(8676002)(4326008)(6916009)(66946007)(66556008)(54906003)(66476007)(6486002)(6512007)(478600001)(53546011)(26005)(31696002)(316002)(41300700001)(2906002)(6666004)(6506007)(83380400001)(8936002)(36756003)(2616005)(86362001)(31686004)(186003)(5660300002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTJmVEtVMUlGempRVnE0S1JtbDZZd25pcWNvL0x6K2lBc0J3VFVRNm1YVExW?=
 =?utf-8?B?NVFXNG90TUJBN2ZNMlVzblBQeEtxT0xnNFBoSDZKOXRXbGhlMnBMQUtuS1Q0?=
 =?utf-8?B?M2tnTnlDSmthLzVqZ3MyME9TNEJsUXZHeWFxc2dkeDVJT1lURzJEZ2NHV25K?=
 =?utf-8?B?TWdBOVZkaG1kdUtHTnFkYlBJOUQxM1U0S3hOb1VsK2lDWm80cThuOCthODds?=
 =?utf-8?B?UmcycEJvUE5FZVMyZzIyODNBSXVzV3VuTVJUM0hwWmJOZHVhYW5VN2hJeG96?=
 =?utf-8?B?UmgxVnhJMTB5cDVHWDVoMkxBYmMwSzBZemlheFJyRzZ3MnVySVpwYkVpeGMx?=
 =?utf-8?B?ZVoyemxBYVlsY1Vwb0JPMERSQ09Sd3RXVXg0TmdEQ3dRU3dHNlBlZjlTS2I2?=
 =?utf-8?B?OHBmSE93WHVjbXNLaFBqRllsNEVYRWYzL3lPc3VVcmh1TmM1dW5YM3RkUmZI?=
 =?utf-8?B?KzhxVHBPVi9mS3hrU1AvejY5MEN4Y1V2Vk5IWHkvdlp6aXU0WHJnaTJHenFq?=
 =?utf-8?B?L1dReVFXZDFvU0J2em5TSU9GcEZWcGpqTTV6SEpWdXViY3l4YnZVVzkxZXlm?=
 =?utf-8?B?N2pKRU9vS2xQWHhSQnFVUFo0VDNxNFZNL3pITWwvcVhBQkRiYXVZaE5Ua1Fh?=
 =?utf-8?B?T2ZUcytqeDFpYTNrU01CcHVJMHJzUllkeFRJN3ZMVU9yRjZVSXNJRlNjZDU0?=
 =?utf-8?B?bDZaNWJZVlloRUlvc2RjM0R2NmpQcWpIZUg2MFEwa2grVXRMZ3BmMGVQeXJo?=
 =?utf-8?B?Z1Q4U1BYdkl3bUtmQUwzbmdVR1ZENGhKbVIrbng2TExJNkRuVmZTd1Bja1pz?=
 =?utf-8?B?a2VVb1gvZ2FXamgvK3NESm51ZkZ6enRZbmNGNVBKZnh5NHNDMGlIRVFLSW5U?=
 =?utf-8?B?SnM2NEpKUEo5S0xwRjh2ZjVwKzFseERTZDdCbzV6QkxteGJ2M1JtNEc2M1lE?=
 =?utf-8?B?NURxZjhzSGVSdk1mUGgrRDV0REwwbGlyaDdnSDYwSUN5RnRKTTlXVEZTcTJz?=
 =?utf-8?B?SEpKTi9ZRnhURjA2R0dEd1VQSVd6OXo3V28rK3RWS005N3FXR3RQbzd2RjNU?=
 =?utf-8?B?VHRLR29FcHVxeWcyUXhGaytVOTR0RytWTENRN2xQQTJld3NCOTNsRDZiZHRy?=
 =?utf-8?B?Njc2VVJQMzFHWnU5QlJyZkJKYWMrYnlUNWxGY1JKN1YvVHByNXVoUVltSHpu?=
 =?utf-8?B?KzByT0dHeU5LOVlFUU5BTVl1RmpjQzZKYXdhcGhPS3JTSDlrcGhXb05xeW5I?=
 =?utf-8?B?SzNVcnpPK3lybDQ0VUZoN2ZQakt2Vk5SbVFrbUhYSC90aWZXeXVzaGpHVkVJ?=
 =?utf-8?B?S2tIR3VrdzIyN05NNEVKcUxudVVtMCsyRC85SUFaWHpKSGtoSzY3WmxtczBJ?=
 =?utf-8?B?SmJVdi8yaGhhU2FvNzZLZ3c1ZjBPVFBScFhycmVhcS96SldTNkY0dHZEeUI2?=
 =?utf-8?B?bmFzUnpTckNEcFdqbFJzbGtSZy8xb0lqUnMxcHJCYkJ3NU1DUzJWZFVPZExJ?=
 =?utf-8?B?LzJ4Z3BOVUFjK1g3SVhmNCszZ1pHbVM1VU9leWcrQkFlczNRcDBiTHNIQjMx?=
 =?utf-8?B?R3E1bEZ5VnBjalRsMEFqcUFTSmNzUjBOeXJpOFhid1hvbXF3NU5KbWxRMnBk?=
 =?utf-8?B?WVdKZjNuSWl2ZFpjV21PTUUycDBBT1d1QW5wV1l0VSsvc1F6dG5hcDZ2bzRE?=
 =?utf-8?B?L2FQRjMvbEJVSCt3empzUTNMRVIrc3ZYMnVvL3YzSFpTcmx0cU9CZjNvdDM5?=
 =?utf-8?B?QUNqbXh2YmlXVFg5L3pWV0Q5cmhkNGxZc1ZwL1RDanh1SFo4S1RjcWRNWjE4?=
 =?utf-8?B?eUx2VVhoZHhmNTZBTDY4di9BQ1BWZnE3RzgwdktRRUtrZCtheDlYdlc5NVh3?=
 =?utf-8?B?b0NWbHB5RVRaYWt3bGd2Q3hycnVLY3NRQUh1TzNmdXRqUUVGS1g1LzBPaHk0?=
 =?utf-8?B?SGloMkRiOTNrN0VrOE5zZFRvMUxjVTE2TC9vN3FibGg3QktaNnF4Qk5KMGZi?=
 =?utf-8?B?U0xwQllPWVltYTFnZFBSL2lKL0ExeEVDUndJNjIrVWtCRmJmSVNINTJOSXBk?=
 =?utf-8?B?WDhzbHNIWlVDcDlNNXZsMHc2dFRtSVo1RllWcjJWZW8wNjVONzFocGZDSGYr?=
 =?utf-8?Q?ph/kUSdg+A2+e6ZEgF03uzluv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b090e224-fc58-4a28-6690-08da6e5101f0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 15:19:04.8565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chDPn6WdKn2X8eDEHu0lHLuAGSKNpTaMBogB7i8+Q8piS2Ney3lyldxpQiivl72J0JWb3wFeX0aWLl+XIi7QEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9630

On 25.07.2022 16:44, Luca Fancellu wrote:
> In common/memory.c the ifdef code surrounding ptdom_max_order is
> using HAS_PASSTHROUGH instead of CONFIG_HAS_PASSTHROUGH, fix the
> problem using the correct macro.
> 
> Fixes: e0d44c1f9461 ("build: convert HAS_PASSTHROUGH use to Kconfig")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


