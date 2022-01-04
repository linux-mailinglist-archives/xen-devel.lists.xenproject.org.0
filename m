Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B13483D43
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jan 2022 08:53:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253008.433959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4edI-0000fI-7q; Tue, 04 Jan 2022 07:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253008.433959; Tue, 04 Jan 2022 07:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4edI-0000bp-4F; Tue, 04 Jan 2022 07:53:24 +0000
Received: by outflank-mailman (input) for mailman id 253008;
 Tue, 04 Jan 2022 07:53:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+k5u=RU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n4edG-0000bj-Me
 for xen-devel@lists.xenproject.org; Tue, 04 Jan 2022 07:53:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62536066-6d33-11ec-81c0-a30af7de8005;
 Tue, 04 Jan 2022 08:53:21 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-vAWdR8WKPzeVcY3prrcdng-1; Tue, 04 Jan 2022 08:53:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2702.eurprd04.prod.outlook.com (2603:10a6:800:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 07:53:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 07:53:16 +0000
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
X-Inumbo-ID: 62536066-6d33-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641282800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DJ2VoCKV4bLugnlAWgwuLfO+9b75Eqzo5U0x4Xeu+TI=;
	b=hZmZanYtPlQhGphXt0oMdMUrtmC1e+YByU2eiOcwmQ9GapNG5PiQ+xNnVGMvnsj91A4TUp
	n+WGlM0jsGaMYYHV29WATUS6eQNgTNE1auriydqQIcKNWutwWYXWUd6BxSZ0dzNZtiAft3
	vEoTz8JgeWuLXzJU8w8BqSC/tIgWD+Y=
X-MC-Unique: vAWdR8WKPzeVcY3prrcdng-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxdM1G/D6xVMyj3BIg7T2SLGvwoIqKiKbE5tpff679vhKBKehup6vhfqXIUfHZRwv48P06AJZA2Skw3MoMwCTMySCFrUbvQ0xUdEwmSWubSixA5uK9E3bWNdFeymHQga9lyJC0WM/4cTv47xGnyQ/e3NhroYK9voyOkKjE2ozm90ZyKRRlV3GsOU1+qhbHEybZb4uOBTtD7kSKNk+fcMGhNL4kS+V896eBY/qQru4yNVHXp9NrQvbse5p8hmQsSpcJybjKkC8WJLJZ/9t7Kdx45Y+or5u+i16OwcF56uYrO3x9ldw929nzIBLQ/nMEAiNHtR6apZiX98YdHXSg1mvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJ2VoCKV4bLugnlAWgwuLfO+9b75Eqzo5U0x4Xeu+TI=;
 b=jPaELyJs+QC+8cTPI2kp0aV636sAtGBQfg1Glo/uIvtR4AGYZinVZL0MUGGmk+7Vd17EGtJiBQmGqpKb7t6uce1Mnq7wWvNJs4nYLFH79o+NRxJismEkJri3wKk9GIlntjNGjO0NXnhUuoy78qtsBTnnx3BkBEnp4/4raej1QQlPt9Z6YMFaif5Yx7Zh4JXw/Hh6V9r89jsu6j3cjsez6rBlDLdccDlPgJwnWpN3mlj1u7MLMtmdM8SDEC9VfBqmaRAMQHoR9plzN1x6S79Qv44NLdEaaMh3RU+y6KDBMvXu3qZlb4OaPpeVJRHX+nXAqlHmbI3V6xVaqTNU8PzmkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5fcd3250-03a5-aa91-ec8b-9a891958134d@suse.com>
Date: Tue, 4 Jan 2022 08:53:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Ping: [PATCH] libxl/PCI: defer backend wait upon attaching to PV
 guest
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <stefano@stabellini.net>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5114ae87-bc0e-3d58-e16e-6d9d2fee0801@suse.com>
In-Reply-To: <5114ae87-bc0e-3d58-e16e-6d9d2fee0801@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0011.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68135f7b-c4f2-4652-eb9e-08d9cf5743fa
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2702:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB27029052E8F1E3B2BA3430B3B34A9@VI1PR0402MB2702.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V63VU4JuXgZIFxrh6sOLK4isqH8gTAxPDgmfII4ZSILhgmNGe6hfl7Qwp8NzaeUcEp2xzQoEFFQo60HagdoM51Tvo+1gHS04Qkg6Xro+is3c6ZVahBrq/QSE9gK+zSPoTke4UASbZfLjXq/w/bbHKtcoE+wcWKu7w6VVAmK5MA2G3J56MpxipNCLh+D8pI2YVIB4JEPiQl1/09cX1Rn+R+lJk77362NLr4uLFTB8F/M1ryNkRyKVQmvr2YBs2IqluAbbUtXXXq9A6LrmmfxGTa8GkXfqT5yenKHUsLEeplagqtley+7FoGA83PAKG24OgzF+O2/97mqnVJs6fvuu0l60EdldIgxMYU310MZRZecufwJlWwtucw0n6oxGuw6UeP7ZvRPSb+Gp+UrSo7XlmtOnijlk+Ip6RfBvN13Px9D5I/Spbo58mk2jvX8+LVCp0jwrQsXedqiABE4nOucAS0lXq/ybdtMNbv+9BHfA9sh7i4PSW5knsVhRCbGsdQpHiLY96o36Lmb34vl5Sj71gUEYLGFKuTw5LMnm6gzrLcHdbev5UbSqXZCBclArTOHR9nAE2BgHOEwFEnRyG/ZKVYCqL6F3hhgUQfc5S3zTkfBsJiJ6mXVs4Yc+SpZsQYckZYpZ958PHwIgx+k4u7ROd9Bkx3Op2R9wyVbsOKn/3Wsd7Xc1c94n0lWVn5Xq0Wg5rWLI7cFP+8I4v6gI1r44z/j+tRjPF1bCmvP2T/mlBn8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(4326008)(36756003)(316002)(31696002)(110136005)(6506007)(6666004)(186003)(508600001)(26005)(54906003)(53546011)(2616005)(6512007)(31686004)(6486002)(8676002)(66946007)(38100700002)(2906002)(83380400001)(8936002)(66556008)(5660300002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTNBaTEzak41TDA3eWdWcnJoTk90cnJrZExHZHVqb2RPSlJyckN5d1FLYzBM?=
 =?utf-8?B?eWJkdldUcDU2OUs1ckgxTU5HaW8vNW5RTE1ZdkFrY3FsZ2J4bHcreDFLSzF2?=
 =?utf-8?B?RkF0aU4weVFWRGFRQld0dmlSVjIwNEtZaUhQZ2tiT01BVE1BMXFrZytGeURi?=
 =?utf-8?B?MVdJbTJKNkdiNWc1L0ZiSVBkOTE1K1JUV1Vid3FZSzVmWjRwMUhEalhSRmw3?=
 =?utf-8?B?Z0U0dnh6Wmo1NlZZRUJaV1R2ZW9nRU84N05CZ0lLdHo1QlZlYmRLbUlhanhm?=
 =?utf-8?B?c2I1a1VtSE03aDZmVkt6RkswMk9XYktTL04vNXdieTJ0UmZwMnFDTFRxcGpQ?=
 =?utf-8?B?MDl2djZzeVB6cFFGd3RNY2NjZmlXek9kdzZ3ck9FZENWTXJ3bCtUT09ZVlda?=
 =?utf-8?B?TGRPTzFlSllZNXhleWRZbHladW83NFljdHBza0VvSURPK0ExM05IWms4SmFX?=
 =?utf-8?B?cS9RM2Qvd212UjVldngrUXVqTDFOSDBuU1NLdFAwbXFUWS9DcVVWL3oweEty?=
 =?utf-8?B?MWRuenZYNkE2UUIrblErTlVEQ0lKdUZGekdvTkxPOVB3d0N6azA1U1FKSVFO?=
 =?utf-8?B?bE1wZnh3dUdGRzdOaVliUWJzKzZWN29IaG10MGpCVkR6eVh1MGhLakgrdGRJ?=
 =?utf-8?B?b0dBSDRHVUtBOWdCR3VGWVY3UUI0Z0R2SVIzRllHRlpoWmUyWmQ5QTVia3Zm?=
 =?utf-8?B?OFFSbCt3U24rczVaSE42ZkVFVTJYVkljT2JraGpUUkdPSHpQQTFjNEIwM2VB?=
 =?utf-8?B?aHB1cWsyTGM3UkZvQUhoREVldEVkTGczME9icVkxQm5kaW03WnlhUU1pczZK?=
 =?utf-8?B?b3BaK0NESnJZSGVGOUtXZ2hKallYcnpXYXRKVDJGWWViQVFsR1Z2MEJMZ3d3?=
 =?utf-8?B?dEJRYzlDMTFRVFpWV05ES2FESDZrVnVYemZMMGlXT3Y2RDU1VGd6ZUJjU3Nm?=
 =?utf-8?B?b3duSUhrSXdpK3dxWmMyUWYvQlVpaTFIUTZHbk56NE1CTnBvKzZxSnJpUVFE?=
 =?utf-8?B?djFGeExwUXdwV3o5SXY4UXVUMGprNW9KVEhOSlZaVTU3eDlMQmFXelhqN3Zj?=
 =?utf-8?B?WnN5YWJ3a3pQWTVNbmRtN1ZPVGhzUUVQcnNib3pvK3lUQVhoN0ZwdE95bzI0?=
 =?utf-8?B?NHY1YTJETzhBekVqVDdteXllTE9NeXoyUTFPUkpDZkpHaG5GV1ZxcGhHa2Vs?=
 =?utf-8?B?SWtKSDZyVmN5eW5SVWI3U2dXRWdVQmpxdFlCVGZNUDY2bmhZSStYb1VEd2Vs?=
 =?utf-8?B?c0pDcGxubnZHbUNya1l1eFJ1d2hFZjR6V1JBYmRLNmd2STNrTGNsMFpIdHB0?=
 =?utf-8?B?dVJUWEcyN1Nsbmg5ZmdwcG5NWDJNMWUycko2UXg0M2lKVm5aVFo4anZGWmlI?=
 =?utf-8?B?a3NoYlJ6d29PclV4L3lFRE9QLzdVRVh1Ukpna1BET3A0VFFpR2xnVzJXM285?=
 =?utf-8?B?SFdhQzZIbEcyQ2xHNHhSY0JtYnNmL0lJZUJ0U29aOUsvMk9scFNVNy8vOHlU?=
 =?utf-8?B?TnozaHU0bEJhSW9FcXl0ckQ3U0EvdSt3eHg2aEMrQTFqcU1VdzN0RVlEaXc0?=
 =?utf-8?B?YVpRdlQvWkJzZ2czNE1ZNmRHQTdBTHh5TUQyNEErWHJ3VUZESkpVRE5MaGx1?=
 =?utf-8?B?c3NmTlB0YmlxYXpvaDhURFpFVW5qODRMN1ptQ1JjUlFVa0duWGJuNzEzUk1v?=
 =?utf-8?B?NjhOZ2tKemJaUzh0SkxEcnJtZko0djB6ZURkV1pBY2tHT1NSRnk5eExMTnM0?=
 =?utf-8?B?d3g4VDVQSDNMdWVkQWE1b2dtMENZcGJvVzBMdW5xdHB2azhjVjhMTUZldUxW?=
 =?utf-8?B?dno2bERtdDh0NGlwakNmWjF5QVlVdW96Z3lyQ0g0UWtKWjVVY2Fha1c3cE9z?=
 =?utf-8?B?WWFESkphSHMyZktvZm1GQXl0ZGlEbXM1aEh3UGFTK3dONUZTKzlpWVdiN0hl?=
 =?utf-8?B?STFtejJacDU5YWV6STJTSGhsSG9yeTlUaW93Z3FYUHF6bWZLUWFhUEVIU3JB?=
 =?utf-8?B?ZldjcVpFRmpWMnkzTlZzczlyL1h1b2FMYVM2U3M2QjRORGhiVTlYMlRFbkVw?=
 =?utf-8?B?YVg0TE5Ya2VQK2ozbkI4d0NjV2lDMDZ3Z2lhTTBKVkUrcFJWZDNSRGRkbEls?=
 =?utf-8?B?bWpQWWMvd294MEJHcVFBRld4WkdOQXlmVHEyb1hPdFltT2pKOGNUaU1NTnB0?=
 =?utf-8?Q?sf0wWgagEnypJkdAenIXO68=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68135f7b-c4f2-4652-eb9e-08d9cf5743fa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 07:53:16.2356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jR2Vp/hNnYk8//0SU3Fy2K2lUmXB2U9SlI3lyO9OuFChdvYOigcKq6neVevp+x/znzlux6eUiarq+6OMiWVbTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2702

On 14.12.2021 08:49, Jan Beulich wrote:
> Attempting to wait when the backend hasn't been created yet can't work:
> the function will complain "Backend ... does not exist". Move the
> waiting past the creation of the backend (and that of other related
> nodes), hoping that there are no other dependencies that would now be
> broken.
> 
> Fixes: 0fdb48ffe7a1 ("libxl: Make sure devices added by pci-attach are reflected in the config")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Just to make it explicit: I have no idea why the waiting is needed in
> the first place. It's been there from the very introduction of PCI
> passthrough support (commit b0a1af61678b). I therefore can't exclude
> that an even better fix would be to simply omit the 2nd hunk here.

Anyone, be it an ack or an alternative?

Jan

> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -157,11 +157,6 @@ static int libxl__device_pci_add_xenstor
>      if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
>          return ERROR_FAIL;
>  
> -    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV) {
> -        if (libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected)) < 0)
> -            return ERROR_FAIL;
> -    }
> -
>      back = flexarray_make(gc, 16, 1);
>  
>      LOGD(DEBUG, domid, "Adding new pci device to xenstore");
> @@ -213,6 +208,9 @@ static int libxl__device_pci_add_xenstor
>          if (rc < 0) goto out;
>      }
>  
> +    if (!starting && domtype == LIBXL_DOMAIN_TYPE_PV)
> +        rc = libxl__wait_for_backend(gc, be_path, GCSPRINTF("%d", XenbusStateConnected));
> +
>  out:
>      libxl__xs_transaction_abort(gc, &t);
>      if (lock) libxl__unlock_file(lock);
> 
> 


