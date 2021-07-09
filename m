Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 391DD3C21C0
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 11:43:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153544.283665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1n26-0004qa-Ag; Fri, 09 Jul 2021 09:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153544.283665; Fri, 09 Jul 2021 09:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1n26-0004oX-6z; Fri, 09 Jul 2021 09:42:54 +0000
Received: by outflank-mailman (input) for mailman id 153544;
 Fri, 09 Jul 2021 09:42:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1OC2=MB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1m1n24-0004oR-F2
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 09:42:52 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f8551a8-df35-4d4c-a8c6-f407ba0c789c;
 Fri, 09 Jul 2021 09:42:50 +0000 (UTC)
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
X-Inumbo-ID: 4f8551a8-df35-4d4c-a8c6-f407ba0c789c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625823770;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0ksuzbvpO1c5eENZgOWZ7/aG9qwF/t66/TU/ry71ASo=;
  b=QGzSRWDbvnWk7i3fRhTSCx7mHenVnaS9jH8MJhJCOPcEWwth8lWFFGcj
   NvJP0k8YL4XRI/SyefldvKDrxcTUVTf5M+EEMvJ5D3MZ9sM86oehd+wJN
   jxBiV+zaxknVuJ+7hoTbqXesvrhgqNIA4Gsz2w+PouuX1TnDvgCoMHxsi
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: eEniMIMRunvOhaxk6jZW5GhByfhdGFx+EJBKorpWusJ6lpGqsRlGbJ/g3ygXtVxs+9iMxHoyaG
 6hAv1sw3+trsdASj6WsRmrHOgqmZdvSYuPPkCSUav35gHfeadgtwsVRdte2LMU4UU+WhoDmgBS
 +cZFT9AbivoFUpKRRDwtGhhgGFZR0xE9tlGTnnfwxH9cpRO6MnpyU0aPh3PizFGn3hR6JfbwTg
 4q+FQAYH0YGvhklRk6VMS/S25EcN+LJ5o8JHG8ri3XpPpyea0El7XU3E/YlYhy6JwURa0+KVU0
 kEg=
X-SBRS: 5.1
X-MesageID: 47911728
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:pQhpk6oTnvbwQr2t9YaQaXYaV5vUL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPPHJXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhOY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX202oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iAnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3QXlsBeot8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVittilG/rRMZ4KAuZkRkIMgjgYJq3M4iFBs/KuZEIMu60vFpLA
 BWNrCd2B4MGmnqK0ww1wJUsayRtndaJGbOfqFNgL3T79FspgEN86Iv/r1oop4xzuNOd3B63Z
 WxDk1JrsAHciZEV9M3OA8+KfHHfVAlByi8dl6vHQ==
X-IronPort-AV: E=Sophos;i="5.84,226,1620705600"; 
   d="scan'208";a="47911728"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJdgaWnaNmWETE/8QT8pdrgqp/4aVRw6Eez0tEU6w3jDO7zDn935P9Nksj+ncaeWhL2Q+aRtMJswRUAFVuZBGnlgzg3RPwEyh+1ieC0eRwCyR4Jp73Aypz4DGDT+/fRkJ55e2pCjYjFvxB8ZIKOSZUT3ga5XMPj280Mxd4X2NYKDwelNyVlT8QB2JoPigNIJ0rMUEu/t4D1W3hajhGzZ7prElM/y/omM63df3hczopQJONNucORYaqyNz9A3CleTfMIAOh8dcaCQosZKo99FQBoCn2hCMSOYvYfc3VdDD0t2EHbhUBoZqxGtQ+fKa5f7so0lDc7R8uHylpDu98hwKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2e9meAlnIBEgl5WbIMQZHa8lBG6LVBBKSxU/RMyg2c8=;
 b=Bg6y1OBQCtm4n+R9JenDrCtycbXPOX8rraGAslDGBc/eNqlJj1ADpVl1lH9SJLtneH4FEgZRZj3HGyzomAbm8ouwHlq1rTIz6Z2xDNaD8gZTt0AnCN4xpa92wL8wmHe7Pz++GDR93kB2UD0Ck2qUUbRt3sSgkbADIAUH+welw8yRUndjFJQJlcEfDGyxrLxgbWaqx7mAJd+BvG23luHegKeL2Xc6lroGkPlmDlNQPCd7UMKI1crpwzZL2OM+MKhazDj9FG9+h/M/JHyjebCenegg7+WPoJJ6328TzMvkPIqVC/dNx2FJ5XxsenneXNETknPkQ1K/IAd6Ke6VjvaPzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2e9meAlnIBEgl5WbIMQZHa8lBG6LVBBKSxU/RMyg2c8=;
 b=Fgo0R0gNnuzukKcLgxJq4lDRZ2+5FSFPCTG+IVakRYK/5I9pCEEIG4/f5SJljvPUCD4c5ly1x5jMAZ7Yc6qe6mdY3iFXLtjuYlbLPaGDoEBka3bEFpSNE2yF/BQlfo9/opl1Vnnbgp+1BmI4w64WJZu+Rb92f22wHBTw+xD5MTc=
