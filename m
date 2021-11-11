Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2253C44D583
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 12:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224708.388165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml7up-0002xO-75; Thu, 11 Nov 2021 11:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224708.388165; Thu, 11 Nov 2021 11:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml7up-0002ud-36; Thu, 11 Nov 2021 11:06:47 +0000
Received: by outflank-mailman (input) for mailman id 224708;
 Thu, 11 Nov 2021 11:06:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3rQ9=P6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ml7un-0002uX-OL
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 11:06:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74cdc47d-42df-11ec-a9d2-d9f7a1cc8784;
 Thu, 11 Nov 2021 12:06:44 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-O2MAfqgYM2CAH6pusFexbw-1; Thu, 11 Nov 2021 12:06:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.14; Thu, 11 Nov
 2021 11:06:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 11:06:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0069.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Thu, 11 Nov 2021 11:06:42 +0000
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
X-Inumbo-ID: 74cdc47d-42df-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636628804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vg4+imPtdyruaUQzxazzRtq4KhbbGz5grgP2TSvOBDU=;
	b=SzGzPrx/npLML8/NwHcKjoKl2zQXihrQzcRSSk19hY0SrFdvWgVeDuFbKh0VPH06fjTDM9
	uLYiCexpqxAv6w1MzM3hGZyUMWpXHYL7Fhk4KCKwcxg9D23VERjB9OJGyJlQSy5YVtOwgN
	ypx/bfSIB4bnI0TtIEefxwA8SPQp78k=
X-MC-Unique: O2MAfqgYM2CAH6pusFexbw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKfl8SJVfhNshRskJZvrXwk2Ubpc7Sf9SsnGA/fHNDuYpsqjSoR2eBMYRkitdthiFbr0usgb9uO9Fn52a4HyqqI8AiU2diIkUrd73BCjrVY1oqtQy2pFyjMH4fYamwx/gpIjo/x+txIvAIbsvq9yDGJTYHbLWzXAk2bnvQOJBadff45kRkwR+D7XmDWRw2yWfnFkIeUX9Bkp2oftligvzXpDfHp1wcak42GsEwGUaTEDAHxgLLC34qYRT90sm+MnecTA5y9XJ45Egm65P1LwuiP+XJz6trWI5MnLu+1bje3Fg+C849CCFcjLgeqmvTFBe/HUqrgKRa7z6bs+V/FjEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lf72snFv18W+agWakeUdA65Tpb3lkqN7PO1TtJF4EYw=;
 b=JOkCwmpvL8nyx/edydr7ilC1JezDoFuCRpPtgdtTy3ZK7jTsHNGDJGEyVxdDpa7K57H2Q8cTdIbAAcA1lynUaPgO7r2dOJXmw3LR8L9tULdn36nMOtwMGWG5hpi8xJH1pIFHIoEx3+hhCRsKrhNpCEi4W5/toRk9LB9XQq5TS5KmX2/WuH8Yli59Iclm2tDx1oicvdaY3kw207LjfHpH4Q0dOTg2p/Ad8qTABMmMq+ML9Zrrht+dTLKpxyWC7UD60nJPXlArCOtxw19ry1tFuYIcat3EeFFKHSxrN6volvXtgeZJxnOpOXKtVTDu6FuE1IIaI7P3e9fi8I96ZtWb/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2d16eb78-4438-924e-f873-114849dbc8de@suse.com>
