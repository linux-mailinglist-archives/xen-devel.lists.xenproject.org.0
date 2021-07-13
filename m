Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4983C6BBA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 09:52:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155084.286425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3DCm-000467-Pv; Tue, 13 Jul 2021 07:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155084.286425; Tue, 13 Jul 2021 07:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3DCm-00043M-Mj; Tue, 13 Jul 2021 07:51:48 +0000
Received: by outflank-mailman (input) for mailman id 155084;
 Tue, 13 Jul 2021 07:51:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3DCl-00043G-H4
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 07:51:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b6f9b98-74b9-4a7f-9c33-e33c2d989672;
 Tue, 13 Jul 2021 07:51:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6-vdIhfjQLN7qw195KT_2y0A-1; Tue, 13 Jul 2021 09:51:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 13 Jul
 2021 07:51:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 07:51:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0237.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 07:51:42 +0000
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
X-Inumbo-ID: 8b6f9b98-74b9-4a7f-9c33-e33c2d989672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626162705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tJDyZWNz9UB8xi3a2Tl57QvZ9V91tU1yw0GrhIYiE1w=;
	b=TEqZ78uN7sLesw30bQqtXTZ1u6UVGQDEXgKxBU7j8uUqWVx8G1niWdviqCf1Ops8ynR5su
	zZPB9vNZopECJxSw18buDr+/JZDdneNmg7cYVGTLeYOb1iCl+zqolRT1eNcPZK+nVsOFBh
	xoPQGRJ40ieMLM9p71WdiKDYQ09Ttnc=
X-MC-Unique: vdIhfjQLN7qw195KT_2y0A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBDKsfmjgTcAw+LUqmFVsLtVLgoSxydYf/L3Im/UGZUQfS23hLHX8dTXQW8Rvzrk5iMQ/5GV19qL16ecz3k3QNJd7Zcg+0COHvIvD09jI1p78YuYSELdXPE1gQVnXE1k3nbw4dpuL4R71H9Ll1Ox68DJow/MEQ0o1nnCqGUd9AVvjAbckaOoeJ0ipcgP6XOQGtzGhlyQbo0xUCVeLZ9IhX1Qb3QCfQqazkxX05DrNApOCwljsQT8Q6RlEePy2lI2wcMdIVWL1SIk9PDN/3uchUH9HIF9x/080jYgUBosclhzDVQuNFpvay1009llcrpOBgIPvxE67CcWN+iEq9K+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJDyZWNz9UB8xi3a2Tl57QvZ9V91tU1yw0GrhIYiE1w=;
 b=IUbfzThG1rPG9QVlZT8oymtTKyEbiCc0+NshtnPVUsx6kXNDXYhjtXsjk6HOFhcyyxQ55auWZZ5/dwvbjeOhh0u7JR57eQBUh00By2xKeBWfaW57k88GsQDMW9VWK12xaYeA9WZukBV6/+a58LskcXJcJApfRwKdGblh3AvSFomxp0HU0T8AcJSrDzsDkpGmgcUTUCl1A8EEtMHaA3aFr8vpbvG992NVjXOZyEEzxFq9nCrexHsGcgDZAqqI4xOYyMKd/J27y5t2Ovk5HKxsdI47/n2TWTNfEJJ357UbGlu2pxH4veBOU8JPtpa1spi5EOV37t9cwXUOmdnfisk3LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 17/31] build: convert binfile use to if_changed
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-18-anthony.perard@citrix.com>
 <dbb33a01-d54b-d4f3-caf3-5e5544d52095@suse.com> <YOxurzTEAfW3I8yU@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ddc38760-c042-febb-822f-560a4b613e91@suse.com>
