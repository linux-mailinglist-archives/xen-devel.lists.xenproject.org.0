Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5C472DDF5
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 11:40:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547928.855589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q90W3-0006bt-Qt; Tue, 13 Jun 2023 09:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547928.855589; Tue, 13 Jun 2023 09:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q90W3-0006Z1-Mk; Tue, 13 Jun 2023 09:40:43 +0000
Received: by outflank-mailman (input) for mailman id 547928;
 Tue, 13 Jun 2023 09:40:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kK7f=CB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q90W2-0006Ys-DD
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 09:40:42 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b61ca37-09ce-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 11:40:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8241.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 09:40:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 09:40:35 +0000
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
X-Inumbo-ID: 5b61ca37-09ce-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ql+1iSg+bTDf0qHku5y6rels7eJAvsBsr/cDgykqy/pavvXYe32FDiR4jTydoRnT8hdB+JlFCpKWheuJaUi15c3aJDDv5HQKve1CVM1ANdIkOf4Rv6EjyCaIoILLjq0WW8LkNSADGfNBvzABsZwhbAB0i/YcL90LTTgp/mNcUtquIqkLNf8sFRQgn8vGuQOUDQyapBtOOyNUaBl+gbf25Hf0ROzwsNAKbqtz1jBWP9No/qIiyl0CIU/O/SxD520wRtlBPN1TjJwls9T4jTL1CLrSgw2L7vR5gA/68PUeKeIwLzFDvt3I9k0UwwPGUo+sld5Eo905BQesRCboIF6uig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K08boMz5y38yj7qO8fB983ksCz8FNS5yAVWhpuy+tpU=;
 b=QMABfTLInH50/DYtqKq0FPzBpaBn5tZLljj9FE9OtV1nAdFBF1s619MbeGMsSbW+MgkcCt5mWO+WYSBHim4LunWu6eoHC6Er4qvM6p4fjiNZyWyu7V+i02Er276Bv8fHm6BuLrd1sGoCHhaR5T2aUG9wHisIrV5Z50MeDJGaojChEXq9qGezBJ8uHHZzW2O+JkKcZa2jOBVIqEP9zhQJdG/ruRhkZsYarL1IM07G4FgHcoEW0HKSDdlbta6OTtFvfihMKpjpKlhM8THCAlHTg74zgO59yq33DSgbYV/gxDCW0dtrFP3BF+SrDUyq8eW+ZmQZu/vhyFZjzhmorvPeMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K08boMz5y38yj7qO8fB983ksCz8FNS5yAVWhpuy+tpU=;
 b=HGUnhLFlyBoJF5OkKJteOf1lsnsvJ4I1ZKdJM2ag7k29J1sritBw9BbqyyK+umCEf4ajOlCvu9ejpyPDKvtVBrJJQdW4Ehz0nPiY5IT1anINv39MR38TIaaXScnfz9t86zTo6OhcGSES1V+Dsx8O2JsK/g5sPBHGNwpYGgxHr1GxaDn6qC13PwLGDobPVi3Cek7rHIovQjjTudFg/YSKaaz+N1oOWMxbS4H8Hk5jZMHqAY0+VU7BP8VP5tXc8kC2irXx6vEtFPr+X01/F+J+FxfdO4LmsyGEf/s8SE07vCpszDs905hiraw4xeLYevXf5zLUH2IRWa9B+F+tYrUxYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f00fde6f-4dcb-45a3-5b6d-5f1704ecacbc@suse.com>
