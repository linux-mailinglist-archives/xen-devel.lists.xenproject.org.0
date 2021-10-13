Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3E942C015
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 14:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208369.364464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madRO-0000gT-Pj; Wed, 13 Oct 2021 12:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208369.364464; Wed, 13 Oct 2021 12:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madRO-0000dv-ME; Wed, 13 Oct 2021 12:33:02 +0000
Received: by outflank-mailman (input) for mailman id 208369;
 Wed, 13 Oct 2021 12:33:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1madRM-0000dn-Rb
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:33:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 800a22cd-6d00-460f-9155-fb58a41ee96d;
 Wed, 13 Oct 2021 12:32:59 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-XAW3I7VUPbmS-9rt4rVLdA-1; Wed, 13 Oct 2021 14:32:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3119.eurprd04.prod.outlook.com (2603:10a6:802:10::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 13 Oct
 2021 12:32:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Wed, 13 Oct 2021
 12:32:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.4 via Frontend Transport; Wed, 13 Oct 2021 12:32:56 +0000
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
X-Inumbo-ID: 800a22cd-6d00-460f-9155-fb58a41ee96d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634128378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6LcfsVzGfqweLmR9KasgBs8D6g6eEOMQesVKB7VTk9o=;
	b=DpaXAO8RSrf5UkcpbiSygcdb6NBGv6FvDT2ZCd+o00Ax2lacvBSedh7JEQPYCCt5oYHviH
	Or+F+DCccM9xxUk3xki45qOIvPbhKfG7OAR3M5utE/zpS2qNtXqKkTJaDgrCh6ylNz71Gj
	w5j/VNmiSYY6U6cLGKyZfPTbM6IxHyU=
X-MC-Unique: XAW3I7VUPbmS-9rt4rVLdA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZOgNkKz9GLZnsTqwQt5wBXwsYgvLgaS5VEGHPpm0Xg0ZYCdBNvSrTEWs2CEOELTJIxxjn6tIQvNDcugpTLP6ldqnTm/+R4A5ONxDuICbhT/rYItxXGRVIkkSd5QSapfHxxMk69YUbZF3fEXdLOlGlh0Bz7Pr6fzK/Ntgpk2UclNJtGCYgTHAlMP5ema7pNo8YmXGTv0PwcSRNIMKQJ67L20KZwVuqUq0B35uQUTlLk4jK7emm85a7y2c7VfbJIpdEz/X8K2YvHbwTQAzAulrXhYOFXGd4GfGK3jmR5x2wvfYn9hbaogFWwVTo3Vu+UkUbVJuAgv9qIHuOyG5ZaX1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LcfsVzGfqweLmR9KasgBs8D6g6eEOMQesVKB7VTk9o=;
 b=GG2WCIied82y6nZPh1CRurNn9Q5eYNF0OSbTjPzTzON5Dtb9tZxo9JBTuzmncBDpbn4rn6GUzTpK/cFA3QtOqCkDRPcFGszfXaGTgVDv6MtaD8z83EOhNw1oaYpnpiG/waJ9Eh/XC4vWAvVLKSG5YvXVsZqtKKrr4e7isw6gyApyDjYHc399jh0cPxhRchqaDHc54FG3n675U1cuzwv3S0NRLYKmKEMmCBsdAZN4LCrfALMSz5itGJqdS12QFFQdL7IVNA0/E4yMcnVXxSo55758u9mj3NBPeJfVxF89/oUciZUtOXbzZBIPKMKvOMt0+LDC8G5HT3c3ZYJPGEzgrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 22/51] build: clean common temporary files from
 root makefile
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-23-anthony.perard@citrix.com>
 <dd760c79-e761-3547-726a-4d7ee092d10f@suse.com> <YWa2neA0zQSvkqn2@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <16d19699-8ebb-9352-dff5-83147aee9ffc@suse.com>
