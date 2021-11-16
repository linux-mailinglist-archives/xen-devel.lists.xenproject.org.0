Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C359E4533CF
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 15:11:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226294.390996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzBI-0005yv-LC; Tue, 16 Nov 2021 14:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226294.390996; Tue, 16 Nov 2021 14:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmzBI-0005wx-Hv; Tue, 16 Nov 2021 14:11:28 +0000
Received: by outflank-mailman (input) for mailman id 226294;
 Tue, 16 Nov 2021 14:11:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmzBG-0005wr-Tb
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 14:11:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1594e1ec-46e7-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 15:11:25 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-c75ujLwKPH2usVR7foo2OA-1; Tue, 16 Nov 2021 15:11:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5597.eurprd04.prod.outlook.com (2603:10a6:803:dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 14:11:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 14:11:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0106.eurprd06.prod.outlook.com (2603:10a6:20b:465::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 16 Nov 2021 14:11:21 +0000
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
X-Inumbo-ID: 1594e1ec-46e7-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637071885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nXjbxyuGL5su5L7XLMGZBQbFLqKq/1hM956UTIhpvOs=;
	b=gKjEEbtwCN/SxX2DHIsegMeh4aAkh2rsKrsplEc+aWyyBH+i5jUHIPFRMSRCENPiDtXP59
	DW9OpU1VQrnqTjaMUkIIFzSTiILexXqYfxDjvRlAct4YpuN4N3gHPVpeMVy3U6Y9cJSQvX
	JhnH3u8ChhLyh42Kfxpmspson8DsjIo=
X-MC-Unique: c75ujLwKPH2usVR7foo2OA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCP2glo0ZcHQchWwX73zbh7LLvUo65zwfTPi6Jez+2H1HwVz6+3b3kkFkHzEsZuI7K4MIo6sM6wk/KJXNgZLaWHbQmpchiGv/dqNLhQtBk9HgopPv8S4Id++F4mvrV0uD8W04djzYSAh6XKp8niNMifB/nQREYBfrsQowmFIK8qWgeeffKkp/9R4wXgEOmc6AhHqK5nqqPQRl5FaDFl0t2jP8MQd4L3XtYJ+QMLipH7soe9AQnfNFetoQLDLZ6RxYdIs4JWXVFKnXQjSGw/vdkjRgz6Yjc0imGwu61lYVs7kCbS5FUSTLUqIH0sjqxGJgmGf+zvy1vcSSti2IBCs9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDUdK1qoypFEv2Du/ypnRw1OL3dipyoJSLoQIStcT+Y=;
 b=P4GaRyhrYIiIR9I2ZvtHcsJL538LVtVCaocyRQtzPk3S39Mi7d2kDhQ5VGuZC7NhvZoZS88lsIRazx7Ur4YKPxePvoRwmZHxmThOOjnRlAKp3RfIMiD5KKhiRWmc8oP1wZ0tQdSdwc1lGsEdKr3FeGtOuO672SbSS6wTAUkJHnWr32FluCKETx4z+4k1KH167tUm6ODi4fbPbNIElLu9pSqr5qsADL8sV9etXdL4N8ot4eH9oircAJNtcB6HLygL+IBkp5BXWErWq2TfJmeE6VUjYuwJSAELLNH/VebG3873RokEql7w4TSCjrla6nB0ofVwAe39MZi8HNmaTCnozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9bb04d32-e2c7-e67b-4f76-d396e67a2e30@suse.com>
Date: Tue, 16 Nov 2021 15:11:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <5bd70935-4968-b8d4-4d6c-7ec0fc54ee6a@suse.com>
 <4e12f7de-19cb-bc79-4df0-6fb52538a944@epam.com>
 <5b47cd28-5264-9f24-38a0-e9dec6c2c1b4@suse.com>
 <b87a51d2-cd96-d0ac-8718-7f2b2feed531@epam.com>
 <b8de7b20-539b-23e7-1ee4-9a777be296a3@suse.com>
 <cc7fb79b-5a43-3bdc-4621-097a01982f49@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cc7fb79b-5a43-3bdc-4621-097a01982f49@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0106.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4c51186-b482-4d90-ba18-08d9a90af78a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5597:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5597E744AB2912CDB636EF39B3999@VI1PR04MB5597.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NsUIz1XWA+M2UsTcSQlKhWhZ3lI/dw+HHqpuXbVywexW6UkrqrMQ45M4zt8IHD5VBfknCGiEJrlilJMdLfWdL1O3dZ762j77rioYayhyyDX3+qOhJWlD5jdobWuLOdCkzFDm0qAQTXCSZy/vkoezHCUc4TKRgmJhl8XuQZFfCs1KNdIbGwkrEItnJl0xlFqOGGy4gWNnqEPk8VG23ou36ixygV2YB83jqC08fRTbZNZjAD0VupZAMY8LY9CjErT8Wihm+FSHAL08pwlvuwo+11pFlB+Rhn1biXQRZKwMgcAeBjLr0sN7eCLnSF7nvihkq3oGL3/BMvZjIaCtYeVCmydvkWpNLXuX99MpUBBWG2+BRkEHE0dQJYk/vXOSvn0QiLqwlZAFUFemgtsQGLcBkZbpkPWvmmD72SSLspfeMirZVyeaxdIZIU2+IntIe5+4EjNKokatAVE1bIpvzp/DSsxm+SVVbkfOJTE+E4ZjVVeksZRC+uflQxvi3zoXnELDDKk30cMLVjChXrl0rDE5EAzYW+vWjlYsijrWZbYq4JQ9WmENvxVsD+R5GXdm9kMQmqhGoTmwW3Xwk7iyhw5Co0WLDeFXQdDIiJPsyqXnNmTaIefABqU70ksWQpBTKMsE2JIAteLmrqrpUyWKBQcfR+2HmeKU3hNzGQbcjYyw+5CANShQdCW0Tc4w2JuWFjNDvKlNSnPA6TBqQhGZdPWlSPsHO40Bxeb7E4gIu9Uw440=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(2906002)(16576012)(54906003)(31686004)(316002)(956004)(6916009)(36756003)(8936002)(4326008)(86362001)(186003)(66946007)(2616005)(66476007)(6486002)(66556008)(7416002)(26005)(508600001)(31696002)(38100700002)(83380400001)(5660300002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I1DCIeUBdnYSXS0HQ8Av+U65a6Q3zyFnHwVvBDVmqQ94z8yyY8l4mPZKUQyT?=
 =?us-ascii?Q?J9NN9T/Y7RyIAR2VHwnCuFd9kDA7iSrSwi1e8/D8R5b2k2mIUIA/kUm3gPsc?=
 =?us-ascii?Q?eJtK5zl84grg2innS9dHx30ENH3qaEdDZF9cJM4ADYdnum6ekPisHsGM1oaQ?=
 =?us-ascii?Q?IQ4ZxtoMcdS+pEYB6xdNDkzFWNLB3HTONeltoO4JRVR9BnDhGWVBWk3TkOdG?=
 =?us-ascii?Q?mTdGHLzKGqUs511gBcxgkSO75tzN8MDJAW0Zc5BKyvUbyAtMKPFalPbY9+K7?=
 =?us-ascii?Q?aP9VvJ5teyKe1BeCxv25xBEVQeWFWnQ+rhla/eWa8bAZh7deyYbC1nCo2pLS?=
 =?us-ascii?Q?jcN+Mousi1gVCDCRKsIJ8l0Hg6bryJCHo6oKY/mmHWgOwf4IGxm9fSl1awrf?=
 =?us-ascii?Q?T5PWhGtZEatZaD+KkRC/dM6lb8nTo7MeIko0tHAdnQCR5/0DIp2C6NpAbzf4?=
 =?us-ascii?Q?jt/dGF1+Q8FVma9xkeZZ+S+eteK7mYqAsYSqMu0WDBmH5tbyg6oUOckWxBhO?=
 =?us-ascii?Q?VCGS+AWuzYL8DTvApB0HlhPkS63avbRQ20EkhKxh1vKB0FAVt/X7ddeemHt0?=
 =?us-ascii?Q?erC/8Xt+Y6Z1LMq9rCYMAqojOoe5WEapPTPTB/GUWsnWIKEW9m7Iqp9fJt/j?=
 =?us-ascii?Q?rxsRfCgumEZAkgSvS6Ue7EaxFsAG8qu/UPLY5UFdCu/vl82JquzRDZuOWhb7?=
 =?us-ascii?Q?SoSIGt15+g0GO5HVN6F+qnXlQXuVueeIQuuJ5g0U5Mu+MWceog23N+Tex5Rb?=
 =?us-ascii?Q?hMzzYIWYgZ2ssav2hH84akFqH/tuDdcwoin+N0CfF1ng7AJg2cIxbYdMfM5U?=
 =?us-ascii?Q?BD8NBKCwckl7l/KrKYcboVju9axFb6zkNr8ri1g1Jqd4X5kdD7vfB1KBCE+B?=
 =?us-ascii?Q?ZZHeyHHi59FSlZbeL0I8Lg6Nm2zw41DG1RfSt7ZXMj/voXxmI/BeaxtbdxjJ?=
 =?us-ascii?Q?gL9SpV0fkWRqXFE/d3ILHNt/gQhAlJ5Q4eJuV1TeJWerIAOx83D7PPpF9Qvi?=
 =?us-ascii?Q?Dmcnb1U2Aw0wKj2CtjQDPwOxRqeg175YbYIjOcDJUumsMoWEdWGWXzxBIsWF?=
 =?us-ascii?Q?0no24fzVbBDgGbzF7ln5/GEXU6qzPvfvlSLDlfMihu8CY1LzXboVlwCTQSJr?=
 =?us-ascii?Q?IPUP7YZMizGIpRh4ap3+1G5AEbBcJgVzwSvM5hPr9SfAFeaHKVhwoMJELUri?=
 =?us-ascii?Q?+C4dydT+cHMw1iZvVq7G7RzLrRMSUZl1dZcrvbBOXAmKNVqkA9VX+e0XiJW8?=
 =?us-ascii?Q?fuyKOhUKociWoGBVKQZ64Hw/x0hTKXCeQZc3WWlqFDsv1v7WX8zBc0ao1dJ/?=
 =?us-ascii?Q?uMTuigsyeTZU3f+UrmV+zowM7/mMsW15zVJj1SJVczL2YXZzORNonpmE5/eR?=
 =?us-ascii?Q?KS/MFncxispU5tTw0H18kvK7ckXAUKKnDZfFIWyWB1U8zG2FXrLtzqJblreu?=
 =?us-ascii?Q?maPPkG4jG7Qwk9hAPK2R1leJTZ5HHtB6xa/Go4JhNRlHTWEbBLz1zSXSE3+2?=
 =?us-ascii?Q?nc0dBaD5anMyJRY6hRK7rPunrSGV1V+swCHm61VosPStWg3NymzuZ0rRnyq6?=
 =?us-ascii?Q?GLC+z+M+xPbd0J+k4YcdCNCAX13MJF8sqpc/snwULNYBteNYLeXa/nq8Ao3p?=
 =?us-ascii?Q?nx8oHxsgfWg+xK+xkbyjFh4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c51186-b482-4d90-ba18-08d9a90af78a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 14:11:21.8496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qSNOfneNzA+voGD9+lYQXWNeZor9Eoak2SVACsCLvd8MvoQq3IBJrzXUf5RIHj9IToYdN5Z+BS+BET3bJWScUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5597

On 16.11.2021 14:27, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 16.11.21 13:38, Jan Beulich wrote:
>> On 16.11.2021 09:23, Oleksandr Andrushchenko wrote:
>>>
>>> On 16.11.21 10:01, Jan Beulich wrote:
>>>> On 16.11.2021 08:32, Oleksandr Andrushchenko wrote:
>>>>> On 15.11.21 18:56, Jan Beulich wrote:
>>>>>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>>>>>> @@ -165,6 +164,18 @@ bool vpci_process_pending(struct vcpu *v)
>>>>>>>         return false;
>>>>>>>     }
>>>>>>>    =20
>>>>>>> +void vpci_cancel_pending(const struct pci_dev *pdev)
>>>>>>> +{
>>>>>>> +    struct vcpu *v =3D current;
>>>>>>> +
>>>>>>> +    /* Cancel any pending work now. */
>>>>>> Doesn't "any" include pending work on all vCPU-s of the guest, not
>>>>>> just current? Is current even relevant (as in: part of the correct
>>>>>> domain), considering ...
>>>>>>
>>>>>>> --- a/xen/drivers/vpci/vpci.c
>>>>>>> +++ b/xen/drivers/vpci/vpci.c
>>>>>>> @@ -51,6 +51,8 @@ void vpci_remove_device(struct pci_dev *pdev)
>>>>>>>             xfree(r);
>>>>>>>         }
>>>>>>>         spin_unlock(&pdev->vpci->lock);
>>>>>>> +
>>>>>>> +    vpci_cancel_pending(pdev);
>>>>>> ... this code path, when coming here from pci_{add,remove}_device()?
>>>>>>
>>>>>> I can agree that there's a problem here, but I think you need to
>>>>>> properly (i.e. in a race free manner) drain pending work.
>>>>> Yes, the code is inconsistent with this respect. I am thinking about:
>>>>>
>>>>> void vpci_cancel_pending(const struct pci_dev *pdev)
>>>>> {
>>>>>    =C2=A0=C2=A0=C2=A0 struct domain *d =3D pdev->domain;
>>>>>    =C2=A0=C2=A0=C2=A0 struct vcpu *v;
>>>>>
>>>>>    =C2=A0=C2=A0=C2=A0 /* Cancel any pending work now. */
>>>>>    =C2=A0=C2=A0=C2=A0 domain_lock(d);
>>>>>    =C2=A0=C2=A0=C2=A0 for_each_vcpu ( d, v )
>>>>>    =C2=A0=C2=A0=C2=A0 {
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vcpu_pause(v);
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( v->vpci.mem && v->=
vpci.pdev =3D=3D pdev)
>>>> Nit: Same style issue as in the original patch.
>>> Will fix
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 rangeset_destroy(v->vpci.mem);
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 v->vpci.mem =3D NULL;
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vcpu_unpause(v);
>>>>>    =C2=A0=C2=A0=C2=A0 }
>>>>>    =C2=A0=C2=A0=C2=A0 domain_unlock(d);
>>>>> }
>>>>>
>>>>> which seems to solve all the concerns. Is this what you mean?
>>>> Something along these lines. I expect you will want to make use of
>>>> domain_pause_except_self(),
>>> Yes, this is what is needed here, thanks. The only question is that
>>>
>>> int domain_pause_except_self(struct domain *d)
>>> {
>>> [snip]
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Avoid racing with other=
 vcpus which may want to be pausing us */
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !spin_trylock(&d->hyp=
ercall_deadlock_mutex) )
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn -ERESTART;
>>>
>>> so it is not clear what do we do in case of -ERESTART: do we want to sp=
in?
>>> Otherwise we will leave the job not done effectively not canceling the
>>> pending work. Any idea other then spinning?
>> Depends on the call chain you come through. There may need to be some
>> rearrangements such that you may be able to preempt the enclosing
>> hypercall.
> Well, there are three places which may lead to the pending work
> needs to be canceled:
>=20
> MMIO trap -> vpci_write -> vpci_cmd_write -> modify_bars -> vpci_cancel_p=
ending (on modify_bars fail path)
>=20
> PHYSDEVOP_pci_device_add -> pci_add_device (error path) -> vpci_remove_de=
vice -> vpci_cancel_pending
>=20
> PHYSDEVOP_pci_device_remove -> pci_remove_device -> vpci_remove_device ->=
 vpci_cancel_pending
>=20
> So, taking into account the MMIO path, I think about the below code
>=20
>  =C2=A0=C2=A0=C2=A0 /*
>  =C2=A0=C2=A0=C2=A0=C2=A0 * Cancel any pending work now.
>  =C2=A0=C2=A0=C2=A0=C2=A0 *
>  =C2=A0=C2=A0=C2=A0=C2=A0 * FIXME: this can be called from an MMIO trap h=
andler's error
>  =C2=A0=C2=A0=C2=A0=C2=A0 * path, so we cannot just return an error code =
here, so upper
>  =C2=A0=C2=A0=C2=A0=C2=A0 * layers can handle it. The best we can do is t=
o still try
>  =C2=A0=C2=A0=C2=A0=C2=A0 * removing the range sets.
>  =C2=A0=C2=A0=C2=A0=C2=A0 */

The MMIO trap path should simply exit to the guest to have the insn
retried. With the vPCI removal a subsequent emulation attempt will
no longer be able to resolve the address to BDF, and hence do
whatever it would do for an attempted access to config space not
belonging to any device.

For the two physdevops it may not be possible to preempt the
hypercalls without further code adjustments.

Jan

>  =C2=A0=C2=A0=C2=A0 while ( (rc =3D domain_pause_except_self(d)) =3D=3D -=
ERESTART )
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_relax();
>=20
>  =C2=A0=C2=A0=C2=A0 if ( rc )
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk(XENLOG_G_ERR
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "Failed to pause vCPUs while canceling vPCI map/unmap for %pp =
%pd: %d\n",
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 &pdev->sbdf, pdev->domain, rc);
>=20
> I am not sure how to handle this otherwise
> @Roger, do you see any other good way?
>>
>> Jan
>>
> Thank you,
> Oleksandr
>=20


