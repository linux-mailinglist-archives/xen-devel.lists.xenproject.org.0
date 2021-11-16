Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2664530F5
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 12:39:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226255.390919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmwnq-0004tv-VF; Tue, 16 Nov 2021 11:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226255.390919; Tue, 16 Nov 2021 11:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmwnq-0004qY-R8; Tue, 16 Nov 2021 11:39:06 +0000
Received: by outflank-mailman (input) for mailman id 226255;
 Tue, 16 Nov 2021 11:39:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmwnp-0004qS-LQ
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 11:39:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd12b203-46d1-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 12:39:04 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-9ZBpbmrgNTKGwor-3F-P1A-1; Tue, 16 Nov 2021 12:39:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2704.eurprd04.prod.outlook.com (2603:10a6:800:b5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 11:39:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 11:39:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0301CA0027.eurprd03.prod.outlook.com (2603:10a6:206:14::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Tue, 16 Nov 2021 11:39:00 +0000
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
X-Inumbo-ID: cd12b203-46d1-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637062744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zDUnvnA/OLQxNwoMNZRHtzENyDI1FPTVxBzcYIaxMdE=;
	b=M3rlfU8OCvvgN/xoRvs2rs001BPgHxsxfx5w001ZjfcI/lX1zUTTxqO2V7TFgsIdV0hGBT
	K4u3BwqOS2ZWMuP9fuJ8ATo1qCT+swSIDT5NXVncz8znPRBrjUHgzyqiDhq7GNWN85JoWI
	jqtoxqxPk5KDWelUBVQJHa1gcH/QRdw=
X-MC-Unique: 9ZBpbmrgNTKGwor-3F-P1A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIX3+W8W9f7iQF05Oigg6Ufpy/ayG1JevCakwf5VH3NYY2ZGDW2BuxFHNtEdXw3oE5B3ZEPpHEKmH4pvu+pswK3jk+tLNBn+yc9z4VwO1BwQaMWWbs8ulIPg2sPJGlz4Zuwidx9d/pI2GQ12ClbXDSiD2wRN/qyHnnwF4o1JCzMUzCH5Z80KlIoAay6dkY4p3rH9O+6u9Z0nm1bf3T9gG3uVqRwEmYwKkBPSESzJadg7aZB4Pqlrj0jjG6A9qt192nnWxXI+UvBcYix2ISuZtQdZWIJw3aIrm5n07m2p8tXpdDMDz9bj+DHBpdT0Bl991m7BqQgVsMVeK2d7sBfGVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJKE5vr/D4gfhGfldimFjSOhdHdidhHHc1z1RpUaYaY=;
 b=TFN9snr/kSEK4JmqT7SvW73/JezDYPqYG5rB45Y1DfH4LKdgf4sgh0qxQGBuOuEHVnJ2XWgtfHV76PsFKQzuBJGThwmgDTwxaaXFpHqV5MF5uc85KjEWt3lGSX2eoikzR5xH5wYuL6LKFkvnnIigHHq/Qud+nL7w8dv3rDV8Hy/35a+QkTVQqOWzbxLdWF+q8Id4UhLqaCg52hFQ1ZVQwqmEgb2FxRsD434kWjtM4a8NjzEwM7IGJVNAlo6MQ8KvUjDutVQQowpN1FN5ZLbTtRXZm4eEx+w3BJcfSsKBZ2NYg4tXl+PoQbieXFApALL9JYLkvLG0qJOqL2pTfMjMaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b8de7b20-539b-23e7-1ee4-9a777be296a3@suse.com>
Date: Tue, 16 Nov 2021 12:38:59 +0100
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
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <5bd70935-4968-b8d4-4d6c-7ec0fc54ee6a@suse.com>
 <4e12f7de-19cb-bc79-4df0-6fb52538a944@epam.com>
 <5b47cd28-5264-9f24-38a0-e9dec6c2c1b4@suse.com>
 <b87a51d2-cd96-d0ac-8718-7f2b2feed531@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b87a51d2-cd96-d0ac-8718-7f2b2feed531@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0301CA0027.eurprd03.prod.outlook.com
 (2603:10a6:206:14::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a9e2d37-39ab-4c55-77d6-08d9a8f5af4a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2704:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB27044EDC6CD4B0DAD0B5CD7EB3999@VI1PR0402MB2704.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CXJZVNiV4J3NrwWHPz5XaW46dkeIiihxgJQ9lIT0l36BbFC9xKGOPyLtxkg3b944el+Vdljgl0WTe4qDbYujCdfDaE3WOJEIqJ7ZeMus32aw+xnyQdSm5jXN20vLDkDwaxXAtRTFbF5M4b1U1qQJzQyVFIyV2moUpc/amYqtzQPFwMhHCdzuK0gg6ISSEOdWZonh02f4eV8d5z65BQ9Oq8XYtjxAdhomyP2kPUBfBfxqel3yx5i1xbGNwaD6jfYDgvNrx0c97Gv7ySS6NVqq4ZF9hls9WS6rx2V77AfAm7FSBqaRCwyjIkRxYB3XowQubdzsDb782YwHnQZYDywAZCJx6VxHSqTG0FiyNT9eybLn3EWefXqDO+02urLUlH0MwT6jAnFP1YhGmYalE6r0dDgpLoims9ulUpbp6AseK7GEaUxJ1mD+813LLrdTiW3eEzjgf73ZaIC5gOkkh7xk5vlyTn+O2VEYkaxCccGt3GjFlTbiDzJxPEYOG3V5OhbeHUY0+nBRpRwjAf8CL84ibsO29CgTs2uUo0J3cn/i3T2FwqLcJ/4Zhgd0Cl5sduiklw+mO/BdSxrVNZhZX453c0ooAvigLvRkJ082f/klRQiJ1A4tAUKgxN64QqFTn2T4JGscEhkKQkp6ZlWJOywPpCwEoZa/aN/WBvbHmJKUPMM79ifwd/owzNFd2gWC9UeoVTzpaQAlpIRQIDQPehEe+yiL7JE2RbZoNoCVUKLy40bJFmEjrd9K+cfl50RTos4F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(2616005)(5660300002)(86362001)(54906003)(31696002)(8676002)(186003)(31686004)(16576012)(4326008)(26005)(53546011)(2906002)(83380400001)(6916009)(8936002)(66946007)(66476007)(66556008)(956004)(508600001)(38100700002)(6486002)(7416002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X/Oh0QD9kREPN9VN5XlQUmOVza1knaCQdQ2cQbyuqlD4EXRsbB/256tIqt7c?=
 =?us-ascii?Q?uLjfF8gX9esKS2/llIMEVeNZGCehRADl0kIZUGMSTy1Zj8k64wyVrQ554eom?=
 =?us-ascii?Q?h+TFajHphp2Dh8kAVQLXGWXTybLrZNWTPAZFdbzbUcwy5nNOYhBI/fdHmH2E?=
 =?us-ascii?Q?8pSpIFrEmmndbpJOUyFeYBNl1yGv9xyUHK0vFgzJvKw4ZKbM2MdnTrqEuOA4?=
 =?us-ascii?Q?FTj9B5MZQilIgeQltRvqiD9DjQ+LtnTb2PETJCwBVNovoEMvTkfkL7RfY1E1?=
 =?us-ascii?Q?5sonnYzinxBzh2zPYAaDWzlPs/2WzR/lcuUWVkQgMfnss2RnY2HjGgfScukL?=
 =?us-ascii?Q?5cxTBduF6Amhk8M5m2vSSD/XBmnGZ6frncGdH785qYvUPOu/vkA+DrkSwkUQ?=
 =?us-ascii?Q?ljbQ37wf/+OI45IrdsoVFM84s4uLfHmnRkPxp9Do/hNxHyU7qMIntj8oL3/o?=
 =?us-ascii?Q?ffh+BPU3MJEi9u1wIjBnM3a+nFmhRg9wbh1UV3QsIz1VF9p293lQ8OJxwnMJ?=
 =?us-ascii?Q?lHDxrOKTvVVZgYJjxC42AhjGQiAJ+pVZEIgm8Y8c1UeZmJy1dPonaJku8H0P?=
 =?us-ascii?Q?/1OXFwBFs+/igGr0tiQZPrCt5C4lEw44Bgr3YjEDiwbJDzvd5EjH8z4i5FQC?=
 =?us-ascii?Q?O16TXE9ARFzxQwTGnQHtupAS3al3D2hYDSoSW/DSI19PBYbGEyhV3n2xXxNP?=
 =?us-ascii?Q?wWYOgu3NSPhhLseRV8sxBUfzESpVMl29HOY86lKHAEGoQXAeB2c1rKmfhTpO?=
 =?us-ascii?Q?2DWcDSTqbORSok1YRCQOGYW0Lwd4exLIKSPiVVV7HVqKYpB2Bd9qdHF6mgEU?=
 =?us-ascii?Q?vBTaPRrbrocojI39+O1XXH0OJEbffgTEt5Zb9sL8/p3WDwsdLC7iBI+CF3Fg?=
 =?us-ascii?Q?gcl7NUaXWevBWrMmBDGvWcF9TXG+RRDM/Q7HjEpit2b9397xPoOCL8p2gX0q?=
 =?us-ascii?Q?chmV9kQ6WmViaddWSVWWqroC8/enVlcE61L6E6Pk4hFl98KBTHj0j/VXQOr5?=
 =?us-ascii?Q?t7rSImoAUyv3tDazMHUU3vG+bb1EV1/qgqnmrOEQ0aOc6qUrCIGNF/XPxSt6?=
 =?us-ascii?Q?ELS/7fPZzkZ//4zuwgy+DxiEi6qhswfUtu9cLdJ+bE/8wgWzDdp3ena47JlV?=
 =?us-ascii?Q?Ylh7XT0Ew609N9R9RuNYy5/yHulCqrscdOFTPno/OzcGv5Bc8ID4hHDWG72S?=
 =?us-ascii?Q?SNKSS/mEIHzGibXp/w8v2zO6t4BJBm3TNb29zJTPxu2KEB24b5dpaDs7S73u?=
 =?us-ascii?Q?29yyZWMCWILLSVr9vOZjTOj7P7fttCeGc8al7v5rxqLFx9sNoTkMy0uvOFyE?=
 =?us-ascii?Q?skAaiV0QsnpBy/p589In5MO5Aj0CLkRL7v+postvf4f+o2sNzIBcR3vqbFLh?=
 =?us-ascii?Q?xN4HFZ5KVDwqhTrJZS31JghyrHhhXHuHFURjBmwY5tS6vA7/OsnJXmCETr6y?=
 =?us-ascii?Q?ojmvcbvz6csQ+AMq9G+T/P4u4X0mi5YOf+UOddXsorGh7AVmiawa4B6mm764?=
 =?us-ascii?Q?7WkziXNQ2pcgxBun+pmUTT52D8EouWJq5w35pO2SVHX9GdyE7uV+BmS9R/hu?=
 =?us-ascii?Q?0hQBT6/osHRC3vBzJNcXgQytfFtYT5fHp46Dez0pTbvE6DNh5ZiDhVgAjcSO?=
 =?us-ascii?Q?MyShLrR03RKX3mUHX9c7EBQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9e2d37-39ab-4c55-77d6-08d9a8f5af4a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 11:39:01.2482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZNmA2ZB7giUOcW8O/vP3sAwleWmn022dx79rUO4+U+BDLkAL6fFugh+Lf8KDvvA/EOOl5tBbKsvf8sYVM1sS0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2704

On 16.11.2021 09:23, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 16.11.21 10:01, Jan Beulich wrote:
>> On 16.11.2021 08:32, Oleksandr Andrushchenko wrote:
>>> On 15.11.21 18:56, Jan Beulich wrote:
>>>> On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
>>>>> @@ -165,6 +164,18 @@ bool vpci_process_pending(struct vcpu *v)
>>>>>        return false;
>>>>>    }
>>>>>   =20
>>>>> +void vpci_cancel_pending(const struct pci_dev *pdev)
>>>>> +{
>>>>> +    struct vcpu *v =3D current;
>>>>> +
>>>>> +    /* Cancel any pending work now. */
>>>> Doesn't "any" include pending work on all vCPU-s of the guest, not
>>>> just current? Is current even relevant (as in: part of the correct
>>>> domain), considering ...
>>>>
>>>>> --- a/xen/drivers/vpci/vpci.c
>>>>> +++ b/xen/drivers/vpci/vpci.c
>>>>> @@ -51,6 +51,8 @@ void vpci_remove_device(struct pci_dev *pdev)
>>>>>            xfree(r);
>>>>>        }
>>>>>        spin_unlock(&pdev->vpci->lock);
>>>>> +
>>>>> +    vpci_cancel_pending(pdev);
>>>> ... this code path, when coming here from pci_{add,remove}_device()?
>>>>
>>>> I can agree that there's a problem here, but I think you need to
>>>> properly (i.e. in a race free manner) drain pending work.
>>> Yes, the code is inconsistent with this respect. I am thinking about:
>>>
>>> void vpci_cancel_pending(const struct pci_dev *pdev)
>>> {
>>>   =C2=A0=C2=A0=C2=A0 struct domain *d =3D pdev->domain;
>>>   =C2=A0=C2=A0=C2=A0 struct vcpu *v;
>>>
>>>   =C2=A0=C2=A0=C2=A0 /* Cancel any pending work now. */
>>>   =C2=A0=C2=A0=C2=A0 domain_lock(d);
>>>   =C2=A0=C2=A0=C2=A0 for_each_vcpu ( d, v )
>>>   =C2=A0=C2=A0=C2=A0 {
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vcpu_pause(v);
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( v->vpci.mem && v->vpc=
i.pdev =3D=3D pdev)
>> Nit: Same style issue as in the original patch.
> Will fix
>>
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ra=
ngeset_destroy(v->vpci.mem);
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v-=
>vpci.mem =3D NULL;
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vcpu_unpause(v);
>>>   =C2=A0=C2=A0=C2=A0 }
>>>   =C2=A0=C2=A0=C2=A0 domain_unlock(d);
>>> }
>>>
>>> which seems to solve all the concerns. Is this what you mean?
>> Something along these lines. I expect you will want to make use of
>> domain_pause_except_self(),
> Yes, this is what is needed here, thanks. The only question is that
>=20
> int domain_pause_except_self(struct domain *d)
> {
> [snip]
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Avoid racing with other vc=
pus which may want to be pausing us */
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !spin_trylock(&d->hyperc=
all_deadlock_mutex) )
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n -ERESTART;
>=20
> so it is not clear what do we do in case of -ERESTART: do we want to spin=
?
> Otherwise we will leave the job not done effectively not canceling the
> pending work. Any idea other then spinning?

Depends on the call chain you come through. There may need to be some
rearrangements such that you may be able to preempt the enclosing
hypercall.

Jan


