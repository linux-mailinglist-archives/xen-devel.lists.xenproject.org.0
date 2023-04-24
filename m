Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4056EC82A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 10:57:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525239.816316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqrzs-0000z1-AZ; Mon, 24 Apr 2023 08:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525239.816316; Mon, 24 Apr 2023 08:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqrzs-0000xH-7Y; Mon, 24 Apr 2023 08:56:32 +0000
Received: by outflank-mailman (input) for mailman id 525239;
 Mon, 24 Apr 2023 08:56:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqrzq-0000xB-CD
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 08:56:30 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20614.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6f24a5a-e27d-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 10:56:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8388.eurprd04.prod.outlook.com (2603:10a6:20b:3f8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 08:56:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 08:56:17 +0000
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
X-Inumbo-ID: e6f24a5a-e27d-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BodDJAi6H/4HBIVBsXedY8Dbf64TBWRNwa5cdgcqdvbC2CbV4oySmpttPHjjAU8w84Szxj0QK5qwvregl/n8UxR3zu2wm+T7Ojp6lnuIbdi1ZxyWlK8sbWuNylrOtCOw9LVh78QdWChX03uRuXwTgsoo3GEZ6BDHGsdfpqJfYVuaaiRKxfFIZWY3V6+I4l9hemkxCBRaAtO3qrZOnZWJOPyOZtQY1mTnAtu/ykojARha+KZRnmNwwGkA4LwxJ5zFDqIqA9UEvMea5Y5Mf1KQt5uT2QDmaowI3YMl/XFanSoM8cuIoMRQzzPJXc0/vV0q8rU4yR+Zmtf6F6FfJ4K5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUR7VBKP8MkHieaWObt6DqrogvsLb6Z21kgjmVcVdF8=;
 b=NZjltycKdLMyJ/8paBcHrf9b7lVYapmNoRhCUThovlq5hdLyy4PJQvD+YhlSVvIe6Pkp6q3ZLzqgV2KzEF7kS+tFCnZC/B+Tg14iFprTVsubLqYmpmF8riCPvv+eiwYet3rMQhZs3Wnjl9ZHmyQoYFPKjG3m3Us6y79YYRXRhFP29C9pZb+BTT/CKMOuYbHZ/ehfzF0pe2SmoG29FlYYVX3It1OrwCPfp1itx0D2DtRvgDENDkwWl8+JXFTCHbjpMbvoOOk6skVFlEMx54Ku8n3nZPeDI69gPRbEu5CAOALvceUY3274ATlxOhGmEaC08JwbEOUelXviBVR22RHzBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUR7VBKP8MkHieaWObt6DqrogvsLb6Z21kgjmVcVdF8=;
 b=otIZxq+hmJmLyz1/ESRbc7R5hisgIA5kw0XtQhLDYfe+3TzeJC5xfFFpAbDD3m6FD/sxQXeZfFYtrlb29i0sr1w5s95MAibGa59mZlwwKgDuOTMdZ5GDqYP+aF7r3xgMVDMN/C8DIcFqquBw8Fqge/Re1fkTJ5dmKg3/iq2xOBDdNYG8DSKe+PdBuYQRfLXkcTbmrWlHOsCp83EWnNLwIXvx57O7tJv92XBQ+KTPdgju+hIXL5kyrOYAGNO2C58C6FlSByWJRNOuP7scaJqVdldlCTJnqVqF4bArjhh5/HVMOWvyLPuTIJjLrWkqAtkG2px6FVSlm2A7uEOvKgKXyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9df50e0a-c1fe-65cd-fc45-12ddb6e57c6b@suse.com>
Date: Mon, 24 Apr 2023 10:56:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] tools/xenstore: fix quota check in acc_fix_domains()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230328144327.6562-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230328144327.6562-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8388:EE_
X-MS-Office365-Filtering-Correlation-Id: 06dda0fb-f508-47a6-89b1-08db44a1c290
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qR0/TAbtcVGVVFr7HZQ0WLBMaNLDvnvb8FfnbOqs2Gep/Knajc4YtB3dQ2qvENMJLSaANMGkt8t0qnttEHZB5OHRu/2pO0X+1hq5P9pBZr48ylun4sYDf5YZ/w5MwVORny2rKjmvhBd+KPDGMhvtMcYQ+lEJe42jejW/RO65D1kLOeVmhagIZp63zr82iCP4H8ep8y9UjolO+hyYTpX9v91EPt14grqWGaVeyFVtyWlUsmv8WPKNZAi5RMY8/oc6CQ5HhqY2OUHlxDNdcagmY49lrLzW6fPeH007nPbe8a4ALBe6ar4pqXLoABjifnZ4jOsmYvNv7OQXJY6YFYarB/vutVdFtmQqv0Vg1YRKO3v05RnmeEKhIqPEbZE+s1s8+lgqDiq/eWKU2Bp8cvFuxZcudfkN9ltOaf4cAMsh1uNDkCNWmMCY/RE0sezwVB3LmgkDHtU156yd7BWxlca6sNBcMwvVIPfclpWuZkynoDmrvUCXE0ssslYve7ij5KS2usZjIJjGi4QLae9lHr756RWYWOOk6hXrAOO+yNFVI9wwGGeGij3CAXklRJyF/gzp0LRAQ85qVBj26p6RFuPmBsj3BepywjSUu1JsXxx4AE5c6ER06L42HY67pyICA6Kby9J7j6SOvC/OIfvdT5VMSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(478600001)(31696002)(110136005)(54906003)(86362001)(36756003)(186003)(53546011)(6486002)(26005)(6506007)(6512007)(4326008)(66476007)(66556008)(316002)(83380400001)(66946007)(2906002)(4744005)(38100700002)(15650500001)(41300700001)(8676002)(8936002)(31686004)(5660300002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2FkRzZ2dlR2V08raFVQMXBkZkt1d2IyZW1QZnJRZXp2aDRZR2JHYm1YdjFG?=
 =?utf-8?B?cFR0bU16Si9DVkpKZUwyWmNYNklWMDhTMitjWW9Jb2pVZTRIb3FJSHBLSVBX?=
 =?utf-8?B?SkNyaW52bHdFZmp3NTB2WldVMDhKeFJSMFR0K0w0RXdweUZMdVpNSTVJQXEy?=
 =?utf-8?B?WVB0SC9sVW5WRDIvNWJINHZ6YmJ6VmJ4Z3FlTmdUK1FCbVBHcHUvYXo5RGhu?=
 =?utf-8?B?TTJTWWZxV2xBWHY4RWVIazViSUFHMUY5azhaRGFtMFlDcEdLbm9xSUh3TEtq?=
 =?utf-8?B?cXRXaGlQdFlIRG5TZmxVM05ZbW9OVStJMzc4MFpPc2ZkMFNpQzJ4WloyNmxG?=
 =?utf-8?B?c09iVnd1QU9tWHM4eGRjYjNvd0gxNS81eGdhZmlWdm1FU0FnY2F4R0R1YnBM?=
 =?utf-8?B?bTBVZmlFMWxldHNCQ0ZqUTdpcnBJM1FtTU43ZmJCaGVDT0h3ZEsrNmNMZ0pp?=
 =?utf-8?B?bjVQa1g1eDVlYVpsS09zMU1Bd1JFT1pIMzVNeEJwc0F3Rjd2ZDZmQjFzQmhK?=
 =?utf-8?B?N2JJNXU1NGpQQXZEVlIrNElURFlCazJWU20wNENYQUgzWUJOSktHM3NrS1kw?=
 =?utf-8?B?NmpNY3ZJOTY5Y1JicUx1QWVHUFFxejBJSHVhMFYyTGhaZnhMcFUwQWJoL050?=
 =?utf-8?B?R2YwRDZuSFc3WC9Id1FYblE0akp2b0JSTzlzSjdONjRyRjdVaElhdldMRVFs?=
 =?utf-8?B?VVBVNVAxYjdsRENjeE0yVWgvUjhVNEkyeE5UMWNaelZUSTc4ZDg4NUtTQjdB?=
 =?utf-8?B?ZTRsZStQYk1VeDRtODBYL2l1dlhuY0NOUy9TYmF3dytldDNtUVljMDMzOXBK?=
 =?utf-8?B?QnV0dEZDV0p2OGxsMVJLMWlxbXJZeVZFclJob09Vb2F3aFo3NHphR0JHU0tv?=
 =?utf-8?B?WkNOYVNKMGpqbzdUMVRjVTVtQytFQkpVTzN2UStBM01Ld0gwQ2gyb2NWZ1Vn?=
 =?utf-8?B?ZUt5blpLMlFIU1I2aUFnUHNEVEgyNWxtVTV3MG5pdU5zQkNJdW1Yd1c5d0Rn?=
 =?utf-8?B?aVlSclhQa0gwT3RGZHYwaDV4YmFmZFdpY0IrTy9mRjVSNUlNdk5LblpzYmY5?=
 =?utf-8?B?QVF4bUpTRDNNWkZSd0RMQ2g3SmkwVHl3Y3U4OW9lallQL1lOV2U0dEl2MFA0?=
 =?utf-8?B?d2hXWG02Y0FXbVdlSEd2N1d2ZWpvS1MzZG9xTUJZRFNGenJqOWI0cUtGQ3VF?=
 =?utf-8?B?dlIvcTg5UHZwSW1JR0RXZzBTTCtaczg5MFNEL0Vwclk2NWVVUUtTc3Mrc1o0?=
 =?utf-8?B?Vmp6VVlxSkpwbXlMMlpkRmM2NGoyVVJCZkg3RVRkdEVzTUtycy9DQUlQN0dZ?=
 =?utf-8?B?YTVERC90Tk1wdlpScm1pWmw2eGw1QkNHaHM3S0Npcys1SmM1WFpjTkUvM0I1?=
 =?utf-8?B?OEw2WEZiM1FCY2NENHVqTXlQVWRTTGg5UytvSTlqK1lTRThXVTRqcy9XN0tO?=
 =?utf-8?B?TnhjUGliUzhqQk9Hb3VkQU4yVVFDYnozbkVkbXpOcXNWdzJOSjgxVlR2bXV5?=
 =?utf-8?B?NU5CWk4vdDdlUFZlcFhUZWxpd0JHUW1sNUVyOWQ0akQ5eXhnZHl5RjE1em42?=
 =?utf-8?B?WkVBQXU3RXd0djFKdWFDMXVnYjMwOUF1R3pRanFwVjVIeFhCZmw0blRDUll4?=
 =?utf-8?B?TXo4MEFOS21ad05wNjBPa1Jkeis4cStmQnFLdHRTTDFpczAvNHBITFRybVdm?=
 =?utf-8?B?TFFBdEFWMGw5Q3g3N0JOTVVtcEQ3WUtKVitUN1FkdWpPellMSXBzdkE2ejRl?=
 =?utf-8?B?d2M2K0xpY1N3eVN3eXhjQ0JtL3VxSC9ZOW9OMjBMbUtGNkJuQmlTL09Jb1pS?=
 =?utf-8?B?eUZBVmJ0S296L2hUNVZyckhZUTFFN0JtKzNkdmlKY2tHRWdyWC9saUMzaVYw?=
 =?utf-8?B?T04wMkp5M3M0Q08wMWg0VUZ1WTBidlF4RDByUVNFOE91T0dPL2xucDAxZ1Jy?=
 =?utf-8?B?Y0dzVThIVHc0LzJqT25YSXN6QlBKZ1czZUhrY280eUNyQ1pkbCt0OWtjdklH?=
 =?utf-8?B?SDVyMVZhSjFJMnFPaXJNZWJhQlR5S0hEK0gyZG1MTGJndVM2OGdXdlFOeGtq?=
 =?utf-8?B?R2lzdm1vaDAwa0NQSkM0TUhoM1g3SThOTlpZU2FvM0dCc25yTFZVMWxweUEy?=
 =?utf-8?Q?xuOnzUECmh8HWqsEKMoNXgEPq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06dda0fb-f508-47a6-89b1-08db44a1c290
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 08:56:15.0090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsWXiE66c9mlP0kvWAvk+7WRq/RzpoDmKuCmSnw2O2Lf+0TjGlQN6PQCVJnX7bKQQYOyAyxnBv+ner8lK/hjgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8388

On 28.03.2023 16:43, Juergen Gross wrote:
> Today when finalizing a transaction the number of node quota is checked
> to not being exceeded after the transaction. This check is always done,
> even if the transaction is being performed by a privileged connection,
> or if there were no nodes created in the transaction.
> 
> Correct that by checking quota only if:
> - the transaction is being performed by an unprivileged guest, and
> - at least one node was created in the transaction
> 
> Reported-by: Julien Grall <julien@xen.org>
> Fixes: f2bebf72c4d5 ("xenstore: rework of transaction handling")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Considering the referenced commit is about 6 years old, I thought this
would be a backporting candidate. The function mentioned in the title
doesn't appear to exist on 4.17, though. Therefore, if there is an
intention for this to be backported, may I please ask that a suitable
backport be provided?

Thanks, Jan


