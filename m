Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8934D4A8744
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 16:07:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264894.458170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFdhY-0002Yl-GP; Thu, 03 Feb 2022 15:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264894.458170; Thu, 03 Feb 2022 15:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFdhY-0002Vw-DA; Thu, 03 Feb 2022 15:07:12 +0000
Received: by outflank-mailman (input) for mailman id 264894;
 Thu, 03 Feb 2022 15:07:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFdhW-0002Vq-GP
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 15:07:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f445bd1a-8502-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 16:07:08 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-041bxVe1NdC9uQXjuxxBsw-1; Thu, 03 Feb 2022 16:07:05 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5073.eurprd04.prod.outlook.com (2603:10a6:208:c9::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 15:07:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 15:07:03 +0000
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
X-Inumbo-ID: f445bd1a-8502-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643900827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s3C/ypgbkuE8mfh9iBTm6hEUNLA4imWQI74JH9UEfYY=;
	b=ddDAhu4DcSb3BdnSoO4SC5u9IOr5d8IIzNatS+YkA+vpE05z1g3iXRhOQheMz1F1872JL6
	2JXHwJ7HFDDhT742yxUa4Bsd4howNU6P3gpopbqo4ElPd+Mr2r/wY2qA1jsmfP65YzWCEP
	r2LlTzG+CWXV+xfZZQEX3DzvGZp8e+c=
X-MC-Unique: 041bxVe1NdC9uQXjuxxBsw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oP0jizxOElE1U9WSjjpR3t98t+XQrd5ulTs4mudeGb28xXyA5H5rigw+FMvSBwEqGiUbktqMENQpuDv0gob/ojfQGIIwZ1+P5hsazrTzGChF3UpcZBKB6s5+JYfbYkpEXA/eCDokOhhGk+xOhKVVajOL1MmPcSCBrfjk0bzt0IAwtXUKKQG4sm/uUUY/XuBjvnYuV0FdawwGwfckNpAXkHgkAhyI9zN+Zt3x6pdGkwftyiXl9HbLfiBPBcgynLYlqyRUyyXSw3BwCx+zlY3W+poOMXUwxo6S+nPg9hFZ9Yxfy/qFPwChILlR8KwSkzoC+swEUbkTRX7DBS6DsEL/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Js3txiK8y2wuTcENUZZgLbSeBUUXCipYNEd2R8WFlyQ=;
 b=Mf6qS7vlTX0AFye+EID00BBNstmwXQfSeNKFvCCLFoPBvWfuzsRj8gO2EI83ab9AB819ia3igotb3wRjnfeIgHExB+x9KpIBhfIrtCjSwHLXbjGC6/Ma73Aqyv//mC7zMlQm4ckq8q5o+qStcPB36M2pQDhUadJxBsggFU/wU5t4lEgrv/XrZUCumAjIG+cY2hO311a4ecoQrJsu1eKPkPBZIXE48GU8tSfYLcpoQ098raodq/CpHZIIX0FSNpJ5HEduJlZVCOQaCVZWe4LBi27J9z3P9ojv4D+UxJEQfQS66s+WJM01PFngEUfrHc1B/MIzfhoS+FWoOo7v7DLPIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c20b2017-7313-41bd-c854-48029a5df206@suse.com>
Date: Thu, 3 Feb 2022 16:06:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] xen: Modify domain_crash() to take a print string
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
References: <20220203133829.7913-1-andrew.cooper3@citrix.com>
 <c0d82900-64d1-fe16-9283-deb7c324ff8a@xen.org>
 <ad7467d2-1cae-c8ea-1217-69f0924044d4@citrix.com>
 <348f062c-9aed-0275-f0ad-87a0eff8e986@suse.com>
 <8a28b63b-a5f6-db0f-3108-646475912abd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8a28b63b-a5f6-db0f-3108-646475912abd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0143.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::48) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de1a4178-a968-4de2-ad4c-08d9e726d60f
