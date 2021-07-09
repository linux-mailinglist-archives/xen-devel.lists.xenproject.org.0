Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0F53C20E3
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 10:34:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153459.283525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1lx8-00088O-RS; Fri, 09 Jul 2021 08:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153459.283525; Fri, 09 Jul 2021 08:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1lx8-00086U-Nv; Fri, 09 Jul 2021 08:33:42 +0000
Received: by outflank-mailman (input) for mailman id 153459;
 Fri, 09 Jul 2021 08:33:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1OC2=MB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1m1lx7-00086O-B7
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 08:33:41 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5cea9279-3b2f-41af-a263-f0b3f5e81ac4;
 Fri, 09 Jul 2021 08:33:40 +0000 (UTC)
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
X-Inumbo-ID: 5cea9279-3b2f-41af-a263-f0b3f5e81ac4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625819620;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nngl7V5K6Z5vKANX18zotJU3yl28ufC4P5mgv3z8cyQ=;
  b=fVBNqUIqh463RgAK2Dr4xfha2R3GVhOEA9Ie04ZPbGMpPPpQyOs4i2Xq
   bPH2RLrtME5rFvAuar+mSRELBnkJb50UVAhgyvU/+n7JCz0Z7klXp5CvS
   LV9w6Q1m5fM6zTKznYk9i/vTglOtYf9CFAgVvcnRAcg9dJH9X9yqy51xZ
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZkysGMRK8DJPx81GA2D+JhgcLE/ulq3r/iE06h+t65Y5y1rU7deQ2E9HAMmeuHDZ6qBdjfCF8z
 RBD9SGsZ0k48Tsg16MFfSXloWB+lBDgFT18W0vKQGXvyZ2UmDYxvOy/Kz9r7FzM34TTSGKaQBu
 QS7euSL//wrlrpHDk3nWbtH22wKy+YJXFocazMdLIKpzUnnWBhXwElRNQsGbFhjy6in8fmsa56
 l+LdVRUFU3LMMR6RpX5SPfTyU4vzZCzD7x4/Hx3AYVXqGxDd/wj+oyeZ3a+fotZUoZ11sUoqOQ
 bkk=
X-SBRS: 5.1
X-MesageID: 47615989
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QcVp4q3oVcMXlEMhFoZYwQqjBU1yeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhQdPj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzM4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kDEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 TxiiZlG/42x2Laf2mzrxeo8RLnyiwS53jrzkLdqWf/oOTiLQhKSvZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIbRd3jUC5yEBS39L7t0YvErf2VYUh77D2pChuYdI99WPBmc8a+d
 BVfYHhDK08SyLfU5ix1VMfsOBFXRwIb167qwY5y4uoOgNt7QVEJn0jtboid0c7heAAoqZ/lp
 D524RT5flzp5wtHOlA7Nloe7rBNoWKe2OLDF6v
X-IronPort-AV: E=Sophos;i="5.84,226,1620705600"; 
   d="scan'208";a="47615989"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHog8tom7xr0w4MJlBWXuUL1FOQQKZ68lFxKyrsIPpub8ygkcTBJ75R1QoIVnM78zr2qD3z+n9nhy9KVXZTnuFezNlSIftTu76hcXlAGJZNI3LVaC37rvE0agRBsTTbqUuCiYN4LLaCCvU4CEZwYiZ6/fzebFE8eNcHEVpbxiR7zQf4vfsbklPOAS9CRcneBrr4qGzwjXmOBL3w8cUB7fPDJ06A56Zw8gOnM8TnyBS13phoY8CfXkKdG6VjogW1e64ORCx5ZbeswI2MBqaiQY4KJgtmtB6fHD0o/ByYnMuMUcBNYvJgAmsfkKfRVfdwgU2tS7JpWcXr5NCEAEFsIqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9KKl21UAmL/jws+5CN1kY0kBERKBHzSIvi3oXfE8CA=;
 b=NkCE2W+GOmD16BdQ+su52iwVhtk1M5Eq1hmiQKPKf0ESneNpAs00VogtJhpY6VNLkMnxx7Vp4svN5+mMMepMh4y1HP9wanJyvpKap7TI4mVP9AuQRGxRy7Y8n/DkXR1esQtuATahxDtzvojt7bGwvW4HZw/bmt3VhWNOteMhpZjlYcLT+nzXflhhTVFIWaztct39akC3C0YxtrbzBApturjUFTkHw9URUefEUb2RatRh0q+UpYV6O+xGNpbNo92Bw5DEtQlJioLDiec35xrkaC/jBNFvoV1tgPJ04MF2Pw+dOMP2opIDLZlUQTtNarfFxPl/g0kqsWXXfExofwxvGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9KKl21UAmL/jws+5CN1kY0kBERKBHzSIvi3oXfE8CA=;
 b=f9gIfuXeqkdrD/ZR6eHoo7cr35CbnfGTKfsmXfqFAlZXKdAKfgIjINUpbE0kBDIZM7V3WEZKJM/a5U6sO+PmOusJoa3Qbc/bDdupVrLrenr+1rw/LHe7r9vOEz8kPGhQM75SpczRmpyT+4Lnr9CuQqGGMaX+UvNQXk66RpHm6wQ=
