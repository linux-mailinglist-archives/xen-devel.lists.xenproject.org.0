Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 599D74AB619
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 08:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266499.460184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGyuA-0006SI-B3; Mon, 07 Feb 2022 07:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266499.460184; Mon, 07 Feb 2022 07:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGyuA-0006Pi-7m; Mon, 07 Feb 2022 07:57:46 +0000
Received: by outflank-mailman (input) for mailman id 266499;
 Mon, 07 Feb 2022 07:57:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nGyu9-0006Pc-1M
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 07:57:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a151a82c-87eb-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 08:57:43 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-7rK-2w55NhyHNkkn-wwLPw-1; Mon, 07 Feb 2022 08:57:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB7867.eurprd04.prod.outlook.com (2603:10a6:10:1e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 07:57:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 07:57:40 +0000
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
X-Inumbo-ID: a151a82c-87eb-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644220663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kzv55B+liJ3xu1Svsph715mjQ5mphwDYUJs5l0cHa1I=;
	b=O06UseV9RKD6/pL+BhhYHDp2/InveBeiX2BZZwmpGf5+CmZy+go+NsjKR+LLfkDszIqN/b
	6Mh2bfKP1SmDOL2vRJKMgqwbwPHnYi4IVUsf0AJmj7Ua6BVkVBhQVpTHHp8JJdL7u3qJs2
	cOVM9E4umodMcxbYw1l/kSVQzS9ZwvU=
X-MC-Unique: 7rK-2w55NhyHNkkn-wwLPw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tj14ib4tsbFVTn8ynr5JfU0EgO+n5JWgpNtBCUHnyEKNGlWEzZ5iLJCGRsPrL6GqZY0fxJfUgm0vVXiXioQfAD/E7kYrUZ/beDt8koeicts3xkX4ah4EqJ5Om7wfJpwqF54M4mzr3Yibko7ZJ5JvS+SMxMSz7xhww4ksV1SMS/mPgx0jngO1rN/RhAUcb/hs76fDoa1ljhMTBDsPtKWv/Ff3FpSsYC8kZJfuVy17UxWQThhMjrN7r25gkVbNeR9UkFzA97ukOD8SECOQtXY/5K+jwdappXaOF6LBwrlrwelYdp+uETAttivkMAlr39eak1f6BWquW3dPiPyvNEqs+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kzv55B+liJ3xu1Svsph715mjQ5mphwDYUJs5l0cHa1I=;
 b=HKIFXXNuAgMWfV9OoLgGYlVCkTF/ff/cCFGRzHHsRaQKoLK5NOLEof/0JtNpe7CuZQ92l2GF7U6IjjMV38ngxSIMNvRSpElmjonzkw/O8OxgcLtU2A2OqEZLIDYU2g3vStN3RFjcl+uWK19PDBEu9GYswoDMR8WDi5ZgSDl3e5Y19F/wVy0Jiwz3j9fBkl9OpNKBw0UXDN7u92fE2ZDDiQJ9GfRfaOZLnFDqTgvV7VkVBqn619b7JT210FQgOQ6KkbTwX+pbLxU7qELlAfwSOrcHJk0rIVb+jX0WgtBiLwDtTxiRzONpWWFjoptA7km/HlSX6VFU0R237sBcYydmJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0e64c52c-1e9c-e89b-abb8-50171d885926@suse.com>
Date: Mon, 7 Feb 2022 08:57:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: PCI passthrough support for PVH mode
Content-Language: en-US
To: tosher 1 <akm2tosher@yahoo.com>
Cc: "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "xadimgnik@gmail.com" <xadimgnik@gmail.com>,
 "oleksandr_andrushchenko@epam.com" <oleksandr_andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <709142925.628001.1644127197288.ref@mail.yahoo.com>
 <709142925.628001.1644127197288@mail.yahoo.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <709142925.628001.1644127197288@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0101CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a07a3a03-12ff-4a70-f842-08d9ea0f8372
X-MS-TrafficTypeDiagnostic: DBBPR04MB7867:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB786772A51A237129B1B1B848B32C9@DBBPR04MB7867.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YxrPQjN468CMxwDyf6X/sqH2/j5GpDsEY5Gs1pF52AVWh9+STGZrGLgC6E9h7uHZkeUDhSfHaTxRIJYw1yS/Z906s1TNzqCT3zbCZ4buoywANdxXh0PNW/3tZzLUKo8QnDfEZBzNCTJXUgaYlR5JVhONndTo1HDae+VUyDYlpFkA5GRGW3PB7wZYgZQ85Qd58LoOQ3zEkxPY+o4sQ0VCMPmgM7upj/15MpCb4pe1usklU26loo5WkD0Yas2hwfs2JIRn6cBOHUUtm5LfK33ub30G4Qy7AldMbth98AjNr1DkSGSy45RyCaW9WWnucvAPSKJbrPlQHyTNkjsf/4FjMz0cpeqoV6WYfXZUhmuFc58jkjVbjbqObGCkOD4NmhiPUyaVy79wTVRbHXJZEx6VyfPQfFCldf9gR65dBwdnrp1Nro61GmfPm/bb6LhToaQsvJcO7+wEAIE4DR8xUDf0xIQwZLBGgran5L9wUcgBTdhxAuUksmRllrP/qbvXgBwSEBazzfThWL5aI1O1AVdKxNWTZvXelxrZ2ovkdmWbmXCE1BIbLunXSd5MmyB6Pi2rKPVyUGqaz7A17SYRUbQv0Mevt0OHBPFh6oNeX6Y6okwiALvaOEjB1xcsItSKPW+fsbXDxP/6E/UoHJDqFGPuGNPeLymvCYLcgAbTjSZB0e1jX5/rKHZ7Gtx04NXErNxkprnx/ewbqgVhm6f+ZdibDBsxzP9fAcD1YzZmzdiXlzA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(26005)(186003)(54906003)(6506007)(316002)(6512007)(6916009)(38100700002)(2616005)(2906002)(31686004)(53546011)(4744005)(31696002)(86362001)(66946007)(83380400001)(5660300002)(508600001)(8936002)(4326008)(8676002)(6486002)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVdBc0xtTXkycmJHOTVINUg5bTdlUlhZaXlDWk5oQnV1SE9QNVVCb21na0ZD?=
 =?utf-8?B?dUZFbWVZZS9iamkvSXFGeW43YWdsYjlsWk52ZUFIY0NvSEFmbFBXZVFyTmcz?=
 =?utf-8?B?ekJObEdBN3NwWnRrdWNZT0tXQkJmbmZMRmJ5bjg1SC9leTZMN01KZmkrUDZI?=
 =?utf-8?B?VWNmUEtXNWgxMndDcU5NTGE3dWVhaVk5Tld6OTJwVW5LL3hKa0tYbGZQVTAz?=
 =?utf-8?B?TkxZNXpOWEY1ckFPckxibXkrYjJKSVMrQmVwamhnYXlveHY2WHp5Z3FuZnpj?=
 =?utf-8?B?N1pnbWZ3Nmc2c1Y2VkVRSElUbFc2ZGRxQVgyckhsU0xtbktUbkxKRnplMnll?=
 =?utf-8?B?WEV2bzZEb2tJZ09JS2VRdUVOVytoQ3ozTVJWRHNRZVhWUkNHMjZqcFdhUHp5?=
 =?utf-8?B?cDNUdEJhM3g2SjFSV1ZYbk9LRjhsUmNzWm5Od2lRcHN3RG5UVjU2bmlJdnZE?=
 =?utf-8?B?VFZXaW9TMCt4MkxjbDdnZXZHQWl3Ymk0Ukdod0pqK2hIZW9IeVNUM0RGK3NW?=
 =?utf-8?B?WFA4UVd4aUdCTFh1VGlWb0t5cU0yS3krNnVMWE5KNXVHSHNiMDJvVkFkOXov?=
 =?utf-8?B?dkgyamJsNk5ZaFdBSWRBU0N0cGpkK2lpOGI0Rm5mWjRkcjNYSkgxWkhkVnRv?=
 =?utf-8?B?Y292VW80ekxOQlF0ZWh0akhFRjcyS244aFI3MUtjazl4bCtSNHQ1b2ZpWkE4?=
 =?utf-8?B?djZaUkliSGphd2Y1WHZtTlUxc2lQYlFESXJMK25LMjJDc0ZTMElSSE9lTVNy?=
 =?utf-8?B?U0FidjVtazdBbzByR1pDT3V2eE5tU3NCOWtiZXVqREZCSE9nZkloeWZJVG12?=
 =?utf-8?B?dStraHJMeklZSzlqbFFjWUp6SjZqTzl1WTFpb0RVMDhkSnZPU2Y4VUdaTU9Q?=
 =?utf-8?B?ekFGQUNRWHdBMVA4ZUtRVVBKQ3BYV1A2S3hUdGw1dTA0TmFHQ1o0VGt6RW5y?=
 =?utf-8?B?NGJXQnprYlBBd3g1NDkycXpUNktReG1BVVgzRnpiaHpsMnZRWk9WbDdDYlNU?=
 =?utf-8?B?OHNuYU9YdlFwclVCQXc5alZwa1NNSkYvSWlNL2hzSnZmLy9TWnpuSGNSSHU5?=
 =?utf-8?B?Ty91UmEybkFicWpkTkpDdVUvWDQ5SENoYzVObm9GZ3IwUGJqckt1aWlhZVNz?=
 =?utf-8?B?bndPZTZIcTFPYlE0cEpXUzF3Qm1zS0NTQk50VlE5UWcwN3ZSaVJqU0VpQ3Bx?=
 =?utf-8?B?U0xKY0RaZTJmaFFrTnJiYlhlRUJhaG1naGtFaEJ1akQ1T2tNMWlWMkZ4U1RP?=
 =?utf-8?B?V21WU3Yyd3pRSm1zRzFCdUlET09uWkJ2U3FIUEdBWHkrUlI4SThUdGF1NHpm?=
 =?utf-8?B?T2ZoamNpRzQ4V2dpL2luQ3dTdG91d0t1U1J4Z2Jqc05RR1JIS2dsdTBnTHox?=
 =?utf-8?B?RWFEZXJROEtnYlNOR3JqL2ZzT0NwcjFDM0lxRWVoa0M0ckxiWFliNE40STRI?=
 =?utf-8?B?NzV3RWxxajEyWUgzV2JWUGE1eURpZVg1NXUwOS81L3FOd205N1ZEZHRVMmpz?=
 =?utf-8?B?WExZejhjd3NGVjd2ZDlhQUM0WUZzMlpRMmZsb1B0NUdEaEkxRWNqSjlER291?=
 =?utf-8?B?NkJrQmdUOXN4L01KYXBXc3dqL01aT0IzUCtDZ2NxMExrTmxGcUZrcm5pb2RG?=
 =?utf-8?B?MjBLczArUDh4eEJFMmVwUm8vM0hFZWZlbXRBNC8xL05BUENHdWxmZHRkcXNZ?=
 =?utf-8?B?R3F0UXc3U3h2NG1LMWlRbXZlUWp5NHpudXhqNzVHbytkekN4UHg4ckpOQk9V?=
 =?utf-8?B?U2xBeXorajd0WDRneXNGdVRiek04Zi9XNjR5bVZHZ3pSa1lEelp3S0F0MWg4?=
 =?utf-8?B?cG8wUkFrTVNJZmJCU0Fvd29WdURXcGgzMDdFQVhLYXRrSzVkMkU5NVRNN3RK?=
 =?utf-8?B?U3BEWlJac05jdzFvQTJNaysyTWZiSkI3M3lGZGpYUkJFVXlMdkFRZWRGcTcx?=
 =?utf-8?B?WUprY0NMQTRKTUIrMmI3Mmx5alRYcCtWeEhwa3RFcDZrNzNkbGhMQjdxeFpL?=
 =?utf-8?B?YVhra1hMeTY5YmJwNG5KRjZ4OEdTV2F5cXZIT25VME9saVNaL0FkWGw5MjZD?=
 =?utf-8?B?OUxoMUIxQTIxTkM1am9YU3hPOXV5bFptRWtWcHA3ZkNWT3lHNUFSUWJVZytv?=
 =?utf-8?B?Y2svRjZKUElWckZhVTdJV0I2VVJXTmRxWGdyZUFxOWtheFBJK3R0azZVSG9D?=
 =?utf-8?Q?flgLhbWzGX56VJ+CEaFPa1w=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a07a3a03-12ff-4a70-f842-08d9ea0f8372
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 07:57:40.1801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BzTIQcZlDRFl20uhBb2wJrJNII9ukfgSXjG4p86XqSzwC+96V8QVj5rpKfMFHu4NGREDOKynQEfU75VT0ZLMiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7867

On 06.02.2022 06:59, tosher 1 wrote:
> Back in the year 2020, I was inquiring into the status of PCI passthrough support for PVH guests. At that time, Arm people were working on using vPCI for guest VMs. The expectation was to port that implementation to x86 once ready.
> 
> I was wondering if there is any update on this. Does Xen support PCI passthrough for PVH mode yet? Please let me know.

The Arm work is still WIP, and in how far it's going to be straightforward to
re-use that code for x86 is still unclear (afaict at least).

Jan