Date: Tue, 13 Jul 2021 09:51:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YOxurzTEAfW3I8yU@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0237.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ab602b7-01d5-405f-c310-08d945d30e44
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4191D9F2C63290F4C4CA3721B3149@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SzxMXGjWgU+fRX+ErO8Oq4F3lQ+YnpknQVL5amqSkIgY/Tz+nJYq0uqXDJlXfHIWdphqBSwB/Ri/nymWUh+Ytq9Cil1Ew+86pgU+G0ASu/+0VddnOjlbCiJjiqdy3w/YUM4lTGK9LQtglcEfobQh+gID62G/mTWIhvU9zuc+N5F4pGcQb1uweGoujMsBEok3mVpHs9WaD3cGQ7KyohFmXoFTTZliSGv/Y95uK453Ae3wAQrJb5I2hj6ZjzpHvJQL4STAxnKtYO8TiBayHRHSAx+4ooT/2gR5AvZSqMTlLq+Fulfz93XbaDFYb9q2fRmvNhdSt0GTsUhO9gz25rSh+hefPzCL/pS2he/pPCFLaWII7pAJLhjfb+FW+53CMgtADNWhzNU+Xk6Rk+mGYloMyInSnM11TC8qBYQ4QRd7PynZxB35arPmORPcabphlBgBJqgZ5zM9IlzU3wfvKnPf3lj2nbGKUy2249/TYfqe55DvI3vN1NE+e28BAEnLeAbNJekWUt5YoGN1ETEk7yyisiLLBS52EIrSumpi14mVBDMRsEMm1tgoUmA3qmAwviUH9ruHA/hNjGtv5GPTNaqTqYQTXiFBYrU3S7sEfRDwDKBHCNuA/TD01luvGDKHe9JNZw2BMDq4jMVXLVxNTzIVv0EpNu3O0hDFs9GkKNvnnrZfkLUHm2fxQoFm0g/6q4NVadHEFJxpW5Pu3Uq40ma5w2PZwHvdTZqu8CWt2i09moU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(136003)(346002)(39850400004)(8676002)(54906003)(186003)(6916009)(38100700002)(66556008)(6486002)(956004)(2616005)(478600001)(66476007)(316002)(4326008)(31686004)(26005)(66946007)(16576012)(31696002)(7416002)(8936002)(36756003)(2906002)(86362001)(5660300002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NExqR091azg1RVQ5K1NhRDhLY1c5WVZieE5ocnJ6NVFhL1ZyT3BhMDA3NzVQ?=
 =?utf-8?B?STZINFhkY0xPY00rajlJNElLaTA2R2RkNDIybkMxRExZN2I4OUhVSitCNkQz?=
 =?utf-8?B?LzN4MkltbXBDK0dvSkluSlhqancvb1dlNEt6bkVMMkM2K1Roei9lMG5GakVn?=
 =?utf-8?B?NUdjbk0rNWIyOXd3c29KS1BhM2ltVUdTckpHdjV4TGRHbW1ybURnNmRyTVBO?=
 =?utf-8?B?amt6OXU4c3lHaGlrZFpNY0M4LzA4Vi9IL2djc2J6R21iWlc5ZkFKSjArL0Z2?=
 =?utf-8?B?YjVRVTlGWHc4Q3ZOQ3VRVitnQ0NOSGdyNjl0ejcxTWxCTXFjVDZjcnZSazhO?=
 =?utf-8?B?eUxYc3BSOWlPeDVBbEJYNFhEL1h4elBwWWdVRW55enZiUFY3OW9HWm9heGNs?=
 =?utf-8?B?cmtya1k1TEw1VHV6S2NLNGdVcVpxZDlzOVljUTZIUVBoVUM2T1Z1K1E0UHpE?=
 =?utf-8?B?L25CdXFLNnp2TXZ4VDAxZndlOFRja0hrMEhaaGVTMEhGUU56OGZCUWdUUSsx?=
 =?utf-8?B?NStHazRPRlhlL3hJYTlvK2ZNOHFPUjJVRXExZmlTR05VZE5NTklPdkVkVHJY?=
 =?utf-8?B?L3BiQ3A5cWdTbkhiMmlkWVVGQS83U0t0VU9lOWNsYzZVVDFUS2NpUTFaZkNO?=
 =?utf-8?B?MllBVElSMEJMZk1VcFd5QzJPc1RKUHhRUFg2VW1GeVdDVElIYWxQelloa05C?=
 =?utf-8?B?elNRWWFqS0Vrdis3UlpTSDdLdFZzemxRMWpSK1BrazZNZVhXRUVpeTl0eDlY?=
 =?utf-8?B?eGRWcXpCak9aSjNsSUlHc21QdG1HZkpDd3l5NGZ1YjFmQ1ZTamhHVzBNSGVZ?=
 =?utf-8?B?bWh0QjN4M0JNcGgzWW9DZExsWURjM0RBeS9aSHA0dHBDVEtnTmV2ZWZwdDhk?=
 =?utf-8?B?QjBmTEVBNllicXFmMnQwWFN2dGZhUjN1TmQ5dlFUWG5UemJ4czRjL3JMNEhC?=
 =?utf-8?B?QkhQekdXUmk5STg0aGZJdFRmWERqNXorSTNWblZaWFJKME1QVlZpbU1rMXVa?=
 =?utf-8?B?MHRVOFI2STFzT1VQa3RMaUZzbERiTzlLTitpdlNkUmNNc1k1VUE3NSt6SXA4?=
 =?utf-8?B?MzIvYnNjTnF3SWI5d1FWanJLVDA3N2Zjdi9FbW5IQmJGUkRUdzNUVTN4V2pR?=
 =?utf-8?B?bS9GMERENkNmSlhkanh6YVdqbnVYSHNzaDRianRJRmpwMnpWOURhVE9GNi8v?=
 =?utf-8?B?dzhDL0gwV0FkTHd4bTV0Ly8vemlETkJZTmluOEtRcFV4VnFELytveE9raVhj?=
 =?utf-8?B?aFhMa3IwRTlSWDZranExZnl3RER0d0JKcjE0T0ZsZ3A1a2M4OXRoOUVDd3pV?=
 =?utf-8?B?U2pmTUd6NFJ2eGpVSWpybm85Vy96N1k1dHljdnI0bEJ3emRSUHRseWI2Si9L?=
 =?utf-8?B?Rm9sL1ZpbUYzYWNwbGlCLzVtVzEwL0R1M3VCbWRDUE1MMnFxTmZ3QW1nNytr?=
 =?utf-8?B?Ym01S0xmQVJOWnhTc3R1eFRSaTIzVUtlTTJBdFR2SEU3NUJybDRObUJvVXFk?=
 =?utf-8?B?QThHU0IxbEptbHpUdWRnOTg5YXZkYXdCTDB0SElHTVlvTldtU0I3cHA4VVhN?=
 =?utf-8?B?RTVnYWxNYktlb1AvTTF6OXdESm9ZbmtDaWFFeUMxUTN0YzZsQTJvVnFsV1Jk?=
 =?utf-8?B?MUk4Qk82SzNFcnJmaTl5ayt2TllTYXEzVG9YYUdCblNROEFGekx4ZWhoakkx?=
 =?utf-8?B?VkVXWE9xMDBzNm9iVWVidTh4Ykk5bXQ3RExxME9wbnQ5ZllmbXQ0N0JpUG0r?=
 =?utf-8?Q?23Jr7ioXuiMBbwKZvouz8bffEr57ebjBSAi6hCT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab602b7-01d5-405f-c310-08d945d30e44
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 07:51:43.0348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVKPNd2dWU2AU2dOHUUVtN90Oc3OooYpjchuu9vrTP+JTD6vJRGM3pv+5fbG4gDaYl2ockJ1llCEklkeaUPGoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

On 12.07.2021 18:32, Anthony PERARD wrote:
> On Wed, Jul 07, 2021 at 05:48:57PM +0200, Jan Beulich wrote:
>> On 01.07.2021 16:09, Anthony PERARD wrote:
>>> --- a/xen/common/Makefile
>>> +++ b/xen/common/Makefile
>>> @@ -80,8 +80,12 @@ config.gz: $(CONF_FILE)
>>>  
>>>  config_data.o: config.gz
>>>  
>>> -config_data.S: $(BASEDIR)/tools/binfile
>>> -	$(SHELL) $(BASEDIR)/tools/binfile $@ config.gz xen_config_data
>>> +quiet_cmd_binfile = BINFILE $@
>>> +cmd_binfile = $(SHELL) $< $@ config.gz xen_config_data
>>
>> This is an abuse of $< which I consider overly confusing:
>> $(BASEDIR)/tools/binfile is not the input file to the rule. Instead
>> the script generates an assembly file "out of thin air", with not
>> input files at all. The rule and ...
>>
>>> +config_data.S: $(BASEDIR)/tools/binfile FORCE
>>
>> ... dependency shouldn't give a different impression. What would
>> be nice (without having checked how difficult this might be) would
>> be if quiet_cmd_binfile and cmd_binfile could move to xen/Rules.mk
>> and merely be used from here (and the other location, where the
>> same concern obviously applies).
> 
> I've though of having cmd_binfile in Rules.mk, but it's made more
> complicated by having a "-i" flag used in flask/.
> 
> So one things I've writen was:
> 
> config_data.S: $(BASEDIR)/tools/binfile FORCE
>        $(call if_changed,binfile,,config.gz xen_config_data)
> flask-policy.S: $(BASEDIR)/tools/binfile FORCE
>        $(call if_changed,binfile,-i,policy.bin xsm_flask_init_policy)
> 
> with:
> cmd_binfile = $(SHELL) $(BASEDIR)/tools/binfile $(2) $@ $(3)
> 
> I thought this would be confusing, so I avoid it.

Indeed that's why I did write "without having checked how difficult
this might be", because I definitely didn't want to suggest such
anomalies to get introduced. It's unhelpful that options have to
come first.

> But maybe with the lists of flags at the end, it would be better:
>    $(call if_changed,binfile,policy.bin xsm_flask_init_policy,-i)

Yes, this is a little better imo, but still not pretty.

> Still want to move cmd_binfile to Rules.mk?

I'd still like it to be moved, but without resulting in a rule
that's not consistent with others. Maybe we should have a
BINFILE_FLAGS variable (paralleling e.g. CFLAGS)?

Jan