Date: Fri, 9 Jul 2021 11:42:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v2 3/3] xen/blkfront: don't trust the backend response
 data blindly
Message-ID: <YOgZ/lzDIlzIxCZp@Air-de-Roger>
References: <20210708124345.10173-1-jgross@suse.com>
 <20210708124345.10173-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210708124345.10173-4-jgross@suse.com>
X-ClientProxiedBy: MR1P264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7b5c31f-adbd-4c23-e8fa-08d942bddcd8
X-MS-TrafficTypeDiagnostic: DM6PR03MB4537:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4537C27E4BF6751F0350608F8F189@DM6PR03MB4537.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FisVEeVO1kTbz7jaG5BE2YfaKNh2MWul3CJtrB11NeMRLxf8Eo7InnGn4PAjWpZ5dXG6LrA2DJKZVG/XBp1vv4/BZo55gGzR/WFeKCzD5/C7swVbDDrRlS7Yc9aR5wWnrPLmWjxSGMceG8e9XQPwBad0NhjyLasPAMY4TrS1tDG1NLIRMF8aELZw0NnhZ6QRFLPi4+uUUvJMAKyhukNBBvOkKRIczzo+HgXiJkoEo/94Fshza42ZfFtRYHxiG4v5VGA8MzAuFwzNdHeHolEj3lPNu4YdagroLJAf7QaLVgPJMgQ55jMoj5bjSKq8C1cKjZG4nVoTFAAGUngINWqhsJyxOr03hS1JyHYOZLJIaARkDUihH3JPVJt60Pm3Jcav7FtSDy2AqnE6H/C75WfB2N+5sMMBtbv/sSwElsCjPS4D4f/30R7RMkNbfP3aZkLdL3X+FT3aUKaOOcmNQPVrgXRDpfDnI/O1FdUKNfiKuHs8YIBEy7PizYZv4u090XbGGj8YOZYBYcBpuKjs+OTSzo48o6IviBha+RfYSwjYVESYXU5zPHzjUeGrs09Iryw8lXbSzI0ugD/aJBX2vo0v1AlGUWzSmvwcZs0dXVi0O2nzWH6QKELYx8zv1QnON7/r1L0V7tdUyxe9kvfMCI8Bdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(366004)(39850400004)(376002)(346002)(136003)(85182001)(956004)(6486002)(54906003)(26005)(9686003)(186003)(5660300002)(66556008)(66946007)(8676002)(66476007)(316002)(8936002)(6496006)(83380400001)(478600001)(86362001)(33716001)(38100700002)(4326008)(6666004)(6916009)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ri9QYnpzekVxY09LZlNmYjJmWmhRcGgwYlR2OUdpSitQV1Z4QkRYVGxWTzBY?=
 =?utf-8?B?SVUyTmtrbFE4UkRDeS9ad1QweUdtSTk1a2doTHB5UVB4TkNDZzg5eWUvczFt?=
 =?utf-8?B?UzlKYkFLdkVMVG91NnFrcHIxZW5iNWFYM3o4SXVUZzMyWjFEK1gzMlExeHgw?=
 =?utf-8?B?cDc1bmZxcTJNK1I4N3g4ZUE2U3ZWdWdUWm1KYm1pWmJUWm8vakdQUzZmZ2pX?=
 =?utf-8?B?bFlTOEEyS0FlbXEwcDkzamV2YUdERS9wY3U0QlRpUnc4cEdJNkd3RmUzVnpD?=
 =?utf-8?B?Z3l2c1pFU284K2tkZ2tIM1RwRGxZdUxPU2RtbkhKcHhUR2VCSWthenhEZUpa?=
 =?utf-8?B?d0JLZHpLTDk5UFlXZGxDWGNudVdSVTRjNmFHbW9STTFYejhDWkVpOTRFcEtD?=
 =?utf-8?B?YWc4SlRqdklhTXFuY253MVBZR3hrdWtHbkFvVlk2bGphTEp2Y1FURlFCa1di?=
 =?utf-8?B?UVdycW0vU1FVWEhGS0tYdDNaQWlEUUJObDdsd1dqYlUvMDY4cU1WazIwOUJM?=
 =?utf-8?B?TlNuZCtPSU9iNUNkdDBtSkZNUDFNZ2NBTElVZ1NWRHJlbmZqTzl1cjNGMG1P?=
 =?utf-8?B?OFlSdVo1ays1Q2NqRHlGbGlVSFFESVN0UWxkY2xhWGRtR1MzMlczVENLc3Y4?=
 =?utf-8?B?cjBCLzR1YlVKR3Z0OERpZlluNWd1VFFJUlVtWTRKZk1TWFc4S1FrUURoZUJh?=
 =?utf-8?B?ZWJtM0pyV0F6eVhINUsra1BhZTIwWnhtNkJkTHBMKzlvMzFYRFlGUzd0R1Yr?=
 =?utf-8?B?KzBwcGR2bEdyQkc3aU16WERqbEtUVTFoSEZnS1NKRGJodGE0Rk9MbEkvaWtH?=
 =?utf-8?B?bzFrNUNUaC9neWo3WXAyR0U1a3dYcm9QOTQ5c01rVElZbXAzK0ZWd2EvQjll?=
 =?utf-8?B?R1JtTno2WjZkV09MZkdRTUtMVTBqOGxCTE5uZTNSZ2JVSXJQeFd5VjhjVS9J?=
 =?utf-8?B?aWYyVlp6OUx4WXBjRitrYTJZNXpYdGVmU0FEK1ZtbjZzQkgzTE51Y3V0aFdX?=
 =?utf-8?B?ZERKRnIwNGpJcFdyYnNiSW1MTGZCYVJJVUk4Y3pjVG9JZVRGL2Ria3lkRkYz?=
 =?utf-8?B?aGpSTW1GanY0V00rbWZyRlI2Uk9UZExKSUc5YmZmTE5Vd0h0dHQ5T0hsazFU?=
 =?utf-8?B?WUVoZVB4SThxbnBrdlNBK3hCV2wvbW5UTFhmRG1FY29xcmhMUitwYVJqYzJu?=
 =?utf-8?B?dm1HTThGOWZZNmJyMlZTMk04RWlhS3hRYVdnUnJxQ3ZDcnBPUUxScU44MDN2?=
 =?utf-8?B?TzJvanhjZlhiVFFzc0t5cm1aR01ZbGN4Uk1sU1FJMEFnQWZSTHd1UndnTTF5?=
 =?utf-8?B?VXFkcVhRZ3huVWxmOEtRaUI1UklyYUZsS2IrSGlwc3lFRWxsTnRCM21WaXZP?=
 =?utf-8?B?clZ3N0gwVDRqakNnU0p0c1pSYXQrekQxa2Fob1hBajZCSDN4b3EyZVpueEZy?=
 =?utf-8?B?VFNBTEdCYTN4VU55U2M0VGJFa1lybEZNT0RHQitOcDM2OUpGWWFMSXFOYldT?=
 =?utf-8?B?aFdLWmIwRmhZRno2dmlEdnd4RHBaZjhHK3czcmJTR1FucVQ1Z3ZZUUNvZ3Bi?=
 =?utf-8?B?cHFPdjJhVHVQNmkvN3N6eEZ1b2xyM1dYZjBsSWx4MVpPMDU4UU5neWorVTli?=
 =?utf-8?B?M3hVSlRxUU9VL0J2c1pOZFU5NWlDQ0t1SUxSbXpRN2lKOHpnWlZJbE1qQjdK?=
 =?utf-8?B?dDlUUTYrSFJ3QTVLa0xITTR6QjkrWWxzZUV4SUZZeVRyZUxSYVd5Tkp2R1Rp?=
 =?utf-8?Q?SxwW5SwxwWwrDWFIOC6CJJtqLIt2NcWm4/cI5S1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b5c31f-adbd-4c23-e8fa-08d942bddcd8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 09:42:27.2365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 523R3wrDUS3KweIVyb+DuSOyioyfv8al4gyStTdgPqjW0d8ZHeLOLnGBtfNBx0dDr3CZFItEKGzBhlMALcqZYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4537