Date: Tue, 13 Jun 2023 11:40:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/5] libxl: drop dead assignments to "ret" from
 libxl__domain_config_setdefault()
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
 <5eda17da-7185-9cf6-7e87-70da57aa0ebc@suse.com>
 <fba4a77a-1d9e-6f7d-9b07-26481e7098c4@apertussolutions.com>
 <a3c7752e-cd99-d90b-376d-bbc60cf4a967@apertussolutions.com>
 <10f2d41f-b34f-207e-eb73-d53f31385d8e@suse.com>
 <70622b39-cf85-49f4-69a7-b8039baa07f4@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <70622b39-cf85-49f4-69a7-b8039baa07f4@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 452feff5-894e-45a8-85bc-08db6bf23d39
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	95uDRibkp96JCMVObhgdjUVFgjfuUFlw1xJ4HI9sMKLFjbcspK3ez8Y6wYV1HIdjcF6NSRQ31w/lyu3A0KFPtnT2VQcB+mCJGa+6F3jrRDzzWMgp47c2WBYFFyNLkU9Ua3mz7RQ4I2a+gDwiUgm7PjAPK0PfKfeGOjY9hcymA46IWdLVctQBe+BMRaEDM5QTOiOnUwEiPr1AXiz/95XJigzWjemG+5AWYRQV4CqxMHqqiDfjut/OdSFTa8bTeLRpj2DigytbsWP9EoRapAh+kDPkjCm5X7jiC5jPX/GFPjhO0MJQv6f6fNsI9OuDpUwdVSIlMTh1J426SKO2QlOIa4GSB861u4W/ur2LD8f4pQ+xqAPYur2dZxHfqxDvCA0qeYKGHqWT66YwS/81N3ARhT8ShxtsQMSqZwfDWcReB7yUf6hZv5/nHYXxsndmdeEjWJgeB1Ry6qGk0hXfaR3DxpPZeUacUt68TmrFAGXH/sITFCp5k+cr+edJyFoLXZzBh1fEmLlhbVwEDNNVvHaVbeqc7EequBw+e+nHLHZJ8jEEJ2VxsTqYC1Qtl3n7tEm8QEHA8UmBPbtV41FbBfEtM7JinCfxvol+vIsKUEbu0Q9oVJx3iEtbveWhaVlUaIyjJGn6M+34c0/rBggra19KvdP2ibOkVEgyrB7G5yym6QIYV3+j4z/fbfMcwiCOeTKM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199021)(66556008)(66476007)(6916009)(8936002)(8676002)(36756003)(5660300002)(66946007)(54906003)(31686004)(4326008)(478600001)(41300700001)(6486002)(316002)(38100700002)(6512007)(6506007)(186003)(26005)(83380400001)(2616005)(86362001)(31696002)(53546011)(2906002)(101420200003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXFrTVFjSTFyd3NSS3R3UDN3SThXbEZSdk1ZNytVRjdQSE5ZSDJubHVReDVp?=
 =?utf-8?B?V2o1SlhPQkNpaUJ2aFBQNUZxbG9xOXRqRjFWMFMzU0E3MUtzSHI1Zmo1cHRB?=
 =?utf-8?B?MDRLSEl0ampnUjNLem1OL1ViRU45QVFtTUlyTFo0TUxXbHkyamZTOVdXNTAw?=
 =?utf-8?B?dzl1U1pEbFZzbVYxM3BxK3grVEw4djliNnVscC9Vb3BHOVFYendxVElUdEp6?=
 =?utf-8?B?K1lPZ2tvOEJxQ21Cb0JkTy85V1p4d2ZWTW9HN2hOM2xCMnpweG90ZGp5TXBt?=
 =?utf-8?B?elhSb2tBQkltVXhvTWVQWlJodFFOTnVJdlFLdXpkOHFoQXZoZ1RRU0ZoWGo2?=
 =?utf-8?B?ZEZjZlE1dDYvSTRYdGtRRjNqVVZpYy9lbWkvY2JteUtsNFI1Mk4rdXBBTUxm?=
 =?utf-8?B?bVd0bTBMMHp0RC9RakVWaTd2dzhGalNUQ1BteE5VQ2tTZ0t0alpIbTQxc1Fo?=
 =?utf-8?B?Y0xURlFpbEU5MkNmNW5rcm1BY1BaQjMwWVkxUUo2TnZ2SnVqVkZ0NHg5bXlW?=
 =?utf-8?B?Q2ZNcGVqKzJWRlBla3JMR2JKMzRRZFJuK1FiZkx4Z1dTR0VQQUxPMjBLbURW?=
 =?utf-8?B?M0JncDdnbFczQmd3b0drWXh1U0F2YS9KSUVWRlN0RU9rY1VKVGV0blRXWk9o?=
 =?utf-8?B?RE9ITGFRTnZPVS9rbzMrYm1SZ3NJdG4wM044WnA5OTcrTmhEME5GSUZpNGpj?=
 =?utf-8?B?a0kvUUl6SlErRER4UDR5Q0lBSlZiakhheVFZOVFXYTF3SXhBMmRCYUFJdlpz?=
 =?utf-8?B?bjFFYWgyVDJKQkFpaUhLZ2UwVHZYbWo5cUVpbnNGK21NMFRaTzFhTDY5aXI5?=
 =?utf-8?B?K0RiYmt4OWVFYWdBNitQZ1h3MnY3MDVuY1VrbTA3Mk9rM2pIb1g5ejZIdFpz?=
 =?utf-8?B?SmFqek4ySDdib0kvMTI3M2lvQ0RDQ01LTHZBUS9McFJ5YjQrY044RE1WaTcw?=
 =?utf-8?B?alpMbTQwWXBSdldrdkZiYmhpbVFQWnZic3ppN1dWaXJ3dkE3OWZadGpBWENY?=
 =?utf-8?B?dFN0azdVRGw5QnNPTVZ5OW9wQ0xqdWFOMVcwcU9zVTV1SzRJNlRzb01nRlpJ?=
 =?utf-8?B?OVd0OC9ObWQxeERjNjZ6ZFArRTBlODJzSkM0aFYzdFI5VlRIY054VjREdTJY?=
 =?utf-8?B?cTJqUWk1ZzE2YU9QWkkxRlZmTDdKT2xWblF1N2RIRWJwTDV6bHFCZDZLSVVS?=
 =?utf-8?B?ZUJ0VVJ3NnlGVDhuUHpPQXRIRC9vRU50V1A1Y04vaW03U3AzbnVEZ0pJZ3N1?=
 =?utf-8?B?QTZjUG8vOGNBNVZhcXI2Zy8xeFRaRHRiRldzZjdLcGFMN0RlTGNQbDN5Z01L?=
 =?utf-8?B?cHErMm5EeVNxVnNVU05aM1J4UGNXcVhHZjc0OHJ4UDQrdFU0K0VtdzFKVGtB?=
 =?utf-8?B?YllhVG5IbkhNbUxDd25VY05YdkF0dXJYNGpXU1pNMGJOYTBQTXVydUx1aVV6?=
 =?utf-8?B?KzdxRlh1UjJOOGxqY0ZGeWdlOWM0S0xDTHZ0VFFlbCtXT25GN3plZTY0aWlI?=
 =?utf-8?B?Si9vbC85Sk8vU1ZSMkc4Q2RadU9RS1FpNDV2dWE2L2FmdUQvQXVUUUpMK1Rz?=
 =?utf-8?B?Q1BkbjRUNitVV2RPSHB6RWdLcVFXeXFzaTZ1Q1p6MjNPTWYzV1M2b3VSb28z?=
 =?utf-8?B?bEQrd3NsT0RkUXZnQWlkcENDUEg1NENlQU5GUEpQY1kvUnVPVll6dVRlVUow?=
 =?utf-8?B?VDJEZUtialdhRXVZTk9kVHY5cnRLRWNaR1huNUR6UVk1VEFxRElDeWJGYTRJ?=
 =?utf-8?B?SHlma210cWJHb0YyMGNqakJPRGFDb2E0VGhKc2pPM0JKa2FXVm54aFB0cWw5?=
 =?utf-8?B?c2E4MTNxTE5iVGFmR080Q0FNTHBNQmJTOE92Y2VQVlpZcCtCVEJFUEo0c1dM?=
 =?utf-8?B?WmRzcmJqOVVteWgvRWErc0paeEhCRUp2Q0JlQUlJM3dpcndRdllKUzFIRWRJ?=
 =?utf-8?B?U2VINTJjU3V4aGJ3M2JaaHZGKzJmaXVVdlpPeHZJYmk3RFFmc0JnUzNTNHNG?=
 =?utf-8?B?UUZZZU9jdnpaNDlFWjBjRGM5cE1GSGVtelYrdVczT0tJUnlFTVI2aUdJbVFR?=
 =?utf-8?B?Z0lRMFVGVkJUQm5ON0tEVGVRZ3FKSTg5TmllUGZiZ2ZlaGhtdWFsMnJYNmM4?=
 =?utf-8?Q?4X+XxbQwqmD6guc8lly9YvwSh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 452feff5-894e-45a8-85bc-08db6bf23d39
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 09:40:35.7882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5bJ3WXMObktU29qP1KGfjgIqTQ2ZqH4CD6QP01Pn16iRqXg6aG8XPRnyyyrUf9/Q2he6LrkrhpmWoOXZKiegQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8241

On 13.06.2023 11:21, Daniel P. Smith wrote:
> On 6/13/23 02:33, Jan Beulich wrote:
>> On 12.06.2023 22:21, Daniel P. Smith wrote:
>>> On 6/12/23 15:44, Daniel P. Smith wrote:
>>>> On 6/12/23 07:46, Jan Beulich wrote:
>>>>> If XSM is disabled, is it really useful to issue the 2nd and 3rd calls
>>>>> if the 1st yielded ENOSYS?
>>>>
>>>> Would you be okay with the calls staying if instead on the first
>>>> invocation of any libxl_flask_* method, flask status was checked and
>>>> stored in a variable that would then be checked by any subsequent calls
>>>> and immediately returned if flask was not enabled?
>>
>> I'm wary of global variables in shared libraries.
>>
> 
> I agree with that sentiment, but I would distinguish global state from a 
> global variable. I would take the approach of,
> 
> static boot is_flask_enabled(void)
> {
>      /* 0 unchecked, 1 checked but disabled, 2 enabled */
>      static int state = 0;
> 
>      if ( state == 0 )
> 	state = check_flask_state(); /* pseudo call for real logic */
> 
>      return (state < 2 ? false : true);
> }
> 
> Then all the libxl_flask_* methods would is_flask_enabled(). This would 
> not expose a global variable that could be manipulated by users of the 
> library.

Well, I certainly did assume the variable wouldn't be widely exposed.
And the library also clearly is far from free of r/w data. But still.

That aspect aside - wouldn't such a basic state determination better
belong in libxc then? (There's far less contents in .data / .bss
there.)

>>> Looking closer I realized there is a slight flaw in the logic here. The
>>> first call is accomplished via an xsm_op call and then assumes that
>>> FLASK is the only XSM that has implemented the xsm hook, xsm_op, and
>>> that the result will be an ENOSYS. If someone decides to implement an
>>> xsm_op hook for any of the existing XSM modules or introduces a new XSM
>>> module that has an xsm_op hook, the return likely would not be ENOSYS. I
>>> have often debated if there should be a way to query which XSM module
>>> was loaded for instances just like this. The question is what mechanism
>>> would be best to do so.
>>
>> Well, this is what results from abusing ENOSYS. The default case of a
>> switch() in a handler shouldn't return that value. Only if the entire
>> hypercall is outright unimplemented, returning ENOSYS is appropriate.
>> In fact I wonder whether dummy.h's xsm_do_xsm_op() is validly doing so,
>> when that function also serves as the fallback for XSM modules
>> choosing to not implement any of the op-s (like SILO does).
> 
> I understand your point, but if ENOSYS (Not Implemented) is not correct, 
> what is the appropriate return value for this module does not support 
> this op?

You almost say it by the wording you chose: EOPNOTSUPP.

>> Since in the specific case here it looks like the intention really is
>> to carry out Flask-specific operations, a means to check for Flask
>> specifically might indeed be appropriate. If not a new sub-op of
>> xsm_op, a new sysctl might be another option.
> 
> I am actually split on whether this should be an sub-op of xsm op or if 
> this should be exposed via hyperfs. I did not consider a sysctl, though 
> I guess an argument could be constructed for it.

Please don't forget that hypfs, unlike sysctl, is an optional thing,
so you can't use it for decision taking (but only for informational
purposes).

Jan

