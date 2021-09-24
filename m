Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D531417072
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 12:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195289.347926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTill-0006RN-7x; Fri, 24 Sep 2021 10:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195289.347926; Fri, 24 Sep 2021 10:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTill-0006On-4I; Fri, 24 Sep 2021 10:49:29 +0000
Received: by outflank-mailman (input) for mailman id 195289;
 Fri, 24 Sep 2021 10:49:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTilj-0006OO-8g
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 10:49:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb26324d-7afb-4c28-987c-3d1365314a4b;
 Fri, 24 Sep 2021 10:49:26 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-RAtbxrpTOZShSo288wCwsg-1; Fri, 24 Sep 2021 12:49:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4350.eurprd04.prod.outlook.com (2603:10a6:803:3e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 24 Sep
 2021 10:49:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 10:49:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0025.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Fri, 24 Sep 2021 10:49:23 +0000
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
X-Inumbo-ID: fb26324d-7afb-4c28-987c-3d1365314a4b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632480565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1q3puiliYdZoVqJouatsAVDuwCBWPLUfp26THS3CwNw=;
	b=ZtE6pLIV49NWSJjjKNqv4dfKPcsPD5c6+T3RbP90BmLuTsLaEsmCi8Ctk6BWjkkDovSFb3
	woM/4qo034Tvs0Mnl38RbNxou4MNgP/ojej02BEQ/9gG5tXYjdDXwdr36Iy9jmd9wFXiZH
	YtF14ennXui0GvcyXRd+k2RNx1b2sQU=
X-MC-Unique: RAtbxrpTOZShSo288wCwsg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZD7ROh4zTHI5cwZjHKVwArR1L+UIRyJ8XJNwdm5KHvz4dXTN9bKU0Ns9qfmqnVj4LY24KI+yKKjZMfTRj36vN37upAK2NAvL4V4aWedKHPKFdaIqR0Py33LWO2WWtuM8Phw8pwsaCYrj4JudujB2ngY/4hoW0i/G3D6UZ35JgpsWC5gMx2PdP9teyo2GW87WEqTskX28AKa7n9Ez42K6NB4WFCkoL8qFpizRImg85C5ZSJ2wvOBkzHVdT0iNRwEgdLhpvoIONvcE3iJDOGvHrW08bP/9bpFcSFOeACTdrKjg+XqjoB7cMupRr9wa5qnFE5BJkW35mwjAZXGohLpDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=pLRBaqlOdRpvHdVYmUYhZb1e4XBqWWZzrnIW7aIUZMI=;
 b=ZNUmKxkArVJWMp1wYfnDc2RVNI4T2GE35j0ZdeSEDP6oQ6bxh4SQaNLAqX7pdXluLX8gfPRWpY8uScvIkH3yamTtPgZqF7BD7qx8wWKoEt/Cg1QvEiXjtIH5O7cckAAOcS8V7NVmmtkoHzrW+QGHtI9L8W7lJEODfwE10LaNmt0w4+5wXwqXn5Ap+8nv7/ZlbFumcYePGZ/cyAhELFPv8OYp4n2XAOI5/qthGIG3IE88annifiYAOHkiJUdVYah9IebBsjsT9HhrJQRJL+vA/SWBA6cKQuaJ9wf5T+kauDeSQupRlB53dos8shZyNjo8vi3d4yrIUD9W0TVxflOKUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
To: Wei Chen <Wei.Chen@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-21-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231811420.17979@sstabellini-ThinkPad-T480s>
 <PAXPR08MB68640027443F267495804A529EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
 <b4433faf-bb70-d083-126c-0224da3d9a82@suse.com>
 <DB9PR08MB685742B691E39FD3161BFE289EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a295cc34-9cc0-468b-c85a-2e5d1238d9a3@suse.com>
Date: Fri, 24 Sep 2021 12:49:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <DB9PR08MB685742B691E39FD3161BFE289EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=gbk
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11c3c23c-a282-4bfa-7b0d-08d97f48f899
X-MS-TrafficTypeDiagnostic: VI1PR04MB4350:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB435083335944CA2FA629699CB3A49@VI1PR04MB4350.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oE9z13yfAeEWfKOFJ1wYufROMKSRduIrKt1VbS/3DxX8zRf+9AYSGWvVvpG9ILf15U2Wal9KPKRmFzYE5LWpJTl7UNLa7FlDF53H3UcDWIr372l9dpck5fH3n98k21zrVp6TGIjtjYumYqlz5QpoA1wpPlkE6pQHKqoGeL0k/emWrlOpagfbtze7ZgCc/5hIEsZo/yWgdfFA/Df/PVlJuA28MTVJVTIzaX9MjUV8HkoxkSf1WWevylGTbfR3Cwo36opiAy7w7ruXwTSeIfBcfjI5PD+JVzdxl5s66rjwmgSUpFO+Cu7R17lHc8vQcdAJwWJsJC5NbS0nQmhsVv4Zxlhb2AzuKXR7Y48v1e+1OCdSz74n9rThXTozN9TKrMG5i5sdL9a3M8LouxFC9UYx7QNGtKOSpwtmoZEgiqrBtgzkoSJ9X8PARZcHZYALEldu82u2t/kvnCVkcCzrMc4C7jqmHov6tUh8rQDL0m2WIA2kJPeyWBXi7+7fDDUUYVA4H3LmeQpzInqCMjZu6FVyZ+8dQTyX2NqRvZuvMPYeYfjcihTPIf9EdDbxpYoOTk9JQYsyxaRv7g40+7x9zDKpLgoFJS9991PDnGUA/m1R6/rcZ2/ySwBHw7VLe60Ztkj7FJOCzM+fzfZjozb30EXmaxFfH0200yPfCWdNmGaUoaGtcHgNCIprjDylyugLvDOfj4OKgHZnA2zydbItph6XEtwwUfXoni70TXdwJf/oAcM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(83380400001)(38100700002)(66946007)(186003)(8676002)(8936002)(6486002)(53546011)(66476007)(2616005)(31696002)(16576012)(66556008)(6916009)(54906003)(36756003)(31686004)(86362001)(5660300002)(316002)(508600001)(2906002)(4326008)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fiO9HKP0S0n4Zk/bZNnKfJS2jz+fwuksxxx92RH6LfoOs2PDW99hbW08z9Z8?=
 =?us-ascii?Q?2PLN4RCIkI22mFSheZzzVUJ4cLXHfi1BjCWe4AsO3VfqYNNUt0P9ZnSuztwt?=
 =?us-ascii?Q?KucbiPpqIADlbK/jKt2SF+ju4vA5gq8oUMas+fZLrPz5c7c1nfUgDgFwnTdr?=
 =?us-ascii?Q?/+umsaekBIrgmkxsl4OCYIkUdAH9EkV6aBvjliOYALrd7WCCvCqciRQ8dY+l?=
 =?us-ascii?Q?7pN2FrbcaHpJxTH8GtAzMiseRfxEBKK1Z7MCJDjI08qnZP6yiSr2ZltT7ZBp?=
 =?us-ascii?Q?dgaiFrvY3rCFIToYuB3A17Zfc+u/9YzBHT/3MNyqDRtLCOpL7TdMly7hbzgA?=
 =?us-ascii?Q?9MZMsT3RxB/W/wnllW3w40I1ZitHjtacsfC8P3zUEUK29YpuRNIqG4dk1X+l?=
 =?us-ascii?Q?bnDw/JS3RHAjjWlEw2guB0sLU1FuBrTalQv+FviKHMLKM/BuJ4s59Z57iHKL?=
 =?us-ascii?Q?wopUGCWG8muQmu+AAbJfUxvoGkQnAzpp5PU6dnO1xzpLfMh5i0VQ1b9T1X6x?=
 =?us-ascii?Q?QJMrRhklYLVZVCP/2PYVD1EjQt1+EsKHHgNtK1AmweNiDZ5dTHgrB3GDCZP8?=
 =?us-ascii?Q?XRSpmqrRlPYNTHezjDZ3nRrL99xyoXRvQLeYo9ILVhU9rsZ4RQTSUMx4xnwf?=
 =?us-ascii?Q?pyX+McL19MpxnvYzXkDltudVu+08+bMYlVad/IunHNKjJzoWIe0qmqWR8zVb?=
 =?us-ascii?Q?sCP23NdTi3i9nIx5P1FkFy/4TVMshAl7pZQA21TGJaH/Q2Ie1XXpDdLHEgIK?=
 =?us-ascii?Q?RzhG8jBwCg1JMj2WxNhShZBBI5RXRZnLw67eggC7uKGGlRshTeMv03d/JZgc?=
 =?us-ascii?Q?P286XlE8wsIRTw0/S8SfCKzcFErmgeOMNKnzv33Rpsl7eTHTE1nRqq4PrkFl?=
 =?us-ascii?Q?tFkG7K9v3cHnwqR7GBY/cOfTU3vhHiWfB3/3O3uSPoHP3hBKdpQH5TPtDWlm?=
 =?us-ascii?Q?31qWi+dJd4Q2Zvpr/IW037cKUBfM6mGHLL3A1DBmv1pIpGSUGuVLfYx4QSdj?=
 =?us-ascii?Q?15lj/y3IiGZPi+on5oUhbG2aC/c86+kmUST9iTdFcgDNcG3OzGNFDitHBYaY?=
 =?us-ascii?Q?XMkOoAZoHoqK0CfFVCZOo0E8NUanJjN0RIHOQhAvf9oumWewiAOdfEDELtql?=
 =?us-ascii?Q?SSRggymPzz5wBBzAZlvGOvvIfn0e9QijG3zOwf8lDXEYdNhOKLwXuRZmqzAI?=
 =?us-ascii?Q?xj5Rspn4AMt8h/2oxBCz/CjSujNxeRhsDDq4325d88pu3Rs2KCWGnFcaN3Zl?=
 =?us-ascii?Q?XZrcZDtgwcT6FZVf6fiPKc+r+tgzDYO1QyEUUVRrxWIzLEFUwXFzHyJcSFIb?=
 =?us-ascii?Q?JE1aCKlxHEqXCo9aFIZF6yxZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c3c23c-a282-4bfa-7b0d-08d97f48f899
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 10:49:23.5896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/3+Zb1kzN6Vu0AL+UlQCPlmQXIwrUBuCJ8fZOAN/ZPd7T57obtngg7La42TdPXT0lQ91gpZh6CPQ9p5akO1rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4350

On 24.09.2021 12:31, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2021=C4=EA9=D4=C224=C8=D5 15:59
>>
>> On 24.09.2021 06:34, Wei Chen wrote:
>>>> From: Stefano Stabellini <sstabellini@kernel.org>
>>>> Sent: 2021=C4=EA9=D4=C224=C8=D5 9:15
>>>>
>>>> On Thu, 23 Sep 2021, Wei Chen wrote:
>>>>> --- a/xen/common/Kconfig
>>>>> +++ b/xen/common/Kconfig
>>>>> @@ -11,6 +11,16 @@ config COMPAT
>>>>>  config CORE_PARKING
>>>>>  	bool
>>>>>
>>>>> +config EFI
>>>>> +	bool
>>>>
>>>> Without the title the option is not user-selectable (or de-selectable)=
.
>>>> So the help message below can never be seen.
>>>>
>>>> Either add a title, e.g.:
>>>>
>>>> bool "EFI support"
>>>>
>>>> Or fully make the option a silent option by removing the help text.
>>>
>>> OK, in current Xen code, EFI is unconditionally compiled. Before
>>> we change related code, I prefer to remove the help text.
>>
>> But that's not true: At least on x86 EFI gets compiled depending on
>> tool chain capabilities. Ultimately we may indeed want a user
>> selectable option here, but until then I'm afraid having this option
>> at all may be misleading on x86.
>>
>=20
> I check the build scripts, yes, you're right. For x86, EFI is not a
> selectable option in Kconfig. I agree with you, we can't use Kconfig
> system to decide to enable EFI build for x86 or not.
>=20
> So how about we just use this EFI option for Arm only? Because on Arm,
> we do not have such toolchain dependency.

To be honest - don't know. That's because I don't know what you want
to use the option for subsequently.

Jan


