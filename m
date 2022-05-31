Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71612538D43
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 10:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339309.564147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxeI-0006RT-3l; Tue, 31 May 2022 08:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339309.564147; Tue, 31 May 2022 08:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxeI-0006O8-0i; Tue, 31 May 2022 08:54:46 +0000
Received: by outflank-mailman (input) for mailman id 339309;
 Tue, 31 May 2022 08:54:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nvxeH-0006O2-2S
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 08:54:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5083e47a-e0bf-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 10:54:44 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-PLW9RIjTP6CRdQTac1KSIQ-1; Tue, 31 May 2022 10:54:41 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5665.eurprd04.prod.outlook.com (2603:10a6:208:129::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 08:54:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 08:54:39 +0000
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
X-Inumbo-ID: 5083e47a-e0bf-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653987283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aE2dBkuFXE78Hg51qAgZl+LxP+fyUswFpq7Dg+SfDAQ=;
	b=jmiotiq/mCHJLKcn+ax+I3W5BIXQ+cvCs2oV3rv6IIGr2OX9+/QIvP10YYR98FOgJI7ToK
	wahswTJwrnURyZAqVlmn3pQG2B5VyglwQjZaqXp8N5mMi5BPdUCzrEyGsRUPu3gj/42u2Z
	iJ4tu+ECfv0YyzCuQYeBuBpqxVdcbhQ=
X-MC-Unique: PLW9RIjTP6CRdQTac1KSIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aw4q0OnawBzI0Io9SIznulXJ5f3diVWycJckKK+IAPsznx4Rt/Bworaoylf82N6XRhm7RKf0rghAdzACUv33MKjB7ak3XB+TFhcHvANPJNeqkXwnrw2PmKzBL5YpPpKfYcoBJGVSxsloeJKdhnuQT1htjvRdep5g0eqNGpH1gY+/hyM9YE4EtvraN0w5D2N2FLXR+2DvwDEJVIfx5mCvyRX6g19C5pe9a8g9idzBqDn0Vo3zVaFqBkAMMVqO3c0SP7Re/MkqWvUyRFxWIO8kkLBqUVQk8OvNWjIl9HjA1SGy6smH6HpVrE1cCmyx9YAwoNE4KPrt9Iqx4GpEaigVJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aE2dBkuFXE78Hg51qAgZl+LxP+fyUswFpq7Dg+SfDAQ=;
 b=nNnfBmZHVu7GqE2WaeUymtxmf+ZBzUoVYiqFwV8hQtwi1G2FekuI8NGR3q7BAElPJKmg6fW+iDXm69o7cEBrAITDieATzxETFfSAmzWYk2hgPWYuXRLCc0I1YlBzQa9a3GvPujmv+hVj1NIOp73q88UIyWCpj7IeVuUhjz6RbmC1PfXDEzxM2RGuLG2Uwc5xKQyG00IfNLSbMZ1Ju2dYV0URo0Ts270JJ3+6R898JrsPvELmR0kjXq7YHXhSsTLzg24rhCZBOcPOqBEa49di+TrKDA+7KDdv02Dfrv1xMVG2WLMVGd5hgq7xFvchxqcr0tuaLt7gcx+u6izgSdUQcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <104c921e-68ad-209b-5b3d-797a58e47fbf@suse.com>
Date: Tue, 31 May 2022 10:54:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 9/9] xen: retrieve reserved pages on populate_physmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220531031241.90374-1-Penny.Zheng@arm.com>
 <20220531031241.90374-10-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220531031241.90374-10-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0035.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::48) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fab3e40a-d052-411d-f6cb-08da42e331f1