X-OriginatorOrg: citrix.com

On Thu, Jul 08, 2021 at 02:43:45PM +0200, Juergen Gross wrote:
> Today blkfront will trust the backend to send only sane response data.
> In order to avoid privilege escalations or crashes in case of malicious
> backends verify the data to be within expected limits. Especially make
> sure that the response always references an outstanding request.
> 
> Introduce a new state of the ring BLKIF_STATE_ERROR which will be
> switched to in case an inconsistency is being detected. Recovering from
> this state is possible only via removing and adding the virtual device
> again (e.g. via a suspend/resume cycle).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> V2:
> - use READ_ONCE() for reading the producer index
> - check validity of producer index only after memory barrier (Jan Beulich)
> - use virt_rmb() as barrier (Jan Beulich)
> ---
>  drivers/block/xen-blkfront.c | 66 ++++++++++++++++++++++++++----------
>  1 file changed, 49 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> index 80701860870a..ecdbb0381b4c 100644
> --- a/drivers/block/xen-blkfront.c
> +++ b/drivers/block/xen-blkfront.c
> @@ -80,6 +80,7 @@ enum blkif_state {
>  	BLKIF_STATE_DISCONNECTED,
>  	BLKIF_STATE_CONNECTED,
>  	BLKIF_STATE_SUSPENDED,
> +	BLKIF_STATE_ERROR,
>  };
>  
>  struct grant {
> @@ -89,6 +90,7 @@ struct grant {
>  };
>  
>  enum blk_req_status {
> +	REQ_PROCESSING,
>  	REQ_WAITING,
>  	REQ_DONE,
>  	REQ_ERROR,
> @@ -543,7 +545,7 @@ static unsigned long blkif_ring_get_request(struct blkfront_ring_info *rinfo,
>  
>  	id = get_id_from_freelist(rinfo);
>  	rinfo->shadow[id].request = req;
> -	rinfo->shadow[id].status = REQ_WAITING;
> +	rinfo->shadow[id].status = REQ_PROCESSING;
>  	rinfo->shadow[id].associated_id = NO_ASSOCIATED_ID;
>  
>  	rinfo->shadow[id].req.u.rw.id = id;
> @@ -572,6 +574,7 @@ static int blkif_queue_discard_req(struct request *req, struct blkfront_ring_inf
>  
>  	/* Copy the request to the ring page. */
>  	*final_ring_req = *ring_req;
> +	rinfo->shadow[id].status = REQ_WAITING;
>  
>  	return 0;
>  }
> @@ -847,8 +850,11 @@ static int blkif_queue_rw_req(struct request *req, struct blkfront_ring_info *ri
>  
>  	/* Copy request(s) to the ring page. */
>  	*final_ring_req = *ring_req;
> -	if (unlikely(require_extra_req))
> +	rinfo->shadow[id].status = REQ_WAITING;
> +	if (unlikely(require_extra_req)) {
>  		*final_extra_ring_req = *extra_ring_req;
> +		rinfo->shadow[extra_id].status = REQ_WAITING;
> +	}
>  
>  	if (new_persistent_gnts)
>  		gnttab_free_grant_references(setup.gref_head);
> @@ -1402,8 +1408,8 @@ static enum blk_req_status blkif_rsp_to_req_status(int rsp)
>  static int blkif_get_final_status(enum blk_req_status s1,
>  				  enum blk_req_status s2)
>  {
> -	BUG_ON(s1 == REQ_WAITING);
> -	BUG_ON(s2 == REQ_WAITING);
> +	BUG_ON(s1 < REQ_DONE);
> +	BUG_ON(s2 < REQ_DONE);
>  
>  	if (s1 == REQ_ERROR || s2 == REQ_ERROR)
>  		return BLKIF_RSP_ERROR;
> @@ -1436,7 +1442,7 @@ static bool blkif_completion(unsigned long *id,
>  		s->status = blkif_rsp_to_req_status(bret->status);
>  
>  		/* Wait the second response if not yet here. */
> -		if (s2->status == REQ_WAITING)
> +		if (s2->status < REQ_DONE)
>  			return false;
>  
>  		bret->status = blkif_get_final_status(s->status,
> @@ -1555,11 +1561,17 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
>  
>  	spin_lock_irqsave(&rinfo->ring_lock, flags);
>   again:
> -	rp = rinfo->ring.sring->rsp_prod;
> -	rmb(); /* Ensure we see queued responses up to 'rp'. */
> +	rp = READ_ONCE(rinfo->ring.sring->rsp_prod);
> +	virt_rmb(); /* Ensure we see queued responses up to 'rp'. */

Is the READ_ONCE strictly needed? Doesn't the barrier prevent rp from
not being loaded at this point?

> +	if (RING_RESPONSE_PROD_OVERFLOW(&rinfo->ring, rp)) {
> +		pr_alert("%s: illegal number of responses %u\n",
> +			 info->gd->disk_name, rp - rinfo->ring.rsp_cons);
> +		goto err;
> +	}
>  
>  	for (i = rinfo->ring.rsp_cons; i != rp; i++) {
>  		unsigned long id;
> +		unsigned int op;
>  
>  		RING_COPY_RESPONSE(&rinfo->ring, i, &bret);
>  		id = bret.id;
> @@ -1570,14 +1582,28 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
>  		 * look in get_id_from_freelist.
>  		 */
>  		if (id >= BLK_RING_SIZE(info)) {
> -			WARN(1, "%s: response to %s has incorrect id (%ld)\n",
> -			     info->gd->disk_name, op_name(bret.operation), id);
> -			/* We can't safely get the 'struct request' as
> -			 * the id is busted. */
> -			continue;
> +			pr_alert("%s: response has incorrect id (%ld)\n",
> +				 info->gd->disk_name, id);
> +			goto err;
>  		}
> +		if (rinfo->shadow[id].status != REQ_WAITING) {
> +			pr_alert("%s: response references no pending request\n",
> +				 info->gd->disk_name);
> +			goto err;
> +		}
> +
> +		rinfo->shadow[id].status = REQ_PROCESSING;
>  		req  = rinfo->shadow[id].request;
>  
> +		op = rinfo->shadow[id].req.operation;
> +		if (op == BLKIF_OP_INDIRECT)
> +			op = rinfo->shadow[id].req.u.indirect.indirect_op;
> +		if (bret.operation != op) {
> +			pr_alert("%s: response has wrong operation (%u instead of %u)\n",
> +				 info->gd->disk_name, bret.operation, op);

You could also use op_name here, but I guess this could mask the
operation as 'unknown' for any number out of the defined ones.

> +			goto err;
> +		}
> +
>  		if (bret.operation != BLKIF_OP_DISCARD) {
>  			/*
>  			 * We may need to wait for an extra response if the
> @@ -1602,7 +1628,8 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
>  		case BLKIF_OP_DISCARD:
>  			if (unlikely(bret.status == BLKIF_RSP_EOPNOTSUPP)) {
>  				struct request_queue *rq = info->rq;
> -				printk(KERN_WARNING "blkfront: %s: %s op failed\n",
> +
> +				pr_warn_ratelimited("blkfront: %s: %s op failed\n",
>  					   info->gd->disk_name, op_name(bret.operation));
>  				blkif_req(req)->error = BLK_STS_NOTSUPP;
>  				info->feature_discard = 0;
> @@ -1614,13 +1641,13 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
>  		case BLKIF_OP_FLUSH_DISKCACHE:
>  		case BLKIF_OP_WRITE_BARRIER:
>  			if (unlikely(bret.status == BLKIF_RSP_EOPNOTSUPP)) {
> -				printk(KERN_WARNING "blkfront: %s: %s op failed\n",
> +				pr_warn_ratelimited("blkfront: %s: %s op failed\n",
>  				       info->gd->disk_name, op_name(bret.operation));
>  				blkif_req(req)->error = BLK_STS_NOTSUPP;
>  			}
>  			if (unlikely(bret.status == BLKIF_RSP_ERROR &&
>  				     rinfo->shadow[id].req.u.rw.nr_segments == 0)) {
> -				printk(KERN_WARNING "blkfront: %s: empty %s op failed\n",
> +				pr_warn_ratelimited("blkfront: %s: empty %s op failed\n",
>  				       info->gd->disk_name, op_name(bret.operation));
>  				blkif_req(req)->error = BLK_STS_NOTSUPP;
>  			}
> @@ -1635,8 +1662,8 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
>  		case BLKIF_OP_READ:
>  		case BLKIF_OP_WRITE:
>  			if (unlikely(bret.status != BLKIF_RSP_OKAY))
> -				dev_dbg(&info->xbdev->dev, "Bad return from blkdev data "
> -					"request: %x\n", bret.status);
> +				dev_dbg_ratelimited(&info->xbdev->dev,
> +					"Bad return from blkdev data request: %x\n", bret.status);

Since you are touching the line, could you use %#x here? It's IMO not
obvious from the context this status will be printed in hex base. Also
bret.status parameter could be split into a newline.

Thanks, Roger.