Date: Thu, 11 Nov 2021 12:06:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] xen/cpufreq: Reset policy after enabling/disabling turbo
 status
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Jane Malalane <jane.malalane@citrix.com>
References: <20211110091935.16906-1-jane.malalane@citrix.com>
 <YYu9eYxIYs5gol5q@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YYu9eYxIYs5gol5q@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0069.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1914cbcf-394f-43e7-67c0-08d9a50357ba
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB419193460A3F7BC08B176232B3949@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NVbwaH5Ujq2LYepswG/xkrqgZ9vvYuNg+/xCfO3/S2STasuuWOjUenzl9cEuoLVG+NX9KFzeuP6am1orjqBybhS7EXQrQppEX1PRQccIhBzGnfxlI49dn25ltCWDW+cyjWQogoC/upU+RrrpBwpxYxwVBn6QgaW1k3I8sahsGVfKweqa7xmQXOSJXANAwbvr0php+s2MpaceUEPYKcgTICoAgugW7VWVkNSUJe6eNme59XEqYminTPx1mTcJ8i1JBf7TUjFgVB5Mrg80zJASD4m/GESwC0rJy7ESSdDw+XlZbte9PLCa80cdCzjtyrNbtKz5t5Zuipc9xtCpcXL5UDPQR6MdtFjV+4mUB82esqBptawjSwDq4yJvGRx8APzO+meLlR5C7SwxWmG+p0G0jbvVza86Pw5DTCMHfdsoiXpEyi1H5YD8Ufroak7ViFyJ7VcFBZdIgEWdS5WAgsDd1T3qOaN86zkYRzjfG7gNQ0hNWJ6TkSYeGhsOhgzkD7PptAfarBhpI6KrvB9/W0uWDE1Rf+wc4gDDgKvvjDOn1PDur+OeSP2az5wF27+nT+dKt33o8n/5rGZNBmlamNKi4RluSkny/GRMkKZ08bdm1AQi7jVogiGpj0yxo8kgbN10fg7zEdd/3XVxsFggK2nmjlAklXx0hvE2LDVbGu5Baj3xUvNB8gxnWF2wlfpZuRSCiuLR7gUk6Bs8n5ftzr5a7Uyf9Iuw08+cXgw/6nKKuTI9ZRi7XUYdNsELfWicw2F2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(186003)(2906002)(5660300002)(508600001)(8936002)(6486002)(31696002)(8676002)(66946007)(83380400001)(4326008)(86362001)(26005)(38100700002)(53546011)(316002)(16576012)(66556008)(36756003)(54906003)(956004)(6916009)(66476007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xnfMTtVK3WUZgbay2yDYsLW0/S7p0m1EoKlhEXPzi5UPjUrqdnUbg3gOSWBk?=
 =?us-ascii?Q?Ymqq14i+CQoeg0JVxgYliQXI81f5BSD84/qmno3+ufukJqaEIadCFuK8VYJs?=
 =?us-ascii?Q?x66iVXl/Z0uo/z/YTXb7SFBLM4fr80sZTvybeyIHJSa2BZdaxNsv4rehHrsk?=
 =?us-ascii?Q?6LA+8fkTwvXRMukMwr73h/PpWEdGSJMqZ+Rw4nNDCCaQVMNR9UkF+R5RgFHn?=
 =?us-ascii?Q?/X7RSnR8QjT/kFf2DXnSmtsAsLHHpJcttdJ4VaTqKXgMt1N2+seYSpN+P0KU?=
 =?us-ascii?Q?fv8kFKpYX1e4fj+RKAnaedeb+xnTNuxhb7hb5l8klSh9UfWXWaZB8E8EQ2BD?=
 =?us-ascii?Q?JTichsbA/vjRtzYOTDBPMpGbnN/mWlx0CvfbTycJubjxv51TeLxlBq+5unbB?=
 =?us-ascii?Q?YgsmC2TKEvnunAndQeoWOcCXKyN3hIPeM3fJCQ0Up53rVW5EM0FU0vcYLV8R?=
 =?us-ascii?Q?Hu3VyEoh5Fvk6OeUekuYvQy7bBXoGmky4MoyDk6ncUxXtOz+Vwg0seOS/6eb?=
 =?us-ascii?Q?c23H9thjz1luEpIIgWmT4Bsw1MNeLQrUrtUPU08EIHbXANhNjb+jdah3dCi7?=
 =?us-ascii?Q?lgCeb2DPIBHmBlo6uxy7wuVCP4sQ29RoA4AcndQ79L+8mHZRB7UvLNddx6Re?=
 =?us-ascii?Q?GGe80r6pL3mbsnbLm65UB5INgIPCr/vMguhvjWcPBcvFPo7cMMBOGhzPOwNd?=
 =?us-ascii?Q?wSLn0QuDcYhkzlGULSVv/epPxiLcbI/qTvUrS3shWRQFsm3IRHtYKas2BKWk?=
 =?us-ascii?Q?1l3/u7iHZ1Mc/ESNRbKWnaDblzzwgvBm0JOm6jhWrxZOVVTmKU07uBpj6jgt?=
 =?us-ascii?Q?5jWSVeEyTpaH0v15DjEk7YYmVpR0lEH/Pb8b8uSEBwuiqVxBrmUB5Z4jPHhL?=
 =?us-ascii?Q?C7V5uicku0S+7TUN7fHlQ9hE+2xRcYQvEdSf+CWexIxKtGnV7DBsrr7r87QA?=
 =?us-ascii?Q?iWw2DNh/nZN5Kje+eHjsSvcybUJRhCyXZpGm3Pzb6R4jc8a+YNN7LWqAvt+6?=
 =?us-ascii?Q?j9cR62LJlx06gqWR6lrHnc64gnmxFWWQhe5xmYo9qFZljDbBjj6IKHO3Swxu?=
 =?us-ascii?Q?aKJpa8FMSUWCELt3pmEI+BczbiwZUF3jBX5X0FDuYubdhsYMmQZP5PuWFLK4?=
 =?us-ascii?Q?zpsKU9YDYR0jQtKeuuoL3f9ufnnawPtxpg+mAnf7Xzy1g5KZEnDMsjN5QdSV?=
 =?us-ascii?Q?ie3lt8YQkrTBy01FntWzoGdxY+iwX37CXDdWFlfHZIAckrMOFZqQCS2dmtJK?=
 =?us-ascii?Q?+jUIMLVkZbLiAojVm92wDQeZ3vtxJcJksIaLMk+fG8Aa6oLW5xLbgroC7RDN?=
 =?us-ascii?Q?qv9fbkNaNids+vSHWk3hTdrGO41curLdnkwGJGiOwf5Q1tZ3It7oMJF3ulgG?=
 =?us-ascii?Q?hU5gmEghhp3o2uwx/3XBjfVKZApxasXv1lCASLXNi2KK3IaSubibHp2V25HA?=
 =?us-ascii?Q?LkJFVciWSA8CuvDFErhCj6ZIcw6Ne+qTJ8x/d+QLvhv2aM3Wh2Ak/VeTU7sW?=
 =?us-ascii?Q?Nto/OHMNpDGkl/iBLWOdKgiuPtYkolVS8zSS8FUKzB+QrUsX7OuC6Y27wLDa?=
 =?us-ascii?Q?mwGPihhXVKz0h/bsktZ5PR1/xPRL3lf2mvsfZXd0TSszGIcXu63P7KPi/YCP?=
 =?us-ascii?Q?JO08uZGTq/seHYtMVelOWSU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1914cbcf-394f-43e7-67c0-08d9a50357ba
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 11:06:42.6573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGTMlLoiXVKIavJ1WNwGoVCFLBUvyKuwn/BMtkWFWpjOEU4kDqpzS11NBlK/2Qk5T+gmxxqX9ejqVWEMcBVaxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

On 10.11.2021 13:39, Roger Pau Monn=C3=A9 wrote:
> On Wed, Nov 10, 2021 at 09:19:35AM +0000, Jane Malalane wrote:
>> --- a/xen/drivers/cpufreq/utility.c
>> +++ b/xen/drivers/cpufreq/utility.c
>> @@ -417,10 +417,14 @@ int cpufreq_update_turbo(int cpuid, int new_state)
>>      {
>>          ret =3D cpufreq_driver.update(cpuid, policy);
>>          if (ret)
>> +        {
>>              policy->turbo =3D curr_state;
>> +            return ret;
>> +        }
>>      }
>> =20
>> -    return ret;
>> +    /* Reevaluate current CPU policy. */
>> +    return __cpufreq_governor(policy, CPUFREQ_GOV_LIMITS);
>=20
> Do you need to revert the policy->turbo value to the previous one if
> the call to __cpufreq_governor returns an error? (much like it's done
> for the .update call above).

I guess this can be viewed either way: Keeping the value would allow
a later successful invocation of the .target() hook to observe the
intended value. Obviously then it's questionable whether returning an
error in that case isn't going to be misleading - failure of the
policy update would then rather need to be indicated by some
"deferred" indicator (which we don't have). Taking into account the
behavior prior to this patch I wonder whether it's an option to
simply ignore an error from __cpufreq_governor() here.

Jan


