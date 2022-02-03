Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 628574A85F8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 15:15:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264837.458092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFctZ-0001z1-I2; Thu, 03 Feb 2022 14:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264837.458092; Thu, 03 Feb 2022 14:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFctZ-0001wR-EM; Thu, 03 Feb 2022 14:15:33 +0000
Received: by outflank-mailman (input) for mailman id 264837;
 Thu, 03 Feb 2022 14:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFctY-0001wL-2M
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 14:15:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be6fe6c8-84fb-11ec-8eb8-a37418f5ba1a;
 Thu, 03 Feb 2022 15:15:31 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-AjG7-o0AP_eZ_7waPHBk2Q-1; Thu, 03 Feb 2022 15:15:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4502.eurprd04.prod.outlook.com (2603:10a6:20b:1e::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 14:15:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 14:15:28 +0000
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
X-Inumbo-ID: be6fe6c8-84fb-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643897730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0YgL5Ont2EUUMHy9vQByF/JMgI+F1ZyHNlFHmjEREHw=;
	b=L2eLRHuzjx3gYxVhGSCSjV9liUIJyW0Y3YTNT8ToTZsoFLP+lIfruAcaL3d9Io/VpB6N4m
	RZEMEf8ARg8xIzedNweV3e4sBw+zKROM8ylaiXWP8ffmcRvhEM8jwJ1DdZ8VW0VkMuZObC
	2UyLWxC2AbyHloZLTR7AvcpiAT2iTJw=
X-MC-Unique: AjG7-o0AP_eZ_7waPHBk2Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/nSyr7PYNeTJQaMFarj0A8RtNXbnr1L5gaABOSkg7HufeOh/uOAbFCmHnVbF1RXVYw8mvmXdu1hv8SSbzbkF20VbwIBmRPC5i60e0hTL73nxtywXS7UYfyUCQjJePRDeNBqS9NpmjCVhp/m19iOCS4kk32yG/KAIFWnH1H56qF5RkXbh80VpB0dpbHdkFu/thq5W//Gt4/Zkk514xLW3aOLUVAjEBF+jr/wVIXpTcT220nv6vlav550v/FcXeyGq8ZBAXu2tjh9u77eGMD/2hM7zRgrVOUn2hpyDdiwfnEggMVTHT7JG/79qlMVGzKa6hgZYHyVQK/qIu4b4iSlqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YgL5Ont2EUUMHy9vQByF/JMgI+F1ZyHNlFHmjEREHw=;
 b=muLzeO0O30RpSIKOvqUFrAsD2/B5pGKKtfoTkZXM+oCI0IZr28dDwIgqoUiHqIzer73fbTQfTKDxA7v1kl7cIhB7D8BK45YpKTrEGjMhAix6JeI0eYkyGUZCh3uj4DTWxCpK0NJx+5ilY0R0RPo/32FdUxUMKjygIxcISo2s3GFABBAP8EEz2HTsNERB8/Zg6GwpHRlaRs8y7waLMo3ccISTSxZXAQeczmRSNTXSkBeXRn299xqxE+AayNUpXvYsfFA5q0BRYxe38B9K1wfGr1VRRUe7sFiUqJzII9avMy8bLV0cS9GsIRn1kfUydLBwbl85Xu+KE4bXw/k2LYpxKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f54a718-86fc-5340-7485-8251fb04964f@suse.com>
Date: Thu, 3 Feb 2022 15:15:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.14.4 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0011.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0765c953-3bfa-4e0a-c81e-08d9e71fa11a
X-MS-TrafficTypeDiagnostic: AM6PR04MB4502:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4502E8F60974C8A0C950D079B3289@AM6PR04MB4502.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wyQbEqbSUbDcNwqSiiJagqL6ZGcoLyxdB3qz6jpWYHamA0ITfHWDE3fitYspQcaH6BaujAdnkRIQ8/0vSYOOKc6yj8gRYLAwGPmWTfBSPiySKeiZykpwmiDtERd/bqZgEO3ygTKbXUXE/01f3+auMYNiJ3CG+PQr//XWbrqFn9zkLJgPsAGb+NQUO+Ul5xrPpujU/aYV/KhK4ifZGBjqcSb4oOU12UzG98CoYn/7e/eW75zS+uto7ak/Xwyi0/OfrPev5JnmYepMGLDFdje0VKOs9bJAmZc6rZq/AJ+2wQK7mITRvmWmHqhebRyis+vcfQaj7Cw6XMEJR3oAhRKTY+FGr9GbZyCT67YjB+GYGnhFPw931Hpim4F//7l6PZ1y35YcH3zy8qTJslrDEmqvL35KexUqQaSVh3Hj57rBoGJbKmeti4lqZNKSuuOtNdkcwov2LORhJc6D+zoE01wkh+5uJ96J0oUwF1l0D43AzmmuxJQjBgUOCs2z9xpcs+yMV8CSF6xOkg/BMuJHxjqLFcD2VYoAWSVjPTk4zTuh6Nc7/RkxJrQ+Veb3gl8xj/PqNJgAeVACYDMLGKLLp+yWrzOXQHzs21El0d1qZObFKzrMHPMKgZ0GxOW/vclDTSaRw316nQOHMZyy9X5iB9eIaFrtUG+vok8GuwY3lXuTY9+WkLY0hK01R5ErUy1XVgcUMpHFbsJmrudBSbG9JZpUGj9nTgT2YNgiWito+pW7+nQlOL07h0V6W8q34aygenJOMfCXsYT2Q3XcOc/zkFHyJXEXbTxtn/PpKTn/WxKwt7Z87aLXsHyz/f8xPflWQR+A
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(31686004)(4744005)(2906002)(6506007)(450100002)(5660300002)(6916009)(36756003)(316002)(38100700002)(4326008)(508600001)(7116003)(31696002)(86362001)(8936002)(66476007)(66946007)(66556008)(8676002)(966005)(6486002)(186003)(26005)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXhtVzVnbUhPYll3S0tZUTIvcDM0THZocmVsYlJyeTZCOXUzVjQrdGMzUjRZ?=
 =?utf-8?B?cVZ4MC9DNFZ6ZkJzVVNrMVZKbk9yQXZteS9jSmdEVHFXWFdYMHdxcWl1T2xQ?=
 =?utf-8?B?OTQ3M2RjOGs3dkdUTGRoL3dhNklZc2tCSHBuc2NCWWI5MWJhYkE1RUQ1YWQ3?=
 =?utf-8?B?bTIxeWZoNkxqNTJFZUtUeTRhU0JyUElVNWNDUnQ1OUhoTDhsc1Fqc1YrTndV?=
 =?utf-8?B?T1hGYmVMUTZaRzBmYnZSdWVjeGJ4TlZLUGhvdCtOM0U1b25uQTZ1UFlBdWFi?=
 =?utf-8?B?SXZLNGR6aGpMOWx2cmRFZEtCTEhORFNxc2NoaXY5d0ttM3VOb00vVkVGRU1j?=
 =?utf-8?B?bWUrbS8rdXUxVkw2RitiNzJUYXNZejRPdDhRclczYUgwRVV1MXV1cDVEV1Vx?=
 =?utf-8?B?SnJaM2tXdmR1QWFueDZWdkg2WGFxV0kwUDhRVzVPR01ZY0Q5T2VRT2hZVVZP?=
 =?utf-8?B?LzEvRHN4UkRnd05pZHFMYVdtZm5UbXVwYmpXS0NJSWpWcUpGSWg1YlM2UVJV?=
 =?utf-8?B?cWxCVzB1ZDU0WVRMMGFadzFKQjlmOEdZZ3NJRENpeHR2cFlDTlF1REFVcjcr?=
 =?utf-8?B?azdmYmo2bHZqWmlwT3dQeUFQQWcxRmo4RTJXUUFlU2xEdzVGRytqdS9rSXJG?=
 =?utf-8?B?aGc4SUwxTlEwdUZJUk9XM1VZZ0R2eHBPUTIvVlVMQU1FVEJjbzZWdjBtWGFS?=
 =?utf-8?B?YktQajJJV1ZlRlZZTUROOVpaSnJqakVkNTNEeUtFMEcyVDFuM0Fwekl2Y1Jo?=
 =?utf-8?B?N2ZHcCsxbndxVEMwNWNZSU5sQkFwdUQ0MjlML1U0Z1FTdS9SRkxYUVpkUkQw?=
 =?utf-8?B?TmV0UE1uNTM5OHZkNjZ6aSt2M2oybGIzOHYwZGo0eG10YzhjRTM1emI4Tk5n?=
 =?utf-8?B?NE04TU1USWhqdWdDWUFvWUJCRGFEd2dIbnJYbHd6dEFrQ2g1SUpFSGIxY1Nw?=
 =?utf-8?B?VW8ycjdyUUJmYUhsa3hncmcwYzJOenFQNWs0SnRqblZpTmdaSnkvK0c3SWQ0?=
 =?utf-8?B?RnV6a0dnU1RPQUhaYldwc1dwaUZ1cUwvem0vbnF1UDJxYXpVL3JjaG8xaTBP?=
 =?utf-8?B?SzlmUzdESkxOSHZOa0tZeURRNU5Sd25GUVBFeWtkN3FTSnVMN0kxMFE5bVdF?=
 =?utf-8?B?OEhaQndhdFNydWJIb05mcDBsMXRGTjM5TGdTc3ZXSGIxa1c3NDRaKzVkSnZo?=
 =?utf-8?B?TmdRNEdld2NPS3NabXBhQUNkTVY3bU5GYkl1SjdJWXdONk04WVNLYjJBcUUx?=
 =?utf-8?B?bTNHVzk2RUJUZWdONUNXeTdkVnM2allPS0tHWnlCY0pWZ0trR1BWc05uNXhP?=
 =?utf-8?B?dGRPekNiN1Z4cG9aUjJSMXAyUUFDaGJvT2xXWnRyVHNFcjJ5a2pVQ0pDOUtI?=
 =?utf-8?B?dVlVTFlnWGNINDROb1ZwVXZCa2xKS3lETStYSk85TlZDbjRnbnVFQVdOM3Qz?=
 =?utf-8?B?My9CY2hManlkRmw2c3IxQ1BpUkwxU3ZpMk9aOWFObS9HTzUxeUlJSFl1K2t6?=
 =?utf-8?B?eWRkRVZZbkdPUDl0OGo0VXFYTVZGa0tOejZxbmltVm1pVmZTSU1LVTdrQ1lu?=
 =?utf-8?B?YWhwVmQybmtjS1BFSE1iT2doOUtDNEgrZVd6a2xZYlQxYnMvcUNOcytHVzV6?=
 =?utf-8?B?Y21XbXJORGdKSnNsU0FmNCt0MkVQTkEwNE96SlhEcTgwY1lQdWpqaEczZXR1?=
 =?utf-8?B?Um1WdWliUURnS1Z0TGJ1M0ZxWmozQ3hjZTRnbHI4UlMvR2dOd3BBU0NiNith?=
 =?utf-8?B?eWZvZnpvazc0QlRiVTFJekdOUmU4TUdMRWc2WnFFVFptelVmYWlDQ0VwRE1q?=
 =?utf-8?B?UlJqOG42bVU5Z1FSY3FSZHRjZ0NHeDlZVTJmRnVWckFxbTNESmZDNzFQdUo3?=
 =?utf-8?B?TU94MmZ4RWFPNysycHVRZWFLb0YvRFMzbzU3akIyN3hGS2ttK2ExLytvYUhP?=
 =?utf-8?B?R3FMMnZ0QXBtT0pKUUNIU1VxK2Ird201RmpLSFJvRHlsTUdCUEM4NWtqN2Rj?=
 =?utf-8?B?OGs4eC91WXZ4U0tNMGltSHc0SVp0N2xMSDRYOG1nWUp2TC9xRStxYi9XU3hl?=
 =?utf-8?B?VUlOSi9nZ0ZibC9zTFQxRXc0RndYT3BZRkV1ekl1QzFZZ3l1eHlIRmZCVmlo?=
 =?utf-8?B?cVlxWFljWmdoS1JCYkNFTEg3dERVWEdoQnFwSFBSaUROSG5JYnJ6U24rcDRO?=
 =?utf-8?Q?n3RATZwb5GSrvsrJbt2JMYE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0765c953-3bfa-4e0a-c81e-08d9e71fa11a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 14:15:28.4243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzoVMQpLvqKrgJNbuFJTkDzdb4INddCsQxZRF5Ki7WNVORragHa2QB1b5Y+Ebnnl+yFp+qXTctNHh7WH3CB6RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4502

All,

we're pleased to announce the release of Xen 4.14.4. This is available
immediately from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.14
(tag RELEASE-4.14.4) or from the XenProject download page
https://xenproject.org/downloads/xen-project-archives/xen-project-4-14-series/xen-project-4-14-4/
(where a list of changes can also be found).

We recommend all users of the 4.14 stable series to update to this
last point release scheduled to be made by the Xen Project team from
this branch.

Regards, Jan


