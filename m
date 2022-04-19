Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A16506714
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 10:42:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307865.523205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjRV-0002zY-Dt; Tue, 19 Apr 2022 08:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307865.523205; Tue, 19 Apr 2022 08:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjRV-0002we-Ao; Tue, 19 Apr 2022 08:42:37 +0000
Received: by outflank-mailman (input) for mailman id 307865;
 Tue, 19 Apr 2022 08:42:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ngjRT-0002w6-OH
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 08:42:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8b970a0-bfbc-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 10:42:35 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-WUc-B0ijP26bWt4kRQXkpg-1; Tue, 19 Apr 2022 10:42:33 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5278.eurprd04.prod.outlook.com (2603:10a6:803:59::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 08:42:30 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 08:42:30 +0000
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
X-Inumbo-ID: a8b970a0-bfbc-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650357754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p/woneOYshgtmIMld/+jQHXDH1F7e042Iv3EGlBwRic=;
	b=iM0dCjtTt90Atf0IE0N4V4XianMRB4aljTGstIQMlRA+r0z+9/V8cootF17bPvT+mLik+0
	vzDYd+Z4vZGnepi+Q19uzVDCHrdVvxqCALc2qiGqaFbIJPK5cQmpPwJkWnylEyAY4gqQqu
	RbEKwiD20B6JIyNBJSDwi3YkubYwUMI=
X-MC-Unique: WUc-B0ijP26bWt4kRQXkpg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlSgiuVEA4Xa9RFzZZhal39lKlAGnKfexY5y7ODxShQaYKGzTP7zsC2HMALa3c7wGIqpBQQ3GsKl/goG47FgTWSP/YnxwBrsepLYhnm+E4+EzsQyV6psrEuSapvyMy6x/QddjoS2CBa5fcno+8KgAjMkSuRAXqTHp4/FQSP4brdLalKx8CZ2IHgdEMmnBSELIVKskkVErHUPoMrrKnKgSueSvH5UW8itnDSybpfmTse9ILViqKVRbmA2fCnsVyicQZ8oi+JJWD0JzW7RYM9omO1zuSjxHsAoaJwJOPvaSa1PV/BatO1e+IPF9VwiDtnS+b67p7JojvrFdeF4br/9zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/woneOYshgtmIMld/+jQHXDH1F7e042Iv3EGlBwRic=;
 b=RxkT5ANujIG+6d2ED8a3/m+8cE6la28XSvhGOzZy9HpJ+Do8Xp+ymFoshghIjTy75aMACRQ/btBrFxMuhtn2Et9j2ZCF6nzjUTZcockSz7XjoTUc8jjzafVFhqDSPele+GEX6a84J0xHUruJ5MP9R+uK0pwc0vd1hzzOLDVBtapNaX6/Z0nkjtiEP90ruR4dhEOUVIngKNqJXFKF+38Nv5c+5J4dhWjPDzucoS+mOsVpsvSnrV5zIsnWun0z35Y70up4LpBGjAAawuwpCKDXl4WaskdXnhgU4/6Siq78MeEN/HmE/zlKSJXYPwT2soouaoLI68/y2ob8ikym+54aMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fb19f5ac-b8e9-7cdb-4f72-71b73e6f4b8e@suse.com>
Date: Tue, 19 Apr 2022 10:42:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] xen: fix XEN_DOMCTL_gdbsx_guestmemio crash
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Cheyenne Wills <cheyenne.wills@gmail.com>, xen-devel@lists.xenproject.org
References: <20220416133158.16162-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220416133158.16162-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::15) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7beb9812-e459-4a2a-beb0-08da21e08a44
X-MS-TrafficTypeDiagnostic: VI1PR04MB5278:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB52781CAC3BE2C281B865A15DB3F29@VI1PR04MB5278.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A54oHw53XUuh22u1DrapLmaig9m02kUQrEA3bwquQeb0IHGPvbmhMwi4IWgR/iPEupXASVPQoYAmifGjiCaUo6kckM7MlytTxIe/wnV9e52V3Rqvi9OP2zkXEttlnSuCN/Mos6V/ZLNAEOCEL7wG+khNCLYNWo2KoghbzdaDSjPPtQ8Efxsu9sBX91sdpBX9C7QgkSt7IontDzJgSwrxrEfV8/cb1aXONJwRzoIZHwGZD4VjtIoa2Z6tCshYKwc3Br+z/WUF4J0ZHutN1iZuS2Qikr9ARbBYGet16nCfnhxA40PViV4b/v5BFM74/X0OyAYTjd4Htxsnrc2c0zd4a37TUHI0b43OUlOmWFDDUmx2MqCexTUFYXy6F3jj6VrWsmfo72TlbjSHMQlbJ2aXFORZuVc126S7vldrpjSU2oDq3grTE65shE6BdiAVGnUE29SI9+XyPL4YyFn43HWP94KIrf5vHX62Qu1HQpfo29yDTZnfN5Yb97ubAiWqmSpdyB+R/Zh7vm3aW9guDCEV1voCn32hiUHnqU0+LXapQzDDUh/TR6+5EZ3QPr1wNWqyB5kSs2F9ax3PHJf5ZqAP06fibHTZ1kkWNUqOBAWsyntE2ZLrFWWTnGQwGIq5XlfNj1EOBv9727rnWaJyNcyFLZ0Hahlt56Scr+dqehJebh4ehQMxO3PvPJg6b5p4Dx3HVD9oDylzMQNkWukmQEoNdhtxqqdV2sAiPJFjjTipoPU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(316002)(83380400001)(54906003)(6862004)(4326008)(36756003)(66946007)(8676002)(66556008)(66476007)(31686004)(6636002)(37006003)(38100700002)(6512007)(53546011)(2616005)(6486002)(508600001)(186003)(2906002)(6506007)(86362001)(8936002)(26005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzcwWThDM0Jka01YS0RRWUp5Nys1bGMrcStOQUFUdTlIemE1Rzd5dmhvSHJE?=
 =?utf-8?B?TU5XM0N5TTV2eHV0cUt4VTJ6L2s2bm9kcHBoN3ByWFNpVnBaYkQwYm45aUlM?=
 =?utf-8?B?SHVLVXJwUk5ZVnJpM2pRamhraU1TTE9zRUhMY0x6R20vbDJDRHllbFZUMmJl?=
 =?utf-8?B?VHpmMFRSZnp0R2xRZ2QxYzhjaHR4N1A2TExmY0NkUGYzNkVKVjNnSWV3Tkx2?=
 =?utf-8?B?VDJqZ25uSkFBMWpYS0hTUGx3ZzBqVnR1SVZ6ZWRYVW5kZXhKTFRVNkhORUEz?=
 =?utf-8?B?STZZNUZuL21kaXNYVWpZQUZla00ycVNwL0tOUFZ2Z1ZQN3JBc1QzRW5TV2NL?=
 =?utf-8?B?NUNnSCtMR01zLzM4RXZKZHZzcWkwVkNOSHVwV3EyWFJscVpqUEZkWGtJd2ll?=
 =?utf-8?B?NDBPVGZ5SUhkSDBLZ1hHa2sybzBjdmUyVHpBdE9xVTJERkVoWkplOVVqanp1?=
 =?utf-8?B?K29DU3pDbUJ2am56N1hXL3Vac1lnTHl2R0tsUmVid2psZHhEaFJLNXhkY0ZS?=
 =?utf-8?B?Ukp4UTU4OVVCUTdqUzBKYzFNcU1qdEdPb3UwTU5SVEZHallxQ0ppWUl6R2da?=
 =?utf-8?B?bkdLQkpzWUtmekZMNnRoM3RUNUV4am1sVVVRbkRPSmM4c0diTllLNmtNUS9P?=
 =?utf-8?B?dEFaK2tKMkh2bnNRQkUxbS9weUFPMkZINVEwQjZ1Q2ZKN1ltNkNqNlhBaFNG?=
 =?utf-8?B?TUFZcVJEZkFJZXp6ajBpSWNsUGlzY2daZkJKMHlUY0dCZitORkZPd3p2Sk9S?=
 =?utf-8?B?TXNmalIzUU01WE1QTDZJUlpwYUZvZzBtYm5BMUJPTjRqd3NwdWtOYzFmUEJy?=
 =?utf-8?B?bC91TENKa3REUmpmVXBCTEdVOVNha1UzWVI5Y1dBQS9VNm4xaXRVcDNwbkhL?=
 =?utf-8?B?MEJoOGFmRTVaeTBDKyszb2pqTlN5cmxMRXpOL2hTSFpRSmE3Zm5RNWtsaDRq?=
 =?utf-8?B?aXhUdzdzU3ZscHBjS1VFL1hFTHV1alRHWnFDVTc1dE5iajkxVElEdkZYTGxo?=
 =?utf-8?B?K1Ruc096MDYyWk9RRGtnc0drUXUxSWVqOGZoRHVEOXdFdHVxQ0s0bHdsZVVF?=
 =?utf-8?B?VkVBQU9La3BkeWE4Q3RFVHhYTWZLL1FSQ095dVJmTytTc28xbGd4b1p6M1Nu?=
 =?utf-8?B?ZHQwd0ZUSk1IQUg0Y3hiZVprZTNtSjZZR1RLa0RYYldkK1d2SEM4L0IvSWgr?=
 =?utf-8?B?NHdSZXdidUNEZjFSaEk5YkdTZ24yRDdYT05YYjluMVozVVBQcmtoQkVJOHA1?=
 =?utf-8?B?LytTS0RPaXlJdFdyRHU1cWRDWDZsQk0zV1dtcFcvTnhOa3JEOGVCcU9vM3lQ?=
 =?utf-8?B?N0kvTFB3YTZIVmMvMk9lenU5L3NldFdMeTN1QWZxTUVKbTRkUlJZMmt1S3ln?=
 =?utf-8?B?eis3bGpNN215QjBHY3Q0aW1sRFFtcWFWazZFVCtOV3FoNUIxeHFVOXdpMHRj?=
 =?utf-8?B?UlJpdFJOUlpnMll2UFFPRlRLb2g4b1RIbThscm9jTEg0cm5vaUkxaXRBaVdj?=
 =?utf-8?B?Z1p0bXNBM0pJeXY2YmpJeXBQYzF0ait5dnBKUkNDTHNxaEJLZFZNWHR1YmdS?=
 =?utf-8?B?ZS9rYTNETFYyQTRLSkpPUkR5Qk1BVlo0dWNseGdwZ2xraVhkTXpmWHlvdysv?=
 =?utf-8?B?YXFnOUsweGxVcTM0V3h4TDZ2K2Y5cEw1OWFZVXVUYnBLMStGRFNWb3UzS1RG?=
 =?utf-8?B?NDRiRHFsT1N1V3dXSmhBbG1XQ3BBQXFGRWpNSWxHVENSbCtQb0lIQk14K1kx?=
 =?utf-8?B?cTZIclVQaFpGZWpRVDJiODRYS05IQlAzbElCaTI4b1phM0NmSWVYTzgrQ080?=
 =?utf-8?B?QXdSYm1UekdvRWI1Unc5cERBUG8vK25JMTNOd3Qxd0dQTDl1RFhOZ3BnbElY?=
 =?utf-8?B?WWF4eE5aZW5nTk5IcnhOMkQvdVFIMFBFWlJFbFMwYmR2blgwcFFoM3dKT2RS?=
 =?utf-8?B?VEpMODJGdTJKbXNheVpTTFgvaFhLUEIyVDY3MkpxVFRId2RmMVpyWktlMUxL?=
 =?utf-8?B?blE1c3VkRXJLZks2YzhROU9SNS8zYTJ5Qk9CS1g3MFQvdDhZanFPLzBqUkRw?=
 =?utf-8?B?aWgvQmVjWUNmbTg1Q0tzRHc3WXRuNDlhL2wxaGgrWGpoaHg5YzdtQ3BXSThs?=
 =?utf-8?B?RjI0VmZDdXB1d0dwejl4ZEZxYkJvMzE4bDJiRGYwdThlaGZWdXJXMGh5VzBs?=
 =?utf-8?B?OEhCeGNibVpzYnNTbVhkQ2xJMEhlcmsrQjA5V09LTUM1S1ArWVMzeTI5bFFr?=
 =?utf-8?B?cFF5THl6QlF0MEhTVlNtSDV0aVJUOTRtTE8xWUpFeHRDWlRUckVUelpFRjU4?=
 =?utf-8?B?eDhsRXZzM0drQTRpRE5vaHNQMlFqUEg1L2dFdjVLOFFPeTh1eUxGUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7beb9812-e459-4a2a-beb0-08da21e08a44
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 08:42:30.3591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/aXVtanQ6QzVDWS/fXU2D8ozYsY/D7meBD4lo45Fe305kpJd6IdBld5l4X5jZ3taNEJyQt+3vJi9SdmOhjdxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5278

On 16.04.2022 15:31, Juergen Gross wrote:
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -308,7 +308,9 @@ long cf_check do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>          if ( op->domain == DOMID_INVALID )
>          {
>      case XEN_DOMCTL_createdomain:
> +#ifdef CONFIG_GDBSX
>      case XEN_DOMCTL_gdbsx_guestmemio:
> +#endif
>              d = NULL;
>              break;
>          }

Wouldn't we be better off simply deleting this case label? dbg_rw_mem()
resolves the domid anyway (exactly as done a few lines down from here),
so I don't see why we couldn't pass a struct domain * there instead of
a domid_t.

This would also reduce the risk of further similar "overrides" appearing
here (taking existing instances as "excuse"), and breaking things again
in a similar way.

And finally I think iommu_do_domctl() needs making resilient against d
coming in as NULL. This isn't just to cover the issue here, but perhaps
more importantly because XEN_DOMCTL_test_assign_device can legitimately
end up having NULL passed here (when the caller passed DOMID_INVALID).
We've simply been lucky that libxl doesn't use this variant of calling
this domctl. I guess when d is NULL we ought to check the global flag
there rather than the per-domain one.

Jan


