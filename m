Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C63C5B563C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 10:31:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405551.647992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXeqW-0004uq-Ii; Mon, 12 Sep 2022 08:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405551.647992; Mon, 12 Sep 2022 08:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXeqW-0004sG-Fm; Mon, 12 Sep 2022 08:31:12 +0000
Received: by outflank-mailman (input) for mailman id 405551;
 Mon, 12 Sep 2022 08:31:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oXeqV-0004sA-3R
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 08:31:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60062.outbound.protection.outlook.com [40.107.6.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e507dc8-3275-11ed-a31c-8f8a9ae3403f;
 Mon, 12 Sep 2022 10:31:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9519.eurprd04.prod.outlook.com (2603:10a6:102:22e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 08:31:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 08:31:02 +0000
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
X-Inumbo-ID: 3e507dc8-3275-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npJiBJ/3+aBXlTRTixIZWA4Zm7KWxVtaP+u6t/4PbUOZOx+jZDumvvPsRI8QlZySMux3bVWksFviHg7hL/dNd4sZ7zJvnVCwRF/8Kap+je6u9iTUIZO5b6pllD8pQOqnLTOn/uMillOiGrsES0rFwg6/6iiS/hohRVnU4YtO8Rs4xKkNATuviPGPt3Mwvn2Qd8Jm6OmPoixPGqFqJrACmWuOdF5sLvueJJwR4Mx+142j1ieBbu483LXLBI2Xgzn4MR7tc11AxLlyC032gkrNA+eK6uHGgxkgJEQ8gJTC6cYB9S/a7wEAU+R54PAR1h9OB3s7GAof9KihtRvbJ8S/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arH8Ge7kYe2WbuEILHqOcMnSCpztvLBnDXsQR8cI+KY=;
 b=MdXUIzn05GLwpqM09RyqAHYpREWEV87dz9X3mSFxnp8TxrvOGrfJVz2AIxyqzFk8ee0H32Ac+hZhsScUIO7/N5KFCnr+Uv45Yi94JEW6XN8PyXoR7TRWUS67uehIKC4c/RH0u1O1lv6JV08MOM92hEYcrOk/8H9KIMzPVQAZ0azFDdP1RTF/ybPjJgP9qzcp4p1H6c/c26YJgI+LZO4SsPkYSSruEzLPMqDDiyZ0ZfODEG6LDokMzeyx+z0d5fzZG3fDMHGe7Ja3vQprQM1s27Jb4VrpNT544NCTwTNYTNbcr8Q3VZYrn7XQNR1UbC7TM3vZhzAu92N75+JEbJ3S/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arH8Ge7kYe2WbuEILHqOcMnSCpztvLBnDXsQR8cI+KY=;
 b=TzH6n4gIjvlB9KRabOQ7FfIz4hWS9/D2BsRUY50Vj5NvzANnuqI5uaY6KQC/6VySGXn5etp/u1aVkMBQAvaBe9CeyPhuyy5fmluSZw2+sWlV52ftlkdn2Jc+aqW1QayVeSfSYffxF+n2fHFjBMww8aaMZZYmKmzrJeC60M+MQWAT9NUy/Nxs9RMyA5DAMPfBVIJOOBDTE19jdzteSXSVC8Y1LRa26ijOtDfoOG8xBzkA6zITfxcoAdbZqXrIHSSGm3AUgrxGQVrqrXUPzG/qEifz2E7v6iBVjQ83X5XkFD8iIf3K+ea3TlzIAvFES2B9JAnzXWI3MXr48wUlyep7lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e65cc75e-28fa-906c-c7c1-982d7e573b00@suse.com>
Date: Mon, 12 Sep 2022 10:31:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] xen: add domid_to_domain() helper
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220912055356.24064-1-jgross@suse.com>
 <20220912055356.24064-2-jgross@suse.com>
 <f1f2b4a1-c8d5-a481-1075-0227877dda8a@suse.com>
 <28e13b17-1296-62e4-0dc5-867b58f40ba9@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <28e13b17-1296-62e4-0dc5-867b58f40ba9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9519:EE_
X-MS-Office365-Filtering-Correlation-Id: 98af0ce5-ed21-4913-3b33-08da949920c9
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	THzsXKt/8HLkWMtKJ1cUKaavO9nSH07wPqityssk4TKcruDhttQQbpjUCR9u47swZxsCPCs/77aSYbOt3/Va+AmxrYRvpi3oMF58H/3Ou5/6M286rAe7Qys6i9NI2PQdG81c9M/N3C6NlVcu8UKqoex+KS9cjLhJ+vmj8EOVgLPrEEl9U97XaemJx6AFE/H731qWiz5lPf4vNaNbWeq31+fPyz/NYNavvp4aXNFn2xnNymfvrazhBocA9Hal19R888QKmsuV778gQVaTDf+Hq2Ur0dlXaAplqpdZQjmXUaV6nE9G5+SJj72GFJ02HjAZbEOKIjIQR4lAnTP9fYFtonJPnJ7dZpamqiHV2dlbBaa1LRS2Mv/ieqTWLSb7EWSmWLD4m09IkZaSExKw5io61Q3H6GZbffSFda0xQ2QUcMGFooNAwZdC0isdTTkGWudkGHYGD3+H1bHEmUu5KO7oovg+yRtQ7ugRuXoHIohQH5gQvsrz7MtHUaIO+0h3AU2Fsz6C36tCNHjdel4o8MKeQ6SySQCLJhHm01S1lrjp7JEBrXotNC2wYjDSly62DUBVm8U9Ckdjd0IqhK3DOaT9fAV6aBJT9rNoBj4HpRUMwy490ofXMH2MsZQzXbKtgULQ9Br2i6s5YvfYxE7kSumkivrvfZpxY1I4dk+VuMcEEETDxBpVPTm0drYPZ+msKCqsJD+WGe7e0ymhqwS8m7GD3d3wRxwHiG5a1DXV7atK4TpUY0Oi9JDNBj9QTi7FIIrZmUyp3T/eOpfixfN0CmAQqb4aZqmqtRkSP5v6zvURLfg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(376002)(136003)(346002)(396003)(66556008)(31686004)(37006003)(6636002)(54906003)(36756003)(316002)(478600001)(6486002)(66946007)(31696002)(6512007)(53546011)(26005)(2906002)(8676002)(4326008)(6506007)(86362001)(66476007)(5660300002)(38100700002)(8936002)(6862004)(41300700001)(2616005)(186003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3pzcEIzOGtIWDJuOVpON0k3Y29KR040aUpqVmZHR1Qwd2xyck93Q1JsaktI?=
 =?utf-8?B?TUhwdDIvLzR5T1pvRG1CaUp5MGxVSWQwcGN4b1QzZWo2M2U2eHd4cE0wRG1x?=
 =?utf-8?B?N2dpOEFkRmRpTGpOWEVzN2hlRWdIUm16dUpQWTQzSHFiY2xJSGp6OVdYZXNx?=
 =?utf-8?B?T0tKbk13UU1FcldTdkUwdnVkbTN5MTlCU1o5bWxsMG1Fd3JXeU9CU0dJYmp5?=
 =?utf-8?B?VkZrTmkvOTJyNEhWSk9GSmw0WmQxZDJzdG1rYndwTVRMK1ZEdHROMXhNTjZU?=
 =?utf-8?B?MEhldStSUGJlZzQ3WDZLcGRWRitibWJJUDVrN211alQwQUdRRTdyKzIwUVNO?=
 =?utf-8?B?eEdudURlYTg0bDFkN3hXSTRaM0EybnRGb2M5ek9NOFFYVFBwVmFiRDlNTG1l?=
 =?utf-8?B?ZFRiU2p4S2RNdStTVXMvUUExNVJKNVJaL1lIY0RhUUN5cGx6dFYrNGFZVllN?=
 =?utf-8?B?bjQyWTNMWmlKQTZLb1JWYjJZR2RLbmtBbng0aG5ieS8vdmF2dDNsQVJhOWh1?=
 =?utf-8?B?cDB1NVBiVHJaNTVLTndNVGJDTk5QY0R6dTdpMk1xd2VISE90Y01PejZCaGlY?=
 =?utf-8?B?WisrMlB0Z3FGb0xZSXJoZUFLT0JDN0t3NlBjcCtZWitjVzNhVWZNT0toNVNO?=
 =?utf-8?B?eGJqdWsyRTBIZDRBVm9qTUc2bWU2dHdsQ2twWU5wdGllK3lYZ0hESFV4OXU0?=
 =?utf-8?B?RTBSYTkvYWR4ZHRNaGtpVlhKS1d4L0pMMEI0STUzR09oM0tpRERPVFJoU3BW?=
 =?utf-8?B?WWV2di9iSjNEbXBRNTlTb1hMRkxVQkFnaDBTdTJZTDFLMXRKME1sZkUvd2Z3?=
 =?utf-8?B?SjVrNUUySko5cDNrZ2dFRHRERWNsb2NwNGl6M3NQWDBud1hpU0FxUXN3bzJx?=
 =?utf-8?B?ZzUzcEpzTjRjaE51RTVXV093Z3YxM0Z5RjFuMUJwVk5kakZLak1qM0xrYW5j?=
 =?utf-8?B?SU9POC9RM3ZGd1ZWbjJjMXY2d2VzMitoRmFLeDAwY0dXblFlQVNRNHFtZlVz?=
 =?utf-8?B?VWlhT1dYRjhhTXRqRmNLQXVGaGNFU290QXhjRWJjQlB3bDA5SUhLNTBMZkpu?=
 =?utf-8?B?Q3NPNjN3eXpnSmNhOU5ONzBCTkhXcE5hd05zRFoxTFllQzZ6Q3RwUmlzYW1J?=
 =?utf-8?B?WmEyZXVNang2ZUJxYWRIam1MS1UrN3BTU200dmpRZUo4WC9nQndPUGhqSWJw?=
 =?utf-8?B?OWcyQ3VlZExXMWpCVWN5RDc5V3Z4QTMzT25ETDBEOUhXK255Y2NmNTg0Nkhk?=
 =?utf-8?B?dXp3T2ZkZkdjWmdOUmlBTkRKTTJaYTR3WDNKNGtQeG9WcHVpUk5IMGVncWcx?=
 =?utf-8?B?U0J3NHZtVzF2aysyMlFxUWdoQWJFR2djUE9qeVNIdjlkajZMUVpwSTYzbHAx?=
 =?utf-8?B?RDRyTncyWmRqUVZDVTk3T1FWTlI0b0RFNHdvb2FuR0Y1cVQxdVVtQ2tJdU1z?=
 =?utf-8?B?N3d6WitWQ0Z5VTNyRE1UV1BvTENncTVNNEE1UmZWQitSc0FVNHZ0YkI2L1hT?=
 =?utf-8?B?VloxWGJLbExzdU1ETS96eXFNY2RocmEvR1RDNHA3eUpuZjBnSnFVKzE5R215?=
 =?utf-8?B?YVczT2R1dGpzODJPTUdRTmxuOVkrTGtjK1pVajRiNEwxcGhkblR6QUcxZzZn?=
 =?utf-8?B?VGlTckZ4eEtGWjZ2U1QyY2xhQWwzdFIyUlBaVDhYdFlpdml6dlc5T3hseC9o?=
 =?utf-8?B?dWdSVWk1YkdsYkx1SWFhY05LaUVQWTdra0k0eXM1b05XdEJsR2ZRVHg2Q3FZ?=
 =?utf-8?B?eHFBZ3FjZVp6U3BSN2R6VXo4U2JNczdpOWV5SWlIS0pOeDZwdjVTcmNQRWk1?=
 =?utf-8?B?MndObmtOeFk1bldhRThmclpnb0V6WjA0aEVEOE5sdmVnQW9JZjE4UmdraHhD?=
 =?utf-8?B?bnJvVE43Y25yMFEvemdGaVJJMGdvZHZaeHE0T2NrVDhCZDl0QnJ5L3ZFNk9I?=
 =?utf-8?B?Vms0OWs0K2Z4TjRqODFvcGpHSFdEK0I2bnA5U05LZVNGbm9Pb0FoSFQ0K256?=
 =?utf-8?B?bjhVdGNya0FmNC8xaGhQZHNxcE9Fa2drdlpTbXNYeDBBajR0SlhrRTAwWlpP?=
 =?utf-8?B?WmQvbUpDODZDc2VoMS9aQi9iM1BFNmJPeVk3ZjJWV3o1dHU1NlE4S1N5UHln?=
 =?utf-8?Q?efoi3SN0vo+u2xTPkY6McYkR7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98af0ce5-ed21-4913-3b33-08da949920c9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 08:31:02.8874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGoHm1MTM6HyAXHq4bf43Ni3d4/Vc9nBfgQ2r3eo2MWYxf8oxe+hd8P4Mq9HjO4OpIoqPuqfRob2/9iixcXldA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9519

On 12.09.2022 10:23, Juergen Gross wrote:
> On 12.09.22 10:19, Jan Beulich wrote:
>> On 12.09.2022 07:53, Juergen Gross wrote:
>>> Add a helper domid_to_domain() returning the struct domain pointer for
>>> a domain give by its domid and which is known not being able to be
>>> released (its reference count isn't incremented and no rcu_lock_domain()
>>> is called for it).
>>>
>>> In order to simplify coding add an internal helper for doing the lookup
>>> and call that from the new function and similar functions.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> I don't see an issue with adding such a helper (responding to your concern
>> in the cover letter), but I think the constraints need to be empahsized
>> more: We already have get_knownalive_domain() and get_domain_by_id(), so
>> how about naming the new helper get_knownalive_domain_by_id()? And then ...
> 
> I explicitly didn't name it "get_...", as those helpers all increment the
> reference count of the domain. And this is NOT done by the new helper.

Hmm, agreed. But domid_to_domain() isn't expressing the "known alive" aspect,
yet that's relevant to see when reviewing new uses of the function. Such uses
aren't likely to make the reviewer go look at the function declaration when
the function name is pretty "innocent".

Jan