Date: Fri, 9 Jul 2021 10:33:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Jens Axboe <axboe@kernel.dk>, Jan Beulich
	<jbeulich@suse.com>
Subject: Re: [PATCH v2 1/3] xen/blkfront: read response from backend only once
Message-ID: <YOgJ1GZFoKhRPHLX@Air-de-Roger>
References: <20210708124345.10173-1-jgross@suse.com>
 <20210708124345.10173-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210708124345.10173-2-jgross@suse.com>
X-ClientProxiedBy: PR3P193CA0055.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 954ae81c-7c55-478b-8abe-08d942b439f8
X-MS-TrafficTypeDiagnostic: DM5PR03MB3291:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3291785A49076C14898A07978F189@DM5PR03MB3291.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bseVXSgx/ipDXjCVF4Kbvnch1BvEMZkbt7LV/kZH0VCDUaKec2k5tymt5XRVNyZOvjXnRShUKTkc9I0fE0HnmxKFUboEtyUhbAOEHG8DUUKjFVIHeYG3lENIQWYxwZHBQN5BmsH675wB25rP+3r3V9XD45ShwuzkzQqWUJxT+hBqO1OQHYbzZUQP/7ACjUZycUD1SWt+R2/Zc8UZSDJsynkJ9rh7HpXECuPXUyOg1iDmH+3I4UaTibrkB1hsjmzqBpcHFkeumcksmvsQFz0zeGSOZsEwMvxcc9UvSos2d+iQx4cZaPylv52+YCGLAU7uiXyvrLy9KN00cZI84r59lTPKPCJOEjwcrSua1z1HxmXk3z4Omho54QCAH/Nh5n/EjMB1Ng4FBBvFTMqE7JT8JSpIvAzEY4aZn/6remh2S7clrZhpKnUQvOUSejS5sH60Of9kmbeZ1KO1FLEwzatTL3HIjwlrXins0+JwhH5tA8Ah1IDzcLttEcqZ8jj6QT9Nvxnu8qAfWPR7n6HCgLL2VrnnNr6t1u+gXf8LfKZnsiA0TTs2C+bM4QLY2Fio37x3x/DOnNcY4/X19wVZYg7ONVVMZApvkghYubOwGWGCA/aSt5kyof9txzXsKUBhKQx/EoSfU4XgQ1igD7OYk0935Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(346002)(376002)(136003)(39860400002)(396003)(26005)(6496006)(6666004)(8676002)(86362001)(85182001)(4744005)(2906002)(316002)(478600001)(6486002)(83380400001)(33716001)(66556008)(66946007)(956004)(54906003)(186003)(6916009)(4326008)(5660300002)(8936002)(9686003)(38100700002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmE4bVlzdnhNczFKY0VTZWpORkpiSzlkbFNiR3NCTWthM3crM3VxcWN3RjNr?=
 =?utf-8?B?QXVJWlRDSjRJR3NTUld4eDFBcTg3QVRpZGl5cWpqWEZmUW5FSWxuL2lWUDhB?=
 =?utf-8?B?dDhoU2tIREtKYjk2Tlo5R1lTVzVQUjd4VWxFL01DOHhuQUxKL3VCd3g4WFZU?=
 =?utf-8?B?QW8xeUc0anh0U243TGF1THNsTTJ4eVhrMUNLRUJoTFl5L1N3Ui83RVVjZWc5?=
 =?utf-8?B?UE94ZndnVGU0K3dQRjJORGNQU3pGa0tQcVB6bHVvcCt3ekFhRThCK1pyU0th?=
 =?utf-8?B?WE9KK09ZZGFOdFljcmMyWnlOdEJDRmY3MTI3NzZHVjZwQnllV1c5SnNlY1FF?=
 =?utf-8?B?L3hLT1dlVkU1TUNxciszVURyY3VySFcrb20zOXhQSjN6T1VzdFdFMGsvbnh4?=
 =?utf-8?B?UDkrNGVCMTRiR1BNcS9IeXB5L0hBNjlHdDhZK3lFa2kvdUNpc3dERVlGRktP?=
 =?utf-8?B?eE1RemE4bll5c0x3aDAxRlpNcjd4Y1ZyRWozYVVUTFdmQ1FPZVVRSVZURkpu?=
 =?utf-8?B?MDFrQTM0NmkzVk5ISVdMWExSVzdCeGFkT2h3VmlDNVRtZDl4TnREZVNHeWlF?=
 =?utf-8?B?aVI2QUliTjZUVjk3bWFEV0ZBUkRubVZwRWZpYk1RQ2JacDZ5ZlNSL0tnNzNO?=
 =?utf-8?B?bWdTT3hUaU9yVmlNWXZGREVRVEdFdlp1b3hxeUtuemhvVzV0OVdwaTdCWG9Z?=
 =?utf-8?B?UTBGUVVHbzdvWHdLaGRnOTJTcThCS3hWa1k1bE9XRERzbXBCaXR2RkZkcDJo?=
 =?utf-8?B?ZzMxZ2MwYWRlY2dSb0xpaTd4QmJUdXFiOVhpVldrVkxQbmVjTmdsaW9MLzJL?=
 =?utf-8?B?ZDZwQjhGYzJqU2VyM0hVUjVxalRoeU04K1dnWWdRdDNNS0d5dmZLUk8rWkJu?=
 =?utf-8?B?Q0ZiQWtSUXZla2h2ZENrd3JmWDBpNzduSHJObUg1b2ZLc1lWdUIrc1RqU0xa?=
 =?utf-8?B?REZDcVJGeE9NY0dvYVpjN3dEVG9OM1A4bWpnaEMrS1ZHK2pMQlR6citGYktw?=
 =?utf-8?B?QTFXV2dVSDU5dU5ZMmk2T1FxMk5YdXBUc2F5Q25GYjFKQlh4RmFuL2t2RFJK?=
 =?utf-8?B?cGNwQ2pGRFlycmduR251UnU5ejFiVUUwTUMxd0djN1RSNGVFOUUyZnpxZGdw?=
 =?utf-8?B?cERsSUxxRlpqRTdidUt5dDhEZzNWVDE3VVl5aVRtZUhZMFpRVlV1Nnpyc0Ew?=
 =?utf-8?B?VmtibWZmTjVtZnFHVjJCNkY5d2pjT2NCVnhpdUlJL3NCRFg0TkI5VTZlbnhh?=
 =?utf-8?B?OS9sNGdHVldMSlNidGo4NXAzZ2FwZThRRHhXbEF4L0VRYUlKTElOREZiaGtW?=
 =?utf-8?B?T1pqWkFXeGREYWcrM2MzYzc2QzJ2R3JwajZRTlE0U1FTRTRoWGJBbDdSL3Zm?=
 =?utf-8?B?OWJLd3hiTnJlSkpWWWlIemViNlN1UytjMi9KenhmZlkwVTFuZVM1VXR2M3ZF?=
 =?utf-8?B?TmM1Q2xYT1hQdXFsWGl6RUZESFZlTkhaSHRyTlBKdzcyQTNrdHliaFI3Ymxt?=
 =?utf-8?B?U0hvMVV2WUU5Y1grSTFMcUNLa2F5VksvRHhtRDk4bG1PcDEyWnBvOHAza0pG?=
 =?utf-8?B?U1B2Vk0rTVVYVGlUZjRQbHJIc2RjeUl5MUFJZ1JjdFc2V1RyR1hVaGxhQnhl?=
 =?utf-8?B?L2tLMUtraFFBRVJFUmFLTHhUaUF3RUJRenpXdEttdHV6MGllbkFyUWh6b3FS?=
 =?utf-8?B?aUJNTDl4YStWeU0vN01wQVRsa0RYR3pLV05OVmtFVy95Tk9mRE90ZUpDUkI4?=
 =?utf-8?Q?REjZlDHpQNp+dXoYbsacdb+k9P4AnVW8FVragAp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 954ae81c-7c55-478b-8abe-08d942b439f8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 08:33:28.4807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHJV/N8lmKeRjFr9WqyfE97MUrfTdcWQsfjrzzJBhMU5RqyEiFfv9uQZoKve06nSTM1F7DXqFJFfvZdEtwHWyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3291
X-OriginatorOrg: citrix.com

On Thu, Jul 08, 2021 at 02:43:43PM +0200, Juergen Gross wrote:
> In order to avoid problems in case the backend is modifying a response
> on the ring page while the frontend has already seen it, just read the
> response into a local buffer in one go and then operate on that buffer
> only.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