X-MS-TrafficTypeDiagnostic: AM0PR04MB5073:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB507397FADBBB6DEA146FFF63B3289@AM0PR04MB5073.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UbhleyEENs/1syOyXtM57E/o+Ma11gnhpD0qSiyF6LKXeiAnQ1TKQHx4Jw4ju4yCIll+Rrg2uEQkoR9KHdD94M7xHjR5H6GnA6sOo5n5wo9hmISY1Z47IQ2v5nIrcY8QW5uhXA4Rh+/I7g8s293/geh8ISN9JhsEbobqW3HysJGMhlH7caBpJE+1Adau9GXC226z/Wh1XhOQjpOfq3LnNg3YVo3PC3hp6/SCkgEEje9H7ALwTKxoq6DGatJSjEd+GFxLMjDlOKBAm1PsZDv2NIJIk65s5BR20WXSu5BFG7z43dLxU09UDyvkS66EjkZgesPw7eUmmgDHpri3I7IZ6+sfyi7y8yaldCDIR5wEscxmU+qPFp8pAm6fuW+tnk7osGdyb9R0MWrZcaf5dpRXTSymU6HeGmETTyNAsXnzVQ81JtT1MZxT9LXXrTxr9r+zK1ma+LhQBfFOsU1+UfBsAxsvEaIuTD5ToWmnyJv/KZZHLe+U94CYGZ8ma+lZrC5B45H0nDYj/yMY7rCtu9e2HSHUOHiPIcucjDnUybl+TcWYc7VC1eWDMkzecn8F46NuPWZBStbS0j9UQ/oIdtrICvoDg2MHoqLZzKfHuuuuFoUuGZENS2lI4RCSTrBF+ABDKm1I8Kv+ZXOmdbctMdsMyYd+1O6n2/a4J1VYSMe7vesGledteNFhWVr/yfqdc1T/tASy2I9wGngUgGCn9ctulr4er+R1nIWJ22bo/DoiArM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(31696002)(36756003)(86362001)(6506007)(6512007)(6666004)(53546011)(31686004)(66946007)(66556008)(2616005)(186003)(26005)(38100700002)(83380400001)(4326008)(8676002)(54906003)(6486002)(5660300002)(66476007)(508600001)(8936002)(2906002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UqPK6+Q5iyfoOHWizeaJlM1JoRpBBnXTy/3ehuSmnpLH24tNImgud/4LpVX7?=
 =?us-ascii?Q?UmdcmwtxYAWTqu6C12AEnu25SPJDMXH5fOcefQZBEIeT4SGmRJOasH4BqgAN?=
 =?us-ascii?Q?C1KUru5DuqFpThC3OGj/cagITFzQaw1qabc6etC/ctgn944oel3z71uclhkN?=
 =?us-ascii?Q?1YFwQukKHp1BB9BUP4TiD5vRQgCqN5hFBav12zfQvRKL5uO88TD/ByIvw5Z/?=
 =?us-ascii?Q?Y8KYtG20SmyFnGZCA4mfizs26uVsrwstWi71d9Oo+RL8/XuQ8mh7GXAGgoqh?=
 =?us-ascii?Q?blWDMQZ6lLW3AXMNnSqHp8i0p8aerlGD7hMaY+y7x8sScNpDFnIuTdl+6B2i?=
 =?us-ascii?Q?dyFhJtMTT9WnrhWqbm6fCLBOdbiJmZphZFXa8LRjaIklKzWIhZS+UNmgHWU4?=
 =?us-ascii?Q?JXUETqupeFcIyvaQ9+3uCFeP8Dp5Z9uhVvft0kLUWaMNRLKprYD5pJlrL2Gf?=
 =?us-ascii?Q?X+ypbTNJjO/gb39P5LAnflNOxQqOEykK4pX+wvpIPoPL4C8IL1ddB5zI/1Bk?=
 =?us-ascii?Q?APjn3iH3UK6tU81QIsJwc2Lp3uSk3WrJs807tH7DWnX5MobW8mM40mOMi501?=
 =?us-ascii?Q?xEK8LlK9W8s0pQlPpA3lazQRPJ19rhuabTvh3aSUhBUN3QtaQ0s1bCio+Ze5?=
 =?us-ascii?Q?BHifgfpD5ca8zkPqNgCVrszaC+LtIDswlSxIt7smQGTTkQRq7g4TOeDzo7h9?=
 =?us-ascii?Q?fxCVOH7csBTF/U6UzfXPMCt5pxBeLHKtCbbhBcqV/R+IhJKAbPMACD28E+ej?=
 =?us-ascii?Q?OmHBqfaB5B3ACq124EeYXPzQCm3y0MF5sdj34VPN0XYMsM3YIRVmf0/i10X2?=
 =?us-ascii?Q?IqQGBOLFMD/YCWyashpVoboRbOee8VgTzPWnnQOQiw2PK/0JMca5LDMf9jnH?=
 =?us-ascii?Q?08hVFVW0Bd8++FiNjxd+pkUYxpAOK6AxlX2hDoSOENaFwVDImOoQyI735Ddi?=
 =?us-ascii?Q?uwOdQQJ6GN+oIvGuZaM/VgCLGw0RTlLvYPRCoLZm9cmOiEyMoFvsKdEhaMAZ?=
 =?us-ascii?Q?TZXYTRfXvHJw9bU6D5IL8Ga3vOC4JfnrfdLPiX0xS1kJohUOmDEknSXLHQU6?=
 =?us-ascii?Q?667QFR3/A19A9Jtah6oDVkEbhg1hX9O7sr/Emzt5xKSGPCGoH8aq4vQXIXK6?=
 =?us-ascii?Q?QtUXTU2V9XL/w/ADZArsbNhD2UoVZ0ps6dh8CrtPN1jj0W1IbP9z7A+qZyYf?=
 =?us-ascii?Q?B92pdB6WON3bWlJ56+BddaR4GXfLl8zDo2LDiY+qZhn+w6WlxpOdFPlIviPk?=
 =?us-ascii?Q?mT83biHV3I4zbJXZl1lYvUjdriU9HpCVETkhb2EDg2zlu/E23PTebkCKYVkG?=
 =?us-ascii?Q?RYq9YDQhTTYFACRV8r1gMs+Zb2wF1dDhkb48JJZHCW99TNzRxv7R3J2PyaoE?=
 =?us-ascii?Q?Nfq8j63Sc2afeoZj3e0vcn3Y1Y6MK/3GpHKEBZMsH/BUK9ZvjLWhbmlLQ52l?=
 =?us-ascii?Q?Bnve3swVxmmyO4hJMAbBDfkdyxM1Pdnf1iC306WJqsILMtJBiG7qemg/skv3?=
 =?us-ascii?Q?T8Nk1oZU/jG0e3TZ9qrADIxel+BB09lgxZY0hQbFd95lkUYbvYqSzGiHhGhl?=
 =?us-ascii?Q?+G/fF0WtDVJn98dllWtx6wQ4tm8OwNmzt1wAkRIEi/CvqPr5DqsBfqIFkWc3?=
 =?us-ascii?Q?vLsVekY/R1ATlzB87J01haQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de1a4178-a968-4de2-ad4c-08d9e726d60f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 15:07:03.8417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1cwqwyy8Q7lwOJpMcXFACfq3aCkN23ClbC6iWLbOnJB7jvQmP4j8EvWUHU1gWCXzhEqfXODxmjUO761T5pb8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5073

On 03.02.2022 15:41, Andrew Cooper wrote:
> On 03/02/2022 14:19, Jan Beulich wrote:
>> On 03.02.2022 15:11, Andrew Cooper wrote:
>>> On 03/02/2022 13:48, Julien Grall wrote:
>>>> On 03/02/2022 13:38, Andrew Cooper wrote:
>>>>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>>>>> index 37f78cc4c4c9..38b390d20371 100644
>>>>> --- a/xen/include/xen/sched.h
>>>>> +++ b/xen/include/xen/sched.h
>>>>> @@ -736,10 +736,15 @@ void vcpu_end_shutdown_deferral(struct vcpu *v)=
;
>>>>> =C2=A0=C2=A0 * from any processor.
>>>>> =C2=A0=C2=A0 */
>>>>> =C2=A0 void __domain_crash(struct domain *d);
>>>>> -#define domain_crash(d) do
>>>>> {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> -=C2=A0=C2=A0=C2=A0 printk("domain_crash called from %s:%d\n", __FILE=
__,
>>>>> __LINE__);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> -=C2=A0=C2=A0=C2=A0
>>>>> __domain_crash(d);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> -} while (0)
>>>>> +#define domain_crash(d, ...)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> +=C2=A0=C2=A0=C2=A0 do {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( count_args(__VA_ARGS=
__) =3D=3D 0 )=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
rintk("domain_crash called from %s:%d\n",=C2=A0 \
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __FILE__, __LINE__);=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>>>> I find a bit odd that here you are using a normal printk
>>> That's unmodified from before.=C2=A0 Only reformatted.
>>>
>>>> but...
>>>>
>>>>
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
rintk(XENLOG_G_ERR __VA_ARGS__);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
>>>> here it is XENLOG_G_ERR. In fact, isn't it ratelimited? If so,
>>>> wouldn't it be better to only use XENLOG_ERR so they can always be
>>>> seen? (A domain shouldn't be able to abuse it).
>>> Perhaps.=C2=A0 I suppose it is more important information than pretty m=
uch
>>> anything else about the guest.
>> Indeed, but then - is this really an error in all cases?
>=20
> Yes.=C2=A0 It is always a fatal event for the VM.

Which may or may not be Xen's fault. If the guest put itself in a bad
state, I don't see why we shouldn't consider such just a warning. IOW
I continue to think a log level, if so wanted, should be supplied by
the user of the macro.

Jan