X-MS-TrafficTypeDiagnostic: AM0PR04MB5665:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB566526BEBE0E0A3137F626E9B3DC9@AM0PR04MB5665.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wbsohjJBRmOJnUuLRNb7Kq9S+MlKrxHMHz3ibG5NomM3W6uJlR5EYWTOOLo2ELvlMyY8FTzpn7Sqm7nT7FIRZdMkiBEa8Ky5n4W/qmEkkd4J7AQR5FYBTHkrPRB+37UBGgYPCB8kj7QEG4UT1KVLVyq6hHkKHzNj3tvf4/NhjJ12GizEGUYP5t9zPrLmxeZXqVGFCT2E8yZzYpywpk/3wvZbCAvyFra0d6FK4Dm6W5d8HkJo6hO3sfd0vHzRV2qyiwFQRmFbu9rWTZ5aHmbElrBiFfhuhTbTriiiu3wvoU8LTgY5e9eNra4QIyjINJbrabGS3KbRMqlVIlP5iJDwSP2j5rQqzz6K+s3R8Fn0T3BJ3w5AQuu3GI61IloKeywVTmbw8j1B9zlZ5ezJ09m/E4wKaWDaTZg6w+HFPjGWNkWjbJm4zOlUToDDCRRJq7kq2ZqY4Z0o6qo5INKG1muJpc/t2F6SsaTUXtGOma718g6yQXIhhYzD75LKJFSfFhhTAIiCeknbIhu245BzFcIEOMhi6p1ybi/Uv5wIEGWfdq6NSu1ZFj9gRYAAgB6ofs+HIxicXFIvRaDWKt23Mk5oEq+49vuiH7m/7q4JOoCwjZiTz7X8zUe1IHs6uhnxYF6QpsqSsaWSgUnn4KJ9SKyvaNBdy4HAnt1K0sZ2XUbHBiXGVgMpkSCWoQykl3Y61oeUh8rllnqsmBmX0iyGFmyk1Tz3qwQ8YxsoGlVNlZaTMBk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(86362001)(54906003)(66476007)(66556008)(66946007)(36756003)(6512007)(2616005)(186003)(38100700002)(53546011)(2906002)(83380400001)(8676002)(4326008)(508600001)(6486002)(316002)(26005)(5660300002)(31686004)(6916009)(8936002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlRERHAxbEJ5aHc4ZTlnRWFaRk44V2tZUndvNWdaL3ZVeWROTTlrdS80YU5X?=
 =?utf-8?B?QlhCYzMxZ0ZuR25VOGI3WkFNTDdyK3BDN0VXT1pXbFhmOGFFUnR0M2tCNzJx?=
 =?utf-8?B?aFV3bEd0ejZSbUpZcnFpMHNtQUxReFpGUUhNNTh3aEtTT3UydjNIVjZLRkpo?=
 =?utf-8?B?UEF6QzlBN0RYRVNlU1FPWmpYMmg0UVlCVEZNK1dGb3hqbUZXSHRtNnpqYTk5?=
 =?utf-8?B?WE9lbElVZ1ZianV6aEJUeERkZHNKQW1XQjByYVNIU3FvYVZzRmJKQk9YYXgv?=
 =?utf-8?B?dzVocVVKa2p6RmM0MVBld25MUENmUE96Z3ZyVnFKVHFveVJFRmNWRHJTRUds?=
 =?utf-8?B?SXRiSjhxTzNNckhXUU1YRmNkVENKS3o0WXFwbGg2WWw2K292VFVqaVd3bytt?=
 =?utf-8?B?enF0K1pDYVdhV2J1SWw1V056akJJYnMyazNWZWovUGFlQTVOMk9RdklNaWtE?=
 =?utf-8?B?QW55bEQxWjlIaWQ1S3M0aGtWQ1V0clBXZUlqZnUxYVF1Ly9tOVhGaWdLUVYz?=
 =?utf-8?B?ZFI4Ukl0bnFENW84Y0dlYmU3MlNkcHNBUHNqRTFNd2N6UHlOSnNPd3d2RkVa?=
 =?utf-8?B?UXdTY05uYmsxVHJsYUhsZmp1aDg4c3NjYkJROFM1YXFSTTJVYjY4VU05SUdk?=
 =?utf-8?B?RFZEdFl4cEFwSUtmcmxFUHdDREZjNUhCR3BhcllFc0FIcHhFL0NGRVZkMDFx?=
 =?utf-8?B?SzRGWFo4azA0eEM0TTdNZ1RBcmN1ZXk0ZlgxWlY5OFc1dFg5T1duR2NTdDdY?=
 =?utf-8?B?Z0xOZmIrbnV5SUkvTFBma09kT1A2bElYSlhWeXJWNmVMZ002SitIbzV0WDBT?=
 =?utf-8?B?ZjhOQjRPYlQ2eGRjWFpOTGg5REg4bngrRy9UdDE4T3gvT0x1a0hIWFczanhT?=
 =?utf-8?B?OXhsbEx0S1dEOWVIMGQ1OHR4WnlmLzB4akJsNnBvNlltaUllWjlvS2MvQ2Rx?=
 =?utf-8?B?RzhVL04wRXhvWk42ZVoyb01wVE5rRmo2WE1EdnVyYlBLNGZ4MzhwUVAyME5N?=
 =?utf-8?B?QUNCQ3R0L3V6VklHbHNBQklIdTB6QXFDWEgydmxiNjloUGRCWEhxbUJzOVJo?=
 =?utf-8?B?RDhtVmx3N3JTdHRXNEhRY3FXWnBSbmVKSzV1d1RmbXcwb0RyWTk4UDgzU3Vl?=
 =?utf-8?B?YVdUSU4xelpDYkRkVDNWSUdYL3c0MXBZUFBwOUpnQW9VSE1ZNXlIMG0zdFh2?=
 =?utf-8?B?RWM3eUoxOXdYWXBYcnJzalpyYi9RQnF6QWw3azZqbWFyUTA5TWxKTWRwb0No?=
 =?utf-8?B?cjd4cC9tSUdZTnVnbkdKVit2VTlEK1YyY2s1aHNGaFhrWWt1dEpXQTkwNCtD?=
 =?utf-8?B?UHJuSXp6Ty9tcityWUxROU16dnhUdzdyNE85ZU9NTnhYREx6a0Jaa3NnZnBv?=
 =?utf-8?B?NWNxVG1ySmtWaWJpTGpUcDNiYi95bnNIV2FLVGZqRFBrTWhIUkpaK0pSYm9Y?=
 =?utf-8?B?OU90VGM5bFl1dnI0ZHhmTktjNWlMbHZKd0puTXBDcEluTmd0M2tBNXU1RXNu?=
 =?utf-8?B?TlJiazc3Z0ltSUhGdnBPZHkrNUhTcUx5ZFJYSUpGQ2VaUC9qcWdPQS9vRVkr?=
 =?utf-8?B?VUJqTDAzUzFaeHZrVG8zR1cvYndTenRPbGZQeXA4Z3U5empSUk5uRktQQ1FP?=
 =?utf-8?B?UGFHRU85Rjc0N3VNMkE3RUhLeVQ2WmQ4WFNPZmI1R1VRdENDWjN5b3JuK0VY?=
 =?utf-8?B?S2FMcXM5amQ1WlczdHJWZWRlZGsrSFZERmZZZFdJbDhNS0ZneVp1WnFGNnRn?=
 =?utf-8?B?NUlxTFBuQUJRdGwzaFlaYjFjbUF1ZytHMU9mSXdyNWhYbmFtZThqc2tPU2V3?=
 =?utf-8?B?RGRFUUlJOXliZnNhcVpvb1k0RUFQUFNGdXpteXJ5MWw4UDFDakd2Z1N2cmNF?=
 =?utf-8?B?RHA2R1ZPdElJT0JLZGdEZWpmRHh6N1hIeUFMK2c2ZHpjdVBxdEFEWWRDRGYr?=
 =?utf-8?B?TEFaQlA0dUkwVTJPOEEzWStGQlZ4cGhxVzFldVo1RndhUWlpMXdSeTVoREMx?=
 =?utf-8?B?d2NPYkdMRDNLa0kydCtCd201ZlZPK1lzdE5wem1xbC9tWXFJSkpMTHFjQ2dB?=
 =?utf-8?B?RnI2MGQzemt1Z2RuR1IxeGU2Y2tXU0loK3h1SURwTUx1Z3llRjVnTXhaeGJD?=
 =?utf-8?B?VnZ6eFpKUmw4ekZBQ3dyMUV2ZjZGeUlqNjBzMEt1V0JLaTV0bHJ5UFRSVTNp?=
 =?utf-8?B?OHc0UTdNNzRSZWprWHlqVUo2NG5YbEx5R2FNNit6VG9CUWZBb2UxcW1vOWVz?=
 =?utf-8?B?WnYxbzFFY3pyZ0ZHSnNad2VITFdFTGNQSnR6NXZ5T28wMi9ydkFPQ0hBZUM3?=
 =?utf-8?B?Y0dNaHBhdlFqcnlncmw3SytLbzBwUUp5YnpsOFU0dFhZN3hSMFlDQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fab3e40a-d052-411d-f6cb-08da42e331f1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 08:54:39.0390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAlsJYkbMMCR8+Hi1pOlQSl18TIp84UVndapQ/wGF43n1FxjwFdicTtyivwEBxHrMvbj6S3R2nSHebX18aSuSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5665

On 31.05.2022 05:12, Penny Zheng wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -245,6 +245,29 @@ static void populate_physmap(struct memop_args *a)
>  
>                  mfn = _mfn(gpfn);
>              }
> +            else if ( is_domain_using_staticmem(d) )
> +            {
> +                /*
> +                 * No easy way to guarantee the retrieved pages are contiguous,
> +                 * so forbid non-zero-order requests here.
> +                 */
> +                if ( a->extent_order != 0 )
> +                {
> +                    gdprintk(XENLOG_WARNING,
> +                             "Cannot allocate static order-%u pages for static %pd\n",
> +                             a->extent_order, d);
> +                    goto out;
> +                }
> +
> +                mfn = acquire_reserved_page(d, a->memflags);
> +                if ( mfn_eq(mfn, INVALID_MFN) )
> +                {
> +                    gdprintk(XENLOG_WARNING,
> +                             "%pd: failed to retrieve a reserved page\n",
> +                             d);
> +                    goto out;
> +                }
> +            }

I'm not convinced of having these gdprintk()s here. The adjacent
is_domain_direct_mapped() code is somewhat different - iirc only Dom0
can be direct-mapped, and Dom0 having a problem can certainly be worth
a log message.

> +/*
> + * Acquire a page from reserved page list(resv_page_list), when populating
> + * memory for static domain on runtime.
> + */
> +mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
> +{
> +    struct page_info *page;
> +
> +    spin_lock(&d->page_alloc_lock);
> +    /* Acquire a page from reserved page list(resv_page_list). */
> +    page = page_list_remove_head(&d->resv_page_list);
> +    if ( unlikely(!page) )
> +        return INVALID_MFN;
> +    spin_unlock(&d->page_alloc_lock);

You want to drop the lock before returning.

Jan


