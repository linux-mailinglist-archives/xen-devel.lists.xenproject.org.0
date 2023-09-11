Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF14479A788
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 13:11:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599328.934689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfeoZ-0004Af-R6; Mon, 11 Sep 2023 11:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599328.934689; Mon, 11 Sep 2023 11:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfeoZ-00047q-Nh; Mon, 11 Sep 2023 11:10:47 +0000
Received: by outflank-mailman (input) for mailman id 599328;
 Mon, 11 Sep 2023 11:10:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfeoY-00047k-4s
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 11:10:46 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da3aa39a-5093-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 13:10:45 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS8PR04MB8102.eurprd04.prod.outlook.com (2603:10a6:20b:3f3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 11:10:42 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 11:10:42 +0000
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
X-Inumbo-ID: da3aa39a-5093-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mv75hjXd0fflfj2rE7P/4a4LibjFSJ4Q/I/XulFAkqysYx2+r3w6o/obp98dwWIg5nhryDRVxKOVMKnkT255WdyhqSSgdd8QD4UvTkqvafNdHVRhGKdhGS8wNgCwSD8Kk2oPzn/drIW3z/GTKgKxbbMdkG1060bROuDCdokSR/SfyI9sVw+kjaW8obyec0Rw3rif7zQpqiDqhOUEyEvDkJ1X3exNn+DCKh6yw8UQV1xhx9V3gQ6VaW4A10ta6RU7WZdb6EX4jx964jscgif6dKtR5m26uMT8svWcQpU4Wd5+hXMX6ESgCrkYah149cr3qg0PeazAJtcoOoLKiVkQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PW4OEFenjSDfSeRq67zrxYXWqAuzxgaqeXKtRk/IPyU=;
 b=lv4YVJSRpkcJ9Q5a12ScSObB4GWRG9qVrihknJMUmWsySwLaDUCOUO31arzn2+kJKFWlwlhQu7jNF8kTc+sTefdOOxySMz2WDVhhc1wJvZZdz8OFcleAeKhJ1B8KDV2yKvS/EEGJpTFzZKSY0ZdQ2g75RYqZzzhwOpC//nJBIihvGsWBkh4uRia7wvapYhPUhzraqH3JFFEw9vCOZtV8PPgL7FIIwLxQQWjwmEvFt81vlAEUgo8UUdKtQ+QufRw54Ad4mEQw4AX4DzIvzRCVjIYPQBqVxy28TRm8t/gIuCwGwyXiQKNFSRhX76tw/7PUDPJIVDKPJRjuBJOzPkKm1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PW4OEFenjSDfSeRq67zrxYXWqAuzxgaqeXKtRk/IPyU=;
 b=kedT9Fek/3sGyIdiqlcqLnGNUY99TmPnFYtKs/H+ANXr5VTGz5Y6KwGtG02D33OfNEGaibZvlI9Qluhw4PjnaoIHBSLgwNfJxX7B9iKBGafQy6L7aCFdm3lpeISW6+D2xdkdJQp5ypGz8X1CfqKy6E+rZS5mHFndF4F//UCBO3rKhGQ1DWldPeyt+QD1+jrnDYFYsayjGzbgsh3CRymzW0FmrTRvQkLisuRGpLAcf2bLnSICW/CXVpcnYwW9Qn6PXL8MGz1ubbMKIoLvlJSP8Fjc6Zo15M+7HKsbf1uElc0+v5zU+NmkYmg/LiONwRoTmHBLEtydUwPYEhHj0VwyZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3831c923-0344-7823-8373-ce4c1b48efde@suse.com>
Date: Mon, 11 Sep 2023 13:10:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 3/4] xen/vpci: header: status register handler
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230909021647.558115-1-stewart.hildebrand@amd.com>
 <20230909021647.558115-4-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230909021647.558115-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::16) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS8PR04MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e56dc6-abee-4c34-b187-08dbb2b7bcbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iPBKvllzfTS1Khm60SM+/l9cmFGhEYslOO+HI+4CTOhxya7PT3fMrWHk3z+Nkprbc/mf3LU9OGySPHDEWzer+9QeZmEKY8f943WA1WB8sPaLeJmD544fviDTCg4M6wDfbzi8kqRsPa+l2a558WsPJfOw/btPKJsUJPCFNmkUXhWS3eoGrgqBg7BBARAb0XTDYzmDFYZWAavheqk5wARZ1M009aoWWBRz9LEtKV24qxwAIVmxYXdZF6dgQHpgaAhFBPjG64aYuCwJEYNIdU6qtoteEHWQ+GSqu8Wvd50vxEBFBMkbNingkRyl1ukv4Bqhp6+6B9ZThzgJXREAtFnx9Qz6yMXXscqbXCJr8Cj+gq/hLqqdj+/hcJFN+PEFGAgV/cUrIn3ezweH4pmQkhnUynd3Qg5rnxM0iMZeuW3eM5XJfl8uAstWX26KJYKlPmvB48OWe7sMkc3grSG9XFKofM5cxuujxzXBH4KgpNMEy/+ZCfQ42wIKHKsZbkwM66axbD+2pOydPTKrNY7Xo/FheqR3a71HfFas3q+mUh+p/4/+2uVayrfj2g08qAmsBekOR4L5Hr9KfPxn4QuI+KsQBwFhM9AImdt5LP6uSA53N6ORScoROqsIOUMnqKJf+ylI264dTlSrVnnHzIS/thHqWTiBEZ0SAXPCdhJiurWK4Px6gLn6Ks/DWuKfuHjwFqiB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(39860400002)(136003)(451199024)(186009)(1800799009)(2906002)(26005)(316002)(41300700001)(6916009)(54906003)(66556008)(66946007)(66476007)(478600001)(4326008)(8676002)(8936002)(5660300002)(31686004)(66899024)(6506007)(53546011)(6486002)(6512007)(36756003)(2616005)(83380400001)(38100700002)(31696002)(86362001)(45980500001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cm9zcGd6Zm15eUR3cm1ma25DYW9uUXBVcmQ2QlJ3M2JmV1ZRcDFRYTdMeFFm?=
 =?utf-8?B?eHdrT0hWN2pyUjl2NkJBem11U1ptMm1PYkd4aEFwWjN4bXN5YitoZEJnUzRZ?=
 =?utf-8?B?SXhKWVNFOUUrbHh4UnhUd25ITVMxald5aVM5WVVwb2tiNjVnK1BkNUpiZVJT?=
 =?utf-8?B?S2tNcGc5MW5UWGs2SjhZbFpNQWtZNjJrbGpwamR4b0NLZnhpdmFlWWRLbGJ2?=
 =?utf-8?B?MVBORURLdnFMZDd5ODZHZEt1eko1bVFzeG12eGF1VU5WMkFkeEFvb1JLSUs4?=
 =?utf-8?B?cVdjRmxVME9manV3cVdya3p2RlJaVW1DcFlOQ3cwRWVjS29XZWxtK0pjSlc1?=
 =?utf-8?B?SFBIOG5KS3MvbG5FOGdWMTdRSmtlOVFrYi9LTDhydHp2ODVWYnY2VFJ1d0JX?=
 =?utf-8?B?dkRML2VvREhGN0lNSlZHYmlWWHF0SjlVeWNucjJLMm9pZU1ha0hBRlpWaDFO?=
 =?utf-8?B?elg0YlF6VTZ2c3BNVTVjRmppRmhFN3N6Y2FuYm1LVThZVmhrQnZ5ZFZXcExL?=
 =?utf-8?B?VzMxeVVJNks0YUhNdE53dTExVW5YYmdJdGV4dDJqZWtnNUpSUG52UWFOMXdk?=
 =?utf-8?B?cEEzUTRyQjJOWFZMbTNLV2Vxc0JQWkZWR21OUG1ZWUJIa04vaVhhanVXQzFR?=
 =?utf-8?B?MTVVQ2hCdWhMWDVXV1BGN2dkY2hyRVdpckxBT05taEY3aDNEUjNkQ3BRd0dW?=
 =?utf-8?B?SnpoR1Bpdmx1VjV1bnlEMlcyMDRJMllJdXY3TGc5RmszWDFLdGJwNDhkNmp1?=
 =?utf-8?B?WGxkaDI5cE45VmJMeU9SRWsxQUlFNUwyamZuY2xUTFpiTU9UMU5mTUNKMXAw?=
 =?utf-8?B?ZkxhVitKU2VuZVp4V2huUzhRVngyMWh3Q0IyZjE4Nk1zWVNhQmduV0tKS0Mr?=
 =?utf-8?B?NzhFaFI5bzJyalNRMzdRMHR2b3B3UlEvbnNwNVl1cTAxaXMxY2kxcGRtc0tS?=
 =?utf-8?B?R281T1RsaTAxQ2hOeU1GOHU5d1E2R2lFcVFhaEJBTlNOT2JBWGZXSHVNbm5H?=
 =?utf-8?B?ZGIxS2FwbUJja2xob3Uvd2V0NmNGL2w2dmRjN1ZPRXgrNllsUllUL09FMGtp?=
 =?utf-8?B?dkQ0dmJ0RWFUamU5bDlpdU5icXUwVjM5Yyt3ZnY0YnpOU3hERDE0VUhheW5O?=
 =?utf-8?B?azhmOWluWXJ2ejBRQXdJOHE4SWd5ZFdlRzFnN1V3N0dNbitSS1poWC9IMVRm?=
 =?utf-8?B?cDRpRWk2YmY4Z0RUK0RWdlNpUTdNTVhkL2FnS1RnSjVxSXF6UDZkem9heTd6?=
 =?utf-8?B?TGROM2tZeGtTRFBQcDFwYVA1RzZJMnJUeEx1T0MwdVMvZzIyemVNK29lRUNq?=
 =?utf-8?B?bWpVNFpiTUx1YXg0aFVHaUVxK3NINkpzZTdtRWFmT0xIK2xwazU4VTVOMExL?=
 =?utf-8?B?WTdESW9OVGhkRTJBZEVBaWFPclB5dkNDN0FkdnNEQVBKaEdyOGJSdStQVXB4?=
 =?utf-8?B?RFJzVjZ6NnMrWmdKRHkxaEN6dllhd2RPZTloMHM5TE1kd1F2cml2d0FzdS9j?=
 =?utf-8?B?ME45M3lYUGlSRUQvdHdtNlFjdnhmckxHNk9EWU1ZS3hKZHdFa09zNGR4RVlW?=
 =?utf-8?B?bjFPQXNCem9IRVNxb2NtWGhmdVc4OW16ZTVPUHdCVXp6VWMyaTRIb3d4UU1s?=
 =?utf-8?B?YWFmRUNUVm0wd1JvaXY0SlNScGlTd0VrWW9mUkJtS2FKdjgyM3hYaEtaMEt4?=
 =?utf-8?B?TTZiOG50T2ZDeG5uY0JkYXl2T1M1ZEx5dHFIRDlkZFBzYURPUVFnb1l4b3o5?=
 =?utf-8?B?ZWdNYnpGRFZ4RXNrVHBJTjB4QkFZUlFtZDk5a01sb01tbkRiQlFXMHRzUkdQ?=
 =?utf-8?B?Y2VIZmFPMmlMVzhxWlJna0VlSW5KUTcydmRhT1V2S2tzTGRMZTZBVkNpVEUx?=
 =?utf-8?B?a0ErcTBqcmwzSG40WE1wN3dTcldiTlRVb0xGQ2lRTXpJanVYM09nWEFCN0kv?=
 =?utf-8?B?Yys1dGMrU0kwVnNSRDdmWkpKK1ZrVXpGUGNWdmNjTVFPaXprK0ZvdGVHTUcz?=
 =?utf-8?B?QTJScmd6cFF1K0U3Q0lQajB6ZWhGc1lYbURlSzRqNkIvRDFKRXJBbmxacmdJ?=
 =?utf-8?B?bUo0WmlmRjJxRmIyQ3hVb3lsYnZBdERCYnRuT1BMbE1hbWFJaVBCbTE2Umxz?=
 =?utf-8?Q?UkUPYgVpb9mOfaU2Yrhv8UwnL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e56dc6-abee-4c34-b187-08dbb2b7bcbd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 11:10:41.9705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqaLLzhGdb7/u0iwRCQR7idqsPOi82vOpW2GV7YbZ/j6OJNgLfDmv24+fr4gZXKGMmnw3Y5KxuMr+DfFKwHSXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8102

On 09.09.2023 04:16, Stewart Hildebrand wrote:
> @@ -544,6 +545,18 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      if ( rc )
>          return rc;
>  
> +    /*
> +     * If mask_cap_list is true, PCI_STATUS_CAP_LIST will be set in both
> +     * rsvdz_mask and ro_mask, and thus will effectively behave as rsvdp
> +     * (reserved/RAZ and preserved on write).
> +     */
> +    rc = vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
> +                                PCI_STATUS, 2, header, PCI_STATUS_RSVDZ_MASK |
> +                                (mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
> +                                PCI_STATUS_RO_MASK, PCI_STATUS_RW1C_MASK);

While not formally disallowed by ./CODING_STYLE, I think this kind of argument
wrapping is bad practice. If an argument is too long for the current line, it
should start on a fresh one. Otherwise at the very least I think we'd want the
continuation to stand out, by parenthesizing the entire argument, thus leading
to one deeper indentation on the continuing line(s). (This may even be useful
to do when starting on a fresh line.)

> @@ -155,7 +165,8 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>      /* Some sanity checks. */
>      if ( (size != 1 && size != 2 && size != 4) ||
>           offset >= PCI_CFG_SPACE_EXP_SIZE || (offset & (size - 1)) ||
> -         (!read_handler && !write_handler) )
> +         (!read_handler && !write_handler) || (ro_mask & rw1c_mask) ||
> +         (rsvdz_mask & rw1c_mask) )
>          return -EINVAL;

What about rsvdz_mask and ro_mask? They better wouldn't overlap either
(requiring an adjustment to the code you add to init_bars()).

> @@ -407,26 +439,25 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>  
>  /*
>   * Perform a maybe partial write to a register.
> - *
> - * Note that this will only work for simple registers, if Xen needs to
> - * trap accesses to rw1c registers (like the status PCI header register)
> - * the logic in vpci_write will have to be expanded in order to correctly
> - * deal with them.
>   */
>  static void vpci_write_helper(const struct pci_dev *pdev,
>                                const struct vpci_register *r, unsigned int size,
>                                unsigned int offset, uint32_t data)
>  {
> +    uint32_t val = 0;
> +
>      ASSERT(size <= r->size);
>  
> -    if ( size != r->size )
> +    if ( (size != r->size) || r->ro_mask )
>      {
> -        uint32_t val;
> -
>          val = r->read(pdev, r->offset, r->private);
> +        val &= ~r->rw1c_mask;
>          data = merge_result(val, data, size, offset);
>      }
>  
> +    data &= ~r->rsvdz_mask & ~r->ro_mask;

~(r->rsvdz_mask | r->ro_mask) ? But maybe that's indeed just me ...

Jan