Date: Wed, 13 Oct 2021 14:32:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YWa2neA0zQSvkqn2@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a65caf90-c3e2-467a-6375-08d98e4595e1
X-MS-TrafficTypeDiagnostic: VI1PR04MB3119:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3119D872CC0C4448EF517FA2B3B79@VI1PR04MB3119.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i2nYws1oUdkPu3fYTZTeQn+IzRLj3VmLl6Zta1OrGSG3YGfVpUaseeIchNJPh0gOg2262Jyk22K+HGAsYq37kGjGzttj1CznWpe7+WEGyCQe0VYq/JojBuCpyhYKqYHR/Cg+W3UXVNkIqcq374R/fVw+Bp+q84BCwmqsIsHceQmm+gqz1iioRvvDMsgTHiZYUywIRpVgTPB6A0FJ90cWotRfXeJJ11yLgDWUO1WE8qac9m3rsOQpaex7PYP0knQxoMZsqhPwmvxUjVvK97/YKhxATmYMKncO2WZc5VCY8nh66sd5WYcibnYwP6aV1X8Z4WKdAkgMq0wHV96iLzfsP0Dc/GqLW3BTwkps6ZwENKvcXS1GaJTrwUauf008p6zO3r2fVIeOyu0PPu6Gvo3r/5ZyUkIPGsaP2rdggLbq5Wg7sPnRGX+wFItApTgBkWjQmf4RjD96HUfcU38WC4/GuchR7gTv3rvgeeemh2OuSz2NMcLOMWUsSaYZZM3rskTm2cCHX8XjwtFsZ8ykCul+Nu30WOO6/FLxo7GGXj0wALE0BGa2BASAlO1EE1r0jR34ZF1+51IZJeukNOII8EAGYemyDyLuYN1IvUHycZ++7V1frhdibVt20TK52hXQT3oJ//votoLVM9KMZHMJaQeK6D9jq0vR0NYoF3rgLyXQ3jlGKa6mow1TzE9nIutDwaprcvCVz8fk6kQq03wF9+PN155LRl6TXLDKybjUDrE3YgI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(83380400001)(38100700002)(86362001)(6486002)(316002)(8936002)(54906003)(16576012)(31686004)(66476007)(6916009)(36756003)(4326008)(2906002)(5660300002)(508600001)(66556008)(26005)(66946007)(8676002)(53546011)(2616005)(186003)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFZwSkV6ZGx1Y29nN0RYWHhPS0V4SEcxM1NCV0lMNGtWbTVnTnJEdVQ2TXdY?=
 =?utf-8?B?WExVMmIxUjd6b1c0V3Y1NlRXU2x4WTFjUllxcGh3VTZnZmkzS2s4YmIvNGhR?=
 =?utf-8?B?M3B0V2tORG1HR3ZtYVM5TUs5cGlCeXNQSk5veEl3Wm13Y05wOFhvb0I0Mno1?=
 =?utf-8?B?YVg2K3VsOU9teGczR3NSYXVaOGc1enBDaC9qcG53RUZTUlFaazRtNXJkWE52?=
 =?utf-8?B?L2gwR0hFWXJNWmM5cU10SXgrbWRRQzM2QWM4RW9Oamc2MU5hUnVyRTFKQVRH?=
 =?utf-8?B?Wm9zeGxqL2M1aU0zVVJLWjJObno1N25wbGJKeDAzdE9QOG5UZ2FHcFpPSENE?=
 =?utf-8?B?YWVHaDRIbFN5Y0V5WVFmYUR6QWo2ZGJPUHJjKzB5TlE1NHZxdUhQaUk1ZmJx?=
 =?utf-8?B?ckw2ZVVPL0lJUkNJSHVPT2s5TEdCRzlkbG9ZTjh1S2lNd244RzNmek55cGVQ?=
 =?utf-8?B?eDdYeTFYWU92RzB6N3cyZmhXTXRtblVvVzM0eUhzS2Z1STZVOWlQTkxDZXdB?=
 =?utf-8?B?R2JvU3BBbjUwNUlTRUgyTXdOYWZWZU9nMG14aUtpOWRDUTRaOFgzWm44a25n?=
 =?utf-8?B?ai94Wko5d2FPRmxHY2lHdzVjWTFicnJmT0Vsbk1HMGNKK0FVNFRGSWZwV1A2?=
 =?utf-8?B?TW5qUmNGaFFTTk5uL2dja3dzQm1EV1oyb3EvV0loeDJqd2ZrUzFBOXhiOTZS?=
 =?utf-8?B?am1rM1hBYWFSbFowaWRObnRaOGwvYVJld2lMTHM2dnlTU21iU1NPcEFxWVRk?=
 =?utf-8?B?c2tyeGJiU1paVlU3cXJHN0tqRmlSV05kemxqaTB4SllMWVR2bmYzNXdiU3lT?=
 =?utf-8?B?S3d1UmlHMFZ5SG5yVVZVN093RmRXbXVPR2ZsQzI2Tk5Sak1VOFZrLzFRZlNB?=
 =?utf-8?B?OCttcVphdWdPVkg3VENqdXVyZ1pidWZoMVpEQVZNNzUvM1hxTXU0Zms3bVNx?=
 =?utf-8?B?NUR2d21hQ0M4MWJmR1BOckxIbGJzRGpBTlB0S0VMUDBIR214YUFqQzlNYmIv?=
 =?utf-8?B?REZ5OHp4SStTYVFiQUlMenBuWjQyNkFEVy9mOUxYdEhOZTJjQzhxVnJwMDlB?=
 =?utf-8?B?aWk0bzhGUDVEa29MeVhURktWazFWVFhheHVUTTlMYlg0d2dmaHpzSjIyUWs5?=
 =?utf-8?B?SnVjcEJlNlRiUWoyT3lEWHVSSldOSVFPQ0pYcEIwYytoL1RrZmg5MmpPclNp?=
 =?utf-8?B?S1NIZ2V6UitHekJTMGsyWXE4WWt6aG9zRStDSjVRK0VMK2FHT1ZvV3owd3VS?=
 =?utf-8?B?L0NJSzVaVmRHQlhiSndCdE1PZjlVWGlubnFHTXlCZWRpcWc1cFBLVmZIVk13?=
 =?utf-8?B?Vmg0L3JqV3pjQkVkREdxY0VaaXRJQkt0cVIwQ3F5NGVlNHdxdXhCOHljcm1v?=
 =?utf-8?B?UllUSUluUlh1WDB0RSs2OWRHQk5YVkFEY01tYy9MOXo0RWpRY1kxNlprR3B1?=
 =?utf-8?B?K0MzY2svcnluM2NoY0taSnVoVk9ZL1J3RWJyK0tHU1NrMERoQVBtQUNJR0py?=
 =?utf-8?B?Ulo3T01UQVpNMEcybkJkWFlyMHkrc0lTL3FBN3oyRzJ3aHdDMFFaMlhHaDJM?=
 =?utf-8?B?cHhNYlQrNFFLbFhEeWMzMEM5b1hnK1FFVjNobkxhKzVRbWNGUGVaUjlSRUlG?=
 =?utf-8?B?Wk9yTndKVG1sdmx4cUlEUU5MajBYMTFVZUg0L24va2Y5TUdRSFVsUkxGQ2JL?=
 =?utf-8?B?ZFowKzNGd3pKWWNpbGNZUEVpZVdwRTZqdmtibld0WVh6c1grOGIrajE2RWt0?=
 =?utf-8?Q?7dpqhbJiAN4c1UvfTViz2VQEPUG5gpyhfrpP6a8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a65caf90-c3e2-467a-6375-08d98e4595e1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 12:32:56.9448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzJ8EiltrmFwKwEj4yB9ZF7idcHxPcHJ43LthJZzjq5nj60vldIXX7lGjMbnafh3MG+gfH3Kjut/mHkWwIOOlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3119

