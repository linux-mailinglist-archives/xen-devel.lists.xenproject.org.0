Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D75B47BDCF
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 11:00:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250267.431085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzbvi-0004TC-JQ; Tue, 21 Dec 2021 09:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250267.431085; Tue, 21 Dec 2021 09:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzbvi-0004QS-Fd; Tue, 21 Dec 2021 09:59:34 +0000
Received: by outflank-mailman (input) for mailman id 250267;
 Tue, 21 Dec 2021 09:59:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzbvg-0004QM-RR
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 09:59:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b12e8958-6244-11ec-8d39-b1a4ed000e3e;
 Tue, 21 Dec 2021 10:59:31 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-dsDafIJ-Mqm2GuIG34pHIQ-1; Tue, 21 Dec 2021 10:59:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5598.eurprd04.prod.outlook.com (2603:10a6:803:e9::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 09:59:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 09:59:28 +0000
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
X-Inumbo-ID: b12e8958-6244-11ec-8d39-b1a4ed000e3e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640080771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ayGzQ0a7dhRSTBTGqrdb54DYbHONXB0mWBYHh+Q3Iyc=;
	b=ftfnAQAbIG4BJfzyrxl+nPueLJUkRNt4m4JoOfB1ZdI25wNhgxGQiYvl9FzJeDuCW4vC5A
	VhIozsv50FKkN9P0iTV2oSbtJMqeHbwHbgviX3MZ3msUtYHXGcIH/s/7GinpePSSeskqLt
	RdJAk6B/BoM50Emv8r88ElpfXpLq6YQ=
X-MC-Unique: dsDafIJ-Mqm2GuIG34pHIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iy0FVB/ohj6QEvNN49hIq4jmm/CWfAx/M5DFFbShNCaWlk8OnSq7pzPJaRdHZS9sbXn269Yj9QWch49peL/4th1QEWlc5TASMfKfUKqFGOKcaTMCEFdyg1cY0AktdKZbYwGKqT/B7qOBHYU8NwillY0J5iX/3hKDr147BhZdUZJ0TOmEiSs7VA/v47Nyakcq6hVB2RXXjxPSiITrU7WH32WDNYfiwt6wRHUrN0rS80H9kSvO22mZoC9RkX11HFR6F5ws3jilekA1J/v/mR+DxABoaCW9MDiKKZyLLKUX69ZBuZv1e8Jp9QJ/ctH88Z8aH0eH8TU24TAO3W0JuInxVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayGzQ0a7dhRSTBTGqrdb54DYbHONXB0mWBYHh+Q3Iyc=;
 b=a7roMgcefFSQmtW+8Swq3ejcMXVzUBCsAbuc9yS6l9qKVQ1Rv6hzzMxAeWx73dNA0SDBjpSrgbyTUVvY7LLwa5V8WgeKHVrYac5M2iiBQrYF4t1yGkBLFGIaL4ZcTRp9vD72SDsuW2ExeTMlL59epA81/5rwgBx52YAsyVvJsLo4USx6x8FooEQFwD7lTa7e+aIlGDrDhsUpoZ5piBspsW+x7ozOs/4RuNeoJkC1lFm7EigxhBaQIgprXPBhVpmEsQCgBWspgYl0yzPTaBl/dayU9INEdPyCjminrubFmbhhM+Z3rNOD/VYogjtGpxmkOw/B8BoEkBgLzpFP/PRu4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <18f57385-9a17-fc23-85e0-9d4a35c79ac8@suse.com>
Date: Tue, 21 Dec 2021 10:59:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xenperf: omit meaningless trailing zeroes from output
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0003.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e557c7ad-db69-4c07-f08d-08d9c46893c6
X-MS-TrafficTypeDiagnostic: VI1PR04MB5598:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5598B1484CDAB661AF9E064DB37C9@VI1PR04MB5598.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EcYkbHtZ+8bHTKQFkA7Bj4SL272mMtx+UlTvtdNx9IEzuappgUZ3vU16//lPBvl3uCKLNKST9dmqRI+x73FZy0fIjN0ATQch8hUAkiY4BkGnqpWpdBWCs4rwa1jGXlKDsrQ6hpF9tdknX8CnyXXsOsg8zG7pYAwihsJNDnFBeI0klp0VLhR20RZxCdzOsT2s9LXaNxiQ4IatITqlSb6e+hQKIhB2nfUVACfqfLKiioKeELxpUKmC6r+kyK4X7/01hJ5Oka2uD2VzPAKHDEBbFJJYPn4+9x3nMu9Gq9vD7cUqPwkKzZkXkZiCfdIdvZh4AoAN10deLC5nvq4Vil4iigFXqQtXk+K5ZdtrJdI0ayCBF0BsUncHwd+EIz/Y2O/c6J/ZmZdgrQ0zNZogxyA6DggUVboh1Wtu0K+GPiwpTVDgYz01UQ8YpXCWY0fKer9yI7lv+syVAu3sP8jDKs+0t3vl7eAIlS/zjAm1bLKp5oIvF4RksBEZ4WHeaJiy4jU94Ey2IYKA32ze9ZjWr+HWP8LRj1080t/ojDHZmsiGJnylITZkIxoAMkJqLjKVya2eCbM4wneYg91T87JlcxLnLxqs97tdrTVsbFf3v6MlvjXbzkzU2BuFxY252CHrn2yb21FFS58llACHGjDcON+TGD4bOFFyRnLJ/xMLUohgyH75CJXg8fxOkCBc4J3Kytf1OXuLxLcGwA+tNgNHpumWnChvXhPMqvgdwDVxzK9iR+bbnJHs4aX9O72hVrnzpkcY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(186003)(31686004)(8676002)(8936002)(66946007)(26005)(38100700002)(6512007)(5660300002)(66556008)(66476007)(36756003)(508600001)(6486002)(316002)(6506007)(86362001)(31696002)(2616005)(2906002)(6916009)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnpsYUcrWitwQkpZWkh2VnFFZXR5WnRwUk8zS0gwdFBLTWVCM0JMRkZRaTdL?=
 =?utf-8?B?N08xUW1OYkNjcEd5cVAxazBiYmtFQ0dYUUtMVEdBZnVuWEhHL1hYVit6T3NI?=
 =?utf-8?B?NlF3R056Um5NT0NESTFrM29HYVNCdWFhNG9saklCQmZ3SDYrUDR4QzFaUlpw?=
 =?utf-8?B?Y2NzUlhHSjFIYXdTV1J6TC9QWXdHMXJtUDNJa3lwZ283VXJ0K0ZVcFF3NGpr?=
 =?utf-8?B?SnpVNE9IREo2Tzd6bTdyTWpEa0F0T3hqbS9JQ2J2bnc4MEpGemprRGIvek51?=
 =?utf-8?B?WmZVTnpuQUpJUzlTTVpmbmVRNWRraU5wMkZEYUpybWFqYVBONGhLTXBxK25X?=
 =?utf-8?B?WHFTRzJqRkZXYmdUVUM1cGo4MEJEbU5XTkhrRC9xY3NtbWdLc2N3cUIwS2tH?=
 =?utf-8?B?RXg0ZHBDRG1sR01CQVBtK1BZNm4wc1RiTjRPR1pDUTNNV3ZwNmJsdTNCVDRt?=
 =?utf-8?B?blJGZ3paQ1p2ZW9CdlJ2ajdIcG1wU0VaaHMvQk5GM09WZTRKZjZrRktBdVVz?=
 =?utf-8?B?Q2dscGdNbEVYWG85RE45Um9kQUl0VFlTRTF4SkN2RUg2d3VsMTk5Y3gvbXRH?=
 =?utf-8?B?TjdwNGxUVUt2UmlQaFNlNWhBUVBRMU91ZG5SN0t4RW85RUVtS0tGdzZYUFpE?=
 =?utf-8?B?em5Xa1JrVzd4YXdjNHpTTGhySGwzLzFsK0UzaitPS2REa29zVFE2QTdVdm9a?=
 =?utf-8?B?Qm9vQXdoSHppb21jRFhiN3BQb1BTRDBYTVl2Z2h3cDBsQy91dE5EVUNGNDF1?=
 =?utf-8?B?WUpxRzBZdHZXUTA3OUZVK1gvSURZeWljbURKazh4VEMzKzAwUGoya0FYTHhP?=
 =?utf-8?B?QlEycG53eTdCditNdk9DVHpFblpFSm9xZTNDdGxHUWlCSDY5V2sydVZuZ2tJ?=
 =?utf-8?B?emtUQjB5eFc1UGVFaEQzUXIrY0pjUVhMRElDQnlyNlVqb0FWNUVpZ25qeVE0?=
 =?utf-8?B?clltbFFMcWxDUFd6cmdqdFk0THliVmU1R2pyWXVSY3V2U0dXWEhCSUVpSzcy?=
 =?utf-8?B?VFlYKzg3d1BzY29Ib2pDaXVTdStNY2N5YXltdHRrMDZiVUdBaHFUekp5NVFt?=
 =?utf-8?B?QlBwU1A4ZERMdG5sak5zOXlKc01yRmI1SXpiUTZGYUlGdkhUb2FucU83dExR?=
 =?utf-8?B?aHRNc0V0Zno2aVhoZm9BSGh2QkYwMElMSmVYYmg2MjJHT213bGlyM0NCMWhG?=
 =?utf-8?B?bEdtWUVZdXNNK1dpQkhpMmtxNHpmbVFCNFFPRVBVQTNtcU9IL0FpaUwyTGZQ?=
 =?utf-8?B?bXVKY1RrWW0waE5IRTlUaC94V1pNdktrTU82bDVQdlFyMFBYWm9VTzMwcHBK?=
 =?utf-8?B?WXkyMWl2cmw0WUpIZ3lKQVRNTnBaR3JBVFNRRnFQWWIzWnFwRHh6bVAydGVU?=
 =?utf-8?B?bGpaWGRBZ0pLSHlwZUM0ODhiVHlqb3VFWUpFeGhySENzY3BLYTFyN2l0L3Jr?=
 =?utf-8?B?QkdVd3pjbm9lRHpBbnhUbDdNa0M0Y3l2Z0R5SlFFYTlTZGxnYTZuY004bC9W?=
 =?utf-8?B?Z1hwSDNNYWtZTG9scEhuOXpnNTlUVGpRS3JIVGU5NjhJRFptb0JtQUYrMWln?=
 =?utf-8?B?WU5jWnkyVC8yQm4zK0xadmMybm1JRFJEcVEyMlRkSGMrZjhyRDhPQmZ3Yjg2?=
 =?utf-8?B?dDFTaVBXNWVYYjBseVdrK0NPNkQzZm5YU1ZEY01CT1BLdkwwbkhwME1JZDhB?=
 =?utf-8?B?bEhRR3VhUmU2VHpOMG5CRCs3WUlKaExNTHhnNzNuTHRxUy9ma2hVR21hVWRx?=
 =?utf-8?B?OGorbkNiMisydzZVRFgzbTVTS1hwMmJxNVo3aW5UaEpQWHhwODlRRVExVnFO?=
 =?utf-8?B?S29BZkFabmZVL3o0REFlUXV2eGI1YmRzYW8wRm12T3FqWERjWG5VTGQxSE5H?=
 =?utf-8?B?SUdTZ0Y0dHJNVlVqU2M3UFVVTStRNzdQNmNCVkR0VDBTMXdtdGRmOEVjbGJ2?=
 =?utf-8?B?aTJrVnFnYUd2UGJZVkUwdzlDTHcwQjJCaTRKQUFTTXVaZ0Z6eExrejNRajZw?=
 =?utf-8?B?SHBtaUlZdC80SXlkVTI1TlFvWC9ra3N2NW0zQlRpc2h1djZ6Wm9OS0dFMUd6?=
 =?utf-8?B?djU1QmM1c24wQitUZk96WWFkbGh5aEdNODJGa0ZSU0hZNWJIckFPUldRdlpt?=
 =?utf-8?B?d0ZWRjdZbnZuck5EeGFLa2FIVUlXNWcwYXlZRjhQbDZ3dXpNTWllNU5nS2RS?=
 =?utf-8?Q?g/7U5I/jtJioRDZxEIbMxaU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e557c7ad-db69-4c07-f08d-08d9c46893c6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 09:59:28.5866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8TBHTQ4Wgr5joZV79GWJn6eb80HsuEpT2SQf9DUatrzbQK9D1c/R4JhDfezRaWrG4tIO97ns5OxdyW3oeX06w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5598

There's no point producing a long chain of zeroes when the previously
calculated total value was zero. To guard against mistakenly skipping
non-zero individual fields, widen "sum" to "unsigned long long".

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/misc/xenperf.c
+++ b/tools/misc/xenperf.c
@@ -76,7 +76,7 @@ int main(int argc, char *argv[])
     DECLARE_HYPERCALL_BUFFER(xc_perfc_val_t, pcv);
     xc_perfc_val_t  *val;
     int num_desc, num_val;
-    unsigned int    sum, reset = 0, full = 0, pretty = 0;
+    unsigned int     reset = 0, full = 0, pretty = 0;
     char hypercall_name[36];
 
     if ( argc > 1 )
@@ -158,14 +158,15 @@ int main(int argc, char *argv[])
     val = pcv;
     for ( i = 0; i < num_desc; i++ )
     {
+        unsigned long long sum = 0;
+
         printf ("%-35s ", pcd[i].name);
         
-        sum = 0;
         for ( j = 0; j < pcd[i].nr_vals; j++ )
             sum += val[j];
-        printf ("T=%10u ", (unsigned int)sum);
+        printf("T=%10llu ", sum);
 
-        if ( full || (pcd[i].nr_vals <= 4) )
+        if ( sum && (full || (pcd[i].nr_vals <= 4)) )
         {
             if ( pretty && (strcmp(pcd[i].name, "hypercalls") == 0) )
             {


