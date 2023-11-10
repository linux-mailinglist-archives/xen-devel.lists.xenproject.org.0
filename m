Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D4A7E7C42
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:45:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630285.983012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Qsc-0006xs-EF; Fri, 10 Nov 2023 12:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630285.983012; Fri, 10 Nov 2023 12:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Qsc-0006v1-B8; Fri, 10 Nov 2023 12:44:58 +0000
Received: by outflank-mailman (input) for mailman id 630285;
 Fri, 10 Nov 2023 12:44:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r1Qsa-0006sp-UM
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:44:56 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061f.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2ee5b34-7fc6-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 13:44:55 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8793.eurprd04.prod.outlook.com (2603:10a6:20b:408::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.7; Fri, 10 Nov
 2023 12:44:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.010; Fri, 10 Nov 2023
 12:44:52 +0000
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
X-Inumbo-ID: f2ee5b34-7fc6-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qyvjj+LiNSKaPSunGjWDVJyUvhl0HCxLGG2kLX/InCPaqdK303x4NEapYSgo/huiLCikA5zoV/DEwea7hHhL978yYllNzm6hPFdeKQ3AXAf7pU5IlbLkpbmNDE9d/W46VQY98e3uyeRsp87OiAy2SMHGBvJrZ1osrZ4LTOeCEz3e9Q1+TFmreVnXJdQMDhgS/LwIO8tUlX3pqCdCzSQFb2iw6xn3qD771HRQvpqXa46prT3jmbrR/4xJ/fuuqRnc2FWXmAk9jT7TvZbwRaJcqj3ea+zwiA1bi4/Ou/o8qbIYGzftnp6f5wutZ8n9zLOU5ggdEmyeu00SCTwalD6YUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFxTjFDNUPAnbA0IIp9Blep8NlksFtPdsH6CO29nvvQ=;
 b=Eu0m9PXoocNJbn9/tZVsn5RJExvNniEvuZNgFO4P1UYMSSecne+Y6m50lJOpppzHOcQkFpKbjcRu0krwpNQzTYdvL9dqo41XOn+pCFgmPsYkcDnso5pjBcbYuTFGGUvC5mCUGCqVg20mcWiZbSnwub2Hp5u+gXb7KFMr/YrD70POso920M8JJtx86pkT9UqZtjJzThCwkHy5ZU73DM1o85kNoHQr3gtWtRYI9LroebQ9Po5XZboB8/OtOmOExO2BGXUsAHmz0b5r+UgqJMDh0ygFPiQoG78pw2iP45xeaKXjFq9d1J0FqtWZ+/tAMqOW/ssskdO8jgB5lbW7ZjCweQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFxTjFDNUPAnbA0IIp9Blep8NlksFtPdsH6CO29nvvQ=;
 b=VdHlGHi3+LwjJB9fpbC2NkWm3HAfOtgQ2yMjPSJVRWiF+WGG2Gk4gHAHFnDNJOfCB5BCHxpz7V1/qawmCSQ6IkdRoFZ/6SFnB/vGcbOpjlVftLIYQCkSMYQktoWy8MNyLJC6JDSAgGnZya2q5+b9GtGuj0fryzd702vnOZOfdGoXeBT20lT7ci+LQv+35qrA28nmjzetj0yEF9Anjd32O+nNsnzNEQd72J0s/lnZ+U+EuqTH3qr83lfQzsGd4MMEcuOeGpKxvykZWVv+420XwRMdVIoxomk+yN47vgoAk/Bv+5knrYwLJU7wFDUFHT4vu0F62udAHsG5V9nhCcUOZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9d75d794-a333-792a-786c-064d35910980@suse.com>
Date: Fri, 10 Nov 2023 13:44:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/5] Mini-OS: get own domid
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org, wl@xen.org, Juergen Gross <jgross@suse.com>
References: <20231110113435.22609-1-jgross@suse.com>
 <20231110113435.22609-3-jgross@suse.com> <ZU4g0y-Y6-77sY-C@macbook.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZU4g0y-Y6-77sY-C@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8793:EE_