On 13.10.2021 12:36, Anthony PERARD wrote:
> On Mon, Oct 11, 2021 at 01:41:16PM +0200, Jan Beulich wrote:
>> On 24.08.2021 12:50, Anthony PERARD wrote:
>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>
>> Trying to synthesize a description:
>>
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -382,6 +382,7 @@ _clean:
>>>  	$(MAKE) $(clean) test
>>>  	$(MAKE) $(kconfig) clean
>>>  	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
>>
>> This was effectively redundant with ...
>>
>>> +		-o -name ".*.o.tmp" -o -name "*~" -o -name "core" \
>>>  		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
>>>  	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
>>>  	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
>>> diff --git a/xen/scripts/Makefile.clean b/xen/scripts/Makefile.clean
>>> index 027c200c0efc..b6df9e861e6e 100644
>>> --- a/xen/scripts/Makefile.clean
>>> +++ b/xen/scripts/Makefile.clean
>>> @@ -14,10 +14,8 @@ include Makefile
>>>  subdir-all := $(subdir-y) $(subdir-n) $(subdir-) \
>>>                $(patsubst %/,%, $(filter %/, $(obj-y) $(obj-n) $(obj-)))
>>>  
>>> -DEPS_RM = $(DEPS) $(DEPS_INCLUDE)
>>
>> ... this and its use below.
>>
>>>  .PHONY: clean
>>>  clean:: $(subdir-all)
>>> -	rm -f *.o .*.o.tmp *~ core $(DEPS_RM)
>>
>> With the command gone, I think the :: should also be converted (back) to
>> just : then. Then
> 
> "clean" has been a double-column rule for a long time. If we convert
> this rule to a single-column we need to convert all "clean" target to
> use single-column which would make this patch more complicated. So I
> don't think we should make this change.

Hmm, indeed make would complain in that case (I didn't mean to suggest
to convert all clean-s to single-colon rules, but I was instead under
the wrong impression that spelling out merely dependencies would be
okay with single-colon rule). But then make's doc also says "Each
double-colon rule should specify a recipe; if it does not, an implicit
rule will be used if one applies." So perhaps, to avoid depending on
the latter, an empty recipe should be added here (by adding a
semicolon)?

>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> Assuming the patch is independent of the earlier still uncommitted ones
>> (please confirm), I'd be happy to make the adjustment while committing
>> - as long as you agree, of course.
> 
> The patch is independent of earlier one, although the context is changed
> in one patch so wouldn't apply cleaning without git helps.
> (context is changed in "xen: move include/asm-* to arch/*/include/asm")

That would be easy enough to adjust, I guess. But first we need to settle
on the above.

Jan


