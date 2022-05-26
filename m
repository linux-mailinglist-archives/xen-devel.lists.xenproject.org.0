Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B122534CA8
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 11:44:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337515.562124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuA29-0000iQ-NV; Thu, 26 May 2022 09:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337515.562124; Thu, 26 May 2022 09:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuA29-0000fl-KD; Thu, 26 May 2022 09:43:57 +0000
Received: by outflank-mailman (input) for mailman id 337515;
 Thu, 26 May 2022 09:43:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nuA28-0000ff-Af
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 09:43:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ba3a333-dcd8-11ec-bd2c-47488cf2e6aa;
 Thu, 26 May 2022 11:43:55 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2051.outbound.protection.outlook.com [104.47.1.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-6GY9GHbCPRiq5fIJIkfYhQ-1; Thu, 26 May 2022 11:43:53 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7166.eurprd04.prod.outlook.com (2603:10a6:800:121::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 09:43:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 09:43:52 +0000
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
X-Inumbo-ID: 5ba3a333-dcd8-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653558234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rNLzXGPzEDdIGxLiFrm3a0H/HsUlejL2fZQ/rIXKN64=;
	b=Mqs2fU1xKj+Rvyvi/3jA+EU57lztZYLRkZzf5P987OYFXqslwvIci1N5pX8tWd9muQ35uR
	L2doOzgkDMI+21KF1XzOxz1dH+8MIwx1lEnkBw5+Jyl37SCUgRwNYX9aJJVaUpLafwu/XT
	hvXbmDzH4raKMyylARNb4jw7orELZQc=
X-MC-Unique: 6GY9GHbCPRiq5fIJIkfYhQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6f4AU1aD8MdO5DsNt0flMRvnx25m7dkgQpiFiDfQTd3IOFlH8bY2m0HTkkfRK5CAP+TsKV3I0NJOPrJ8ZEg4Le0hW05eFiU/RyspZQlb5Imun96fRhvJCeEw1R/8djggszpOf+xps9Kujmq4pzCEbm1DrPV/qJanTwtGIOW2201+HxWT01jTYeKT1DtRDYH84jE7O5uVcvUzpSCwW4yd+/lTZFqZKclg4GFOyG/0QZdd1yOgXhPRGY5l/Y2p4siXqc5u6XqGctNK0BvaRMATYlP8WSq5APVM/zApzE3g33RK5pTe7jAy/0Ijk21gCLL4ZXKEH+PfYP6jTnS53NvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNLzXGPzEDdIGxLiFrm3a0H/HsUlejL2fZQ/rIXKN64=;
 b=I3Q7qgvZkkMsVU0EGnMK7moFkUJx/BWxdFm1V2zu3ltBT4mfLIv0gxKGpfNls6xYeL1vOBTGdAbd1fuCM7Kp5g2d4VqkDwaq8KEKCs/YaFnEP5cFihW4CWmCR1zmfb+CR7qBzekesa4TqoD9xH4lNbdm8n7oqZHnj0wNG/wG/YnO84jzlRScvlAH9hVYGpRq/GKkaivzSnilSftY832fXJBhtRt0Sw7expSl9cd9ES2y4faHjaXkss1huST/CgZFmNR0U2D1ziEZvYAmNakQR8IuY1K8LXoV7PXKw5iKyNUYg6cBWosFYP9V7scn607qk68Ge5SPELjGowG75cHHew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0cf7383d-896e-76f0-b1cc-2f20bd7f368e@suse.com>
Date: Thu, 26 May 2022 11:43:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, Bertrand.Marquis@arm.com, George.Dunlap@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Julien Grall <julien@xen.org>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop>
 <20220525003505.304617-1-sstabellini@kernel.org>
 <a19d22ca-33ef-b348-ac88-490010464bad@xen.org>
 <alpine.DEB.2.22.394.2205251740280.1905099@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2205251740280.1905099@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0023.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::36) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41535932-8609-449e-2f63-08da3efc3e60
X-MS-TrafficTypeDiagnostic: VI1PR04MB7166:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7166F765A11057E65A45F202B3D99@VI1PR04MB7166.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/aOwbNjpOj7l8/Q15cP0Bye84xSZpD5/PEpJfzUA+A75UEpUA/4HST2sfvxrPBC00MeMuT6S0MVwtu9aYXkj2Z7EETbTGLkdi1PVPLSFNxr55EljGMmbOdioqaXL7fGatLAJjDfDGXLiK3aaLQWUshAtpvGzu/R7CzD49d8trQXaxvPlpm+r+J1mvBb7KdlP4bTOKkp4BOVhV6r9JG++yXzfgcoqwILyBqfGjj3QJl4JWeJFr711G3UucUaq1eK4CIK2UN15ju5f+tCEO84BpKe6IXzHADNreVv83ExKLqp2E4hmqr9AAk351WngjR7hAXysG0Id2Jsl8h+9qNVn7HFuZKK+nCSJPUjM+DmFNsW4/2nXC8Bacw5gODF+4OHPlByxGTV7Lu+s8m5TYA0QRiqw/PJTxGr89WBdDnV6yg2rUC4BrKNm/m01wCERiMK0y8jNZdt8Aahj/4PQzSUsiEKIgGg6WC2luZOnAW8YN+15h63zgsWuwI/bsuqpwY0uj8emrIoFK26Ee7R1RKFsdIRuCj/wklLHLJ+zU9G6Kl8PJTUvMu5TPRCKycW7MVEB2gO7Lel3OR5SlpMGFqfZHAWCT7P3KQeOOR4CPrrSh/IdGKhAonVU8um2lp/uhYpf6r5sl2/JTnQUbUxhuz0DGym4NYsoIMDDfC+HbHUzopqXDEwKwOZRPZ3DHL5bM8f3eNUEiJNKmQQ1gI1a5B77du3nTXmrz4jfTOi94wyztibtQ83u2uIK3fkyIXZF35XdzweJoIhmhrg+BjmROJE+EFHNa97Ug0wTA2W8heOTeowfSWK26Kk2ih+xNJBQIqLS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(8676002)(6512007)(4326008)(5660300002)(8936002)(66556008)(66946007)(508600001)(6486002)(966005)(6506007)(316002)(38100700002)(36756003)(31696002)(6916009)(186003)(54906003)(86362001)(2906002)(53546011)(31686004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?andwdDVSalJVeFZiSzdiSS81eE83OWxvbTVReDdnL0gzNFdnQXBtZXU2amtC?=
 =?utf-8?B?ekZHaURzc0Q1eEYvRjJmWGlxSm1hOWlHZnJSc1YrUitoYTl0ZlBVRzdMT2ti?=
 =?utf-8?B?VVJWRlJpc041OU5WRVNsNFZKOHF6Y3hYUnlFcFo2SmZZb1NqdHlFaG8zZmZ4?=
 =?utf-8?B?bFU1ekM2amVhZzkybUtXVEI2RzRoSE1OL1RvTEhndnc5dXF1SXNsNkNLWGZw?=
 =?utf-8?B?LysvNzVsR3YrUE1teWtKRjBSUnVkUkkrOUdKdXY4M0loblVrTE9SZUhEcmk5?=
 =?utf-8?B?MHd2TWFOajd3ZUtwT1JaS3VrT084RlAyR0pRSkJIaDgvOTNmaFhxeTVha2hh?=
 =?utf-8?B?Yk8vSkYrQ2w1M3RkOGlDUy9YV0tBc3RLUkxJcGVvZlRSc1psbTVOemRuYWpw?=
 =?utf-8?B?Mk52TXA1d1hsdzVNTFJtYVZDQU1hZ1N4Z0RBd2R5Q3d3V2VVbGJ1YVpmNjNr?=
 =?utf-8?B?Z2M3bDM2UEhjb3F6MFZmSDdzVU03bFIxSWdGUzRqL3dZd0djMm1YYzFqNVVP?=
 =?utf-8?B?am5EaUV5MVNVRkVYWitPWFJ2K2w2dUd6ZjNXT29RQldXeTU0TnREU1NsaG5v?=
 =?utf-8?B?ck1ZWmM4UjJFTXVTVTNCZVhNUXBZdmZ1a3EzMU4xM2JKNTBqR1BtQVlhb0ZT?=
 =?utf-8?B?cjdLbkF1ckQ5VUJJWFkybHBjSE1ReksrZHB2TXZPN0x1VlVDNVEyRXFNcW5j?=
 =?utf-8?B?M0dGVTZoQjRTbmlPT2NYb3RXSHNMOHY4SE9Bc05OTzM0UWk4UmdlcFpCN1NE?=
 =?utf-8?B?N2FqN0t0WHdEMkhadVNMTVJwOUMxUE40dFJIcURtakdPV1hIc2FkcjJacnI3?=
 =?utf-8?B?NFkwQjlqVTR1Z1pTM0dXR0hHOEo0OGdPTGFybHVlbTJuV09CZHBrOEZoL1Uy?=
 =?utf-8?B?K2YrLzgrV3BBRXIvMi9Kb1B5TGdFaWZHREt1dnlsMlJueW1kL2Q3NE5wd1dM?=
 =?utf-8?B?V0ZkSlZRejJKbU5GZXpXUmo4cDVIT2xucGlVWi9YS1JMMWRMTmlja2JWbWV6?=
 =?utf-8?B?S2hrSWJVQ3JCZjh4ZDZIOFlTdzRTczVuQjB3b2dIZ1R6RVZROENoRE5vcUl0?=
 =?utf-8?B?QUxKcTBjWTZvNzRNL1NCcU0yYWFBWUt6S1MrYk1sc0o2UThQcjN0SU15YnZz?=
 =?utf-8?B?OGVjbUxVL2N4TGc5d2JTR0w0VHp6anBuUjBHdHJaWFc5eEV4eTVLL1FhdkpN?=
 =?utf-8?B?UkJLejlURkJ4SmxxbWxrQ0ZBTGJDWllSQVVwMm04a040WmwrY0VXb0N0R3pL?=
 =?utf-8?B?MDZGbk9Makc5dzdvbUIvcHlVRjFpVkhZM2w2VHJvcjErN2Z4YzZ5eVhBZUxr?=
 =?utf-8?B?VEpWNzlsTDdKM1pqVFNTZmVpbG5zeW5QMDYvYXExMTd2RUJxbHo5aE43bEtE?=
 =?utf-8?B?bjkxb1BZZUNwTjdTT0FHczROTHU3R3hReVR4Q3RzR0ZRbzNIS0ZwcndYYmFD?=
 =?utf-8?B?OENrQ012MGtFNmNaT3N4ZzBTc2tPOFRNanpqbkV1aFBKRDFMc2VFb3JHMkRa?=
 =?utf-8?B?OHJNTWw4bHN0cVU1U1lUbjdSWElXbzhBNXI3YXJlWjJpUXowbW9JdUpnemtM?=
 =?utf-8?B?S09oOWFDeFhZTm1DR0owOVNNQmpGNURhYXp2a2tIenV3eEdyUkpFcGM4SVVK?=
 =?utf-8?B?YXROWjhjNTl2SU5zYlpGOEh0ZkNXRHJJVHdTbGxaeXVrRkJvRGg2ODFFL2pQ?=
 =?utf-8?B?b3U5OUFmVm5hSDJsb09rZXFRTTlwY21QMm1DNjhJOER1TFJENjlRblRzbFFV?=
 =?utf-8?B?TU43UkRVd3A4WHRWL1EzV2s5ekhZSEtmVHgvVVlHRG53b21LVXN5S3Vwd3Zj?=
 =?utf-8?B?ZkhCRnRici9NZUgyRWlLbHNUOVNVSVhpekYvVnlxWjVBQ05NeXpaaVJnaHJ4?=
 =?utf-8?B?bFU3K3ROdGNNTDZnMGxUZzdiZUZqVTFKTHhoVWVoRDBkVWhqTXhUaG9mU2Q0?=
 =?utf-8?B?Nk9EOXlmbmJvZUthOE1ZVHF5cWlDK3RiZWZoR0o4RWlSMUI5MXRNcldRUFlF?=
 =?utf-8?B?U0tKNWs2cVNxbWNIZHlyeUtieURpUEdaN3NtWGNVNm10WThxZ0hqRnlvaW5D?=
 =?utf-8?B?K1FtNHI4M2RFbFBrR2dZWFNNcW5lR3NSZEsyd2lsMSs2RlFETWJNM2d1cFRW?=
 =?utf-8?B?RCtVNHJvWXFmTmtIcENkbHZtWnRaVXNraFdHcTlkOW11N0YvNlNOdDI0TzRj?=
 =?utf-8?B?bG1uNDcyZWl4Z1d6eTlrTUlVQjViYWlwazRDYXpwcjhBMDVNd1RpMmlWYlhP?=
 =?utf-8?B?anRqTlNKNEhLaVBzWFVsdUx6MmJBK21QU3ZhSFB6WERQTUphR3owN0kyWlBT?=
 =?utf-8?B?blFDbkRockNuMEE5T0luOU9rVFdmd0hrdkxZNm01d3ZUZ2Z3RVU3bjVoeDBU?=
 =?utf-8?Q?0ttOneHUiSGjdAI7U7cJNQ9iI+RLzx1gV+1DXNBZjHXBI?=
X-MS-Exchange-AntiSpam-MessageData-1: RvSrD0rrfgDzTw==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41535932-8609-449e-2f63-08da3efc3e60
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 09:43:52.7080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3W7YCXhTgz+uPqDtSd4tkbjQmHJEcMLT3KVHsVY8OAWNYUhygWTZFFXFv33UrAsNWZqaLWj8iryiofwlm7FylQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7166

On 26.05.2022 03:02, Stefano Stabellini wrote:
> On Wed, 25 May 2022, Julien Grall wrote:
>> On 25/05/2022 01:35, Stefano Stabellini wrote:
>>> +- Rule: Dir 4.7
>>> +  - Severity:  Required
>>> +  - Summary:  If a function returns error information then that error
>>> information shall be tested
>>> +  - Link:
>>> https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_07.c
>>
>>
>> ... this one. We are using (void) + a comment when the return is ignored on
>> purpose. This is technically not-compliant with MISRA but the best we can do
>> in some situation.
>>
>> With your proposed wording, we would technically have to remove them (or not
>> introduce new one). So I think we need to document that we are allowing
>> deviations so long they are commented.
> 
> Absolutely yes. All of these rules can have deviations as long as they
> make sense and they are commented. Note that we still have to work out
> a good tagging system so that ECLAIR and cppcheck can recognize the
> deviations automatically but for now saying that they need to be
> commented is sufficient I think.
> 
> So I'll add the following on top of the file:
> 
> """
> It is possible that in specific circumstances it is best not to follow a
> rule because it is not possible or because the alternative leads to
> better code quality. Those cases are called "deviations". They are
> permissible as long as they are documented with an in-code comment.
> """

Hmm, so you really mean in-code comments. I don't think this will scale
well (see e.g. the DCE related intended deviation), and it also goes
against the "no special casing for every static analysis tool" concern
I did voice on the call.

Jan