X-MS-Office365-Filtering-Correlation-Id: 4440335a-18e0-4f12-558b-08dbe1ead5a5
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	emlVGvMJCKrsx00qDZAxepNyHvVJbetmTkoADearEpNfT3ESo4yI4vsYTBrFL0CKYQBJ0ypxPjuAm4P71i/Yeruwxfs3fMtmRZjKdwqcfIZrq89G9ng+zgclIF4xWxasDGkF72Ykq82s13vqUZCH8KCDK4tZqI89gE34QfiuX68JzIggBbINiO5E1Zbz1hqrpBcyfB7qVG0xHv1HJG2henAPDDH794uK4CXc6WVO/EC5R6c9azchQVsvD/trHrBnEh8wEs9xYTbvjU1q6NAUSwS5+cf0knlEfpd05o63uk1T/zje6C3pnxBOocqGG0521Bp0tZ4aa15B6BT1tSI2VPUINtqtnaZ16+wf+dJ/d7EeTwLw8zPDTcJ6/x5GJ47WUna85NSnUeOpNvJlG6yrD2YuNLb54Huvt79j+qog15WKdX178BVw3MgfabeRB5o0XpSc7jeBwySrGbrA85MJpdwdgYVM9PqFeMEPEPmfOcyuOyoM731DM6mXXS4vMtTDoyKtQw+zlxBw0zEGWhtkfYji3q4bwDpCfn6e817SYYtX7k284u6Ga0EghxpEjzDK2HCf96BeaOHMef/nywzbyMIV29uG7sQrEyflaVFrI4Cu3h99KPDvyFZii/4JOAvMUw2yGZ057k6g7KCMlXTDfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(396003)(346002)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(36756003)(26005)(8936002)(83380400001)(2906002)(66556008)(4744005)(6916009)(316002)(66476007)(66946007)(8676002)(107886003)(4326008)(6486002)(53546011)(5660300002)(478600001)(6506007)(2616005)(6512007)(31686004)(86362001)(38100700002)(31696002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU5ibUt6NWdsM1NIelg5dUhLcnJQNGRUUUR4blNGRmJoRXFyRXZsRUNHREs4?=
 =?utf-8?B?MGVPRnpSRnI1SzY3Z0tvZUdhQmhBcmF5YjQ2VEQ5Q1l6UmJ1ZWFwSzBuRmE4?=
 =?utf-8?B?ZHYxQWFrMVgwV2JHandNbzQyZjRLMkFSaTVmelNndGFGWmhBRVoxQ0xSM2Zr?=
 =?utf-8?B?bG5qSlRMVnpUZWF3NU1WMmRCZmRvTjVJeHFiVWJoV1RkeVdlY2kydDdHenUx?=
 =?utf-8?B?V3YyZWs5ZDB1LzlJNThlUlhJSGxhMEw4Y2dHZlUrL0xlVW43RWRaRzlPNkU5?=
 =?utf-8?B?aFZQdnVNdWM2bnFHVU9VTm5BdUdJWHRUaTRaRllFY3FDVDNzMkZ5d21Oc290?=
 =?utf-8?B?NFFXdStVMENzdjdSYS9iRHJqWGNheVdrTFU1U21uelM3ampvbE9DMXFZeVFV?=
 =?utf-8?B?Vlhva21TLytJdlozZzVNS2FjaDV3QkdjNDFLSlkwaWRLa2U5M3hQdVpTTVFq?=
 =?utf-8?B?ZUNKak1tdUpZMmNVY3M1dG5JQmpqQnE5T0V5K3FKZkpyMWVwejlZcktKTmtB?=
 =?utf-8?B?bVhUU0UwN25VOFBrUE9US3ZwamUwdjMvVmtFVWhneHNNYSszNW1xWjBhRUxz?=
 =?utf-8?B?S0ljYm1aK1hEU0dSV2pBU0t3bE5YVjJ0KzhSUVZBUmhVM2RLd0J1U3hoSmRw?=
 =?utf-8?B?dXFNeUVzSjgvTnRUYlhRMU9SVTZIL0ExWkFZK1IyTGJ4Sy9YS0FJckNlQ1RR?=
 =?utf-8?B?ak9mK2lRQm9CTVJnTytraUxrSWZ2OW8xU29laUFqdHpaV3BBYStTekVTZUxN?=
 =?utf-8?B?TmFlYlVVZ25jNGdmVnhpQjFsR2Z4U0lXbVJmcDVtNnliVzN3VHFmOWI5LzNB?=
 =?utf-8?B?QXpaTHFyZThKbllsazZWKzdUS0RxUkM5a2diaGFKc2xzSUZyNlAvU1JTOWkv?=
 =?utf-8?B?ZlFHS1JmSmhyTG5qQ1JQOFJNQnRDdEdJR1RtaW1TTVMzSXlmZTY0Uit3TUsv?=
 =?utf-8?B?eUtUODNnU0pPa3FNU3l4aUlYalFNMVU5ZGNEckE2OEQ1QURYS0o0YWlVVnBy?=
 =?utf-8?B?ZmRYc2pOamhKMXBkZXVTeFl4cTdJcTNGTjliU2ZPYkk2RktPNkt4MmZHdWRh?=
 =?utf-8?B?SVNqU3hUc3JQNjZ5allqWHVrL0ZHODhPWG9SZ0k4Q0NSaE9JbXFjeUNjWXgr?=
 =?utf-8?B?NHdtendsOUg4dnZmdlBSRXkvZEVDREp0bVIzc2d0YnYyamZTS0x2SEVRR3Nq?=
 =?utf-8?B?VFFYVXBXcVVjekl1cXVmTXpVUHNDNGZMRVAwa05VTG1Da2VVaWJhSTdlSlBI?=
 =?utf-8?B?Z0w2R2tKYXZtb09NTExRVXVkSDVNYU9MbUVXRUxKK2RvMkhUZmVZV1grVUdl?=
 =?utf-8?B?R3JZZEZNRVM4YnlzOFRzb1laRmhxYVVlV2RqKzY4OGxXOCtXbUcvVzF6b0tY?=
 =?utf-8?B?ZWF1SUh0bWtJcjFUd2FtNUhRa0REUUZseDRBd2F0dUxESjRicjc1Nm91eWZh?=
 =?utf-8?B?TGVNeUFMaUp6ODBWU25EZFJ1Tk5FbGZYTlB3cCtKNkpXUGxJb0lSNm9oZDRv?=
 =?utf-8?B?QmRkQkx1dzRaS0hLQXg5ZWFoRHgyMEZTaklHUU42Wk82YXA0SGQ1L3N6aERS?=
 =?utf-8?B?eVhYVmRuOUxOeGdlVXRTbnJCUFhRL3hJdS9ETUltY2pLODI2WDBoT2tENmpi?=
 =?utf-8?B?VWFxS3E5dzVDUk5USHZNRTYwOEhnM0tBMU1tS1poUy9Rc0ZMc3VjVGUvWGh4?=
 =?utf-8?B?WTRNVjJucGQ2SkM1UzN6RVhlQnM5OVlBOXFhbWpEQWRRUzNkY0pNYXNrNnRR?=
 =?utf-8?B?a2RqQlFuYStQNVpvUFRwVk1pd05ENlZrZ1g5Qi85ZzBIVStUZUJySU9zUDEv?=
 =?utf-8?B?Yk9VQ1VJbXE1akJtQ2ZhNFBqc3QrcWlRLzRJalk0RGVLZHI5dmo3Q05sZU9F?=
 =?utf-8?B?cmRIUWd6MmVMckZVbmV5YktvaHRUT2VsVnFnak1tb1NHQXBSZjdOdmE1NDgw?=
 =?utf-8?B?WWVNeGFKZWs5bGMwMWUvallQa2R3Mys1d3lKcjVQQW0zVXQ3TmVCWVNIaU5p?=
 =?utf-8?B?MGJ5Z2FmbDdTRlBVd2pocDEvSFVvTHNzdHI3WWovV2ZJeEszc1FOOTR6blVU?=
 =?utf-8?B?TURUdmhscHlvaEFEaDFsM3NiMHZMakVSamZBd2t2cndmek1vWmVNYzROU0RV?=
 =?utf-8?Q?S5cYdVyTWu9eqo2R0Iu4VN9K0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4440335a-18e0-4f12-558b-08dbe1ead5a5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 12:44:52.6947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5I2+LMy71MuT1qzDzl+7q51O5gc8o/nkIDs6SU1MJfkurPHHjKCjiC3M6oa1X/7rtUfL2epTQGOb1ZWDw/vnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8793

On 10.11.2023 13:23, Roger Pau Monné wrote:
> On Fri, Nov 10, 2023 at 12:34:32PM +0100, Juergen Gross wrote:
>> Get the own domid via creation of a temporary event channel. There is
>> no "official" way to read the own domid in PV guests, so use the event
>> channel interface to get it:
>>
>> - allocate an unbound event channel specifying DOMID_SELF for the
>>   other end
>>
>> - read the event channel status which will contain the own domid in
>>   unbound.dom
>>
>> - close the event channel
> 
> Should we look into introducing a way to expose the domid, so that in
> the future we might not need to resort to this workarounds to get the
> domid?
> 
> Maybe in the PV-specific cpuid leaf?  It's a shame we didn't put it in
> a non-HVM specific leaf when it was made available to HVM for pvshim
> reasons.

Couldn't we retroactively generalize the type-agnostic parts of that
leaf?

Jan

