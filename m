Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8346544E7C0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 14:45:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225251.388994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlWrr-0001UB-Kp; Fri, 12 Nov 2021 13:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225251.388994; Fri, 12 Nov 2021 13:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlWrr-0001Rn-HG; Fri, 12 Nov 2021 13:45:23 +0000
Received: by outflank-mailman (input) for mailman id 225251;
 Fri, 12 Nov 2021 13:45:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlWrq-0001Rh-6j
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 13:45:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c735f557-43be-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 14:45:20 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-vVoBgrpZOL-YSq4YWNkVcQ-1; Fri, 12 Nov 2021 14:45:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Fri, 12 Nov
 2021 13:45:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 13:45:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P192CA0068.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Fri, 12 Nov 2021 13:45:16 +0000
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
X-Inumbo-ID: c735f557-43be-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636724720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pTyQnl79lD825VjN87OQgo3mnN2RVybPwFky3bWs98k=;
	b=lMsi7NYG+wCI4pHtXr3HVrAQE71yEpDiHLw99kvjBrkQYpNUTiWs6sq4hpb+CtOye/BVGC
	5J3ZEhAUNEBkUVfPlwsVGsTbAMDgKlHnvj61wqwCDPtNL7MgpGxfEDepYqcw/zeGRXXx2O
	eFNcRMd5IZVNem558zeDsnnj9Prcv90=
X-MC-Unique: vVoBgrpZOL-YSq4YWNkVcQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfXSxgn1QX67I1lKtzgFl4+/b2yvDu/Id7BGrs9VzUJvb16BRXm2PrlU4WmrtytIiDbfkSKW/ZDWKl05Lk/pa7srAeswoiSO9f8OdJIWuf3amB0PP3dZ2T4K8RTMM01gMCcA3F8TlyNT8kvOIH2R+Tg+XU0FJOvnsPMW3bu80QqWk203r9ysWB8kQMHvlUPsh/rv745yXM+YihcKfP59MvJao94l/HRPhOI403wKx4wxZtNk0PjTvTvz14Obp/H+BsLNMh99CqAGmvRCNFuxPGPi5ty/ZLB2MUjFPNmQuIRUzZdV9RKb5QpNPg7Af76r/QTQvJQg+mombfC4R9kYtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATCPuTxKIiHV0KnzFB9N83LvujMW/X0Oiqf3zEn/IZI=;
 b=juaxStk0gaR2YaZgv8AgZB0tNvfJGu6luWBuJgLLxw/kKDnEQupyHJMHHsAJ8nEGWZsuO7eJc78P62mI/I4jfXwxY0jB9MrWNNjdO5pgAHSMbvgO5320Zbj5TH84RXj9xWooImqWH8lVwtOqqPLX5vBCwjWtWDUB4AOQu59Pl2y/sZJ3MZDi76cpg4sesckZg2Sfku6NekxBeilQWK90XEA18MNHGiZ9/RQjaIXUVZQr/g0fSFvW6TDvD2SmgF942zEi0Hr1sxozE/UJE29sTtrGS3c4TuOU+KVSjEweeS1kQpYAbDFEs5qk7UX19NI179jzlc6HpP157lkgk3dpPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b640505d-96cd-3306-ae16-eceb9e528995@suse.com>
Date: Fri, 12 Nov 2021 14:45:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/6] VT-d: don't leak domid mapping on error path
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
 <d4ca5274-dbbf-4cde-1a4b-0d7fe294c360@suse.com>
 <YY5vMYpmqVJhqyL1@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YY5vMYpmqVJhqyL1@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0068.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 254faedd-b8a5-483d-bcc5-08d9a5e2a8cf
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24464278510013C783793CDFB3959@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QRiSbxyG0nVM6vA7rbTjV/uInCIt8J7Yv/AcYUd4p/Q/ozlabOvYQGbFl+VB9mi5NgFFQdEjBLkFAosMLOlm3A3V9jwuQb2M90E2vS5Co+K/lW5+MBGaEv7KLEn6SHKha3C5stJcdPcrHoIQMDliDCZaFzrb19jMrzlxuY2ly/vu3X+W4NNCBVJbeRgxLg1IrlKGamehrWlOj2O0U/VXD03lXfmPmtZwAHSxDMUd5HW4zRyjdqXe9qiKzfksrZy8eXl4xtQSRA9CChNUU/VVlV4HVNqUVhJYB6U2lwOMvCdKkba6z+czXdS7daB8ssy+TOo4YTnWeBRcpiGEdyf2fX3sbeuSKCQaovn4B9orwBrl3xCXCABsaCTguTmT+fkmPxkge+SFwqQdeMJTkXG2TxI5Tes0X2UsCXac+HmRQ6UDJ+ZASDXRc4yKufPaLnP1TYNgtpzd7TCm/0qeNDLaWZD+TJ8CfIlTDxMCR99vz8Y5NJZ6spEMcIky7aUIwpjwiZ+jO5dgKKAe7fPImEshZZhGAmyTfmXCmro8U+Ay8ZrR68acyMTQkcHViggVmUvJXyufolQDq3I32NyU+CUC3x4DbPb66Ukp21NjPAf0DJlrbl3p67FnbzP3TITlfQ9xgatB0OLVYrLg0bfKO9tAdTpNZhGbRTypZa5iMT77O9EVGunZatz2CcK/jU3+Gnz9h6FoXXH77e6IcM6yV9Yo8BAscFnAeRc7dy3tvw1rLfezSuHfvVQ81CPoZnFP1sN+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(5660300002)(508600001)(8936002)(66946007)(31686004)(16576012)(38100700002)(83380400001)(36756003)(54906003)(66476007)(4744005)(6916009)(956004)(2616005)(66556008)(186003)(26005)(53546011)(4326008)(31696002)(2906002)(6486002)(8676002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q1FgD3Rl6O3ZRe8SCjnRJRlrQRr43Be9krnPw+piyZJpqvFh7bkn86FP6mp0?=
 =?us-ascii?Q?bwPVfDnSPeFz41gCOxN9Y0vgxcHtgcHpSOwVVy0iyfeShWnutRaPgQ54kcpw?=
 =?us-ascii?Q?oTxZbeTgVqolbkQuuUnZqpBWKq2bT9hnuh+rEGz9gNv2fjcsFgfASlXu9yqJ?=
 =?us-ascii?Q?L7lusdQZ1N693r37Sp8SeMO8YmUnYS+8dlgNC1eVpRpWDrCQrDCXWQC9eP/y?=
 =?us-ascii?Q?agdNScum0GyHXjNw8eS72pAFSeW25aY+5jozQV36atfyQky4Aa3X4e6Ma2Op?=
 =?us-ascii?Q?fyU79xMAcYWiHpwCK3kc7CTENkKfu4SauDDdsGYR43vfSMCxSLdhLANAQR2m?=
 =?us-ascii?Q?9fo9N4MtyKBioGMqvPY1zip7L/jp5eKLOE/RvMv6t7+HKVch+qIvjZ6NZDD3?=
 =?us-ascii?Q?spN+sChzCMKy2vrMFXmwqQeoM6AIBkUsBTHKyq6/UC33xvLtu4LLEB756T4u?=
 =?us-ascii?Q?d9ZUMK6L4Vr0DF5itrNwcTpp9Rk+xSJbqC5/VwOymIHAbt93ow8aF5jIkiaE?=
 =?us-ascii?Q?xlDhvrw0lP3wHnZ25zAXQWsK5N2QyaacUPBj3N1hfsO9/uiDN09meGJUAAZg?=
 =?us-ascii?Q?e+bzm6AjuUe19rWMwGRYZq9AidDj3cX9hjjr3v0ZZI0LehDf3IfAS9mw2ktS?=
 =?us-ascii?Q?hqx3BiHzqeVF73FLXLA+Iw6JXLm/NjtCm41bl0AeaWbgPi3ZzqwnHSHgAiyK?=
 =?us-ascii?Q?CBOUgDEixMIBYXOUjdYweXbDgRcPMrqCdmAbSaFXOTOBppAWc6HuLMMq3vaX?=
 =?us-ascii?Q?hQIwUsUPSAHOl6qMLfCIIph4bKLgfJJQ4cESyaenyLieuPOICxBL5KrcjWBv?=
 =?us-ascii?Q?8TUPn5vLK5mstJsna2zFQKK7qYg3VE/xfnOnYVaMjXevZIAX+CdFOaW5rnJH?=
 =?us-ascii?Q?00NVP+eGpRckFCcSSudj6dOsMTdsjpyvvdZV5Fz120qeQx1V8ZcolyJNNqDO?=
 =?us-ascii?Q?MqdI/4cZ20n+wdkN7UVjuyBSINfS2jljcH6HyoyzI6BFxc0dTkpdaI3geV9J?=
 =?us-ascii?Q?v/miFV5lWtK0g47Vq0VbHRZeBGbwRnDw8x+DIgfUXl1+8m5hKplcPXRY3ihv?=
 =?us-ascii?Q?P1EgSlj4D7EWQMM9JZtnc7BUiY5oRVb3g5K+4FQo6kzw8VREHCdbO/VzaXLl?=
 =?us-ascii?Q?94eLjzPQsMYaHzjQz//EChyf3JmUZI6r/fM7eOhTt9/Y2Ied+zsAcTAV1Tz5?=
 =?us-ascii?Q?k67k/tmb9tWMbxVo6fWIlsqjkT/VeOgqEPEZPtgJ4I5u3KQrWVmKR7XtVD4W?=
 =?us-ascii?Q?qKbjxUIlmKPd6JKSSN4y+/Jh+J/0VxrO4/JFp9Um4dOUyRxJd1lIWlGuA8Tw?=
 =?us-ascii?Q?tNe+Kwh9We1LO9e6V5BIFvbuxOldiRfTgSsTP4JNxc+P1HNdDsgIl0s2i00U?=
 =?us-ascii?Q?Wgo3FZBrNvMiIYebU3jveTYtprcFY9xP0BZQr5vCQ7NY+nxy1qu71AcHDTrn?=
 =?us-ascii?Q?PY59vjoSLyB03v6mVqMPmsGKanugiKEsen+iE6/6NHXiFrKkKSXuQvQ9/zvT?=
 =?us-ascii?Q?I+T+kORTXRriZ7vWF9qtj8hrgOIzgd/ti9QoWf4oc14+4HTznbd8GkRdI3Bd?=
 =?us-ascii?Q?CQHnenbm5qm5zW76Q5PKtX2i+id4jJBAngzhMJ8/PoJ3esn636Sm2Ipr/EUO?=
 =?us-ascii?Q?1+LYS/cj5B7OHN7Qs1EB4XM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 254faedd-b8a5-483d-bcc5-08d9a5e2a8cf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 13:45:16.4123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Tqhnl2jl/OFi4sgmmA9gZrVeZHLbNOol4+YP43Sj4f8j010GgvghcnhUCPjOKUdbJPmu8In0jSKKdJCe6rMSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

On 12.11.2021 14:42, Roger Pau Monn=C3=A9 wrote:
> On Fri, Nov 12, 2021 at 10:48:43AM +0100, Jan Beulich wrote:
>> While domain_context_mapping() invokes domain_context_unmap() in a sub-
>> case of handling DEV_TYPE_PCI when encountering an error, thus avoiding
>> a leak, individual calls to domain_context_mapping_one() aren't
>> similarly covered. Such a leak might persist until domain destruction.
>> Leverage that these cases can be recognized by pdev being non-NULL.
>=20
> Would it help to place the domid cleanup in domain_context_unmap_one,
> as that would then cover calls from domain_context_unmap and the
> failure path in domain_context_mapping_one.

I don't think that would work (without further convolution), because of
the up to 3 successive calls in DEV_TYPE_PCI handling. Cleanup may happen
only on the first map's error path or after the last unmap.

Jan


