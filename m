Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2689C43634B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 15:45:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214399.372925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdYNZ-0003OS-QL; Thu, 21 Oct 2021 13:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214399.372925; Thu, 21 Oct 2021 13:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdYNZ-0003Ml-Mf; Thu, 21 Oct 2021 13:45:09 +0000
Received: by outflank-mailman (input) for mailman id 214399;
 Thu, 21 Oct 2021 13:45:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qr3f=PJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mdYNX-0003Lu-F8
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 13:45:07 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f325ece4-9260-4074-bc43-23d58a20a330;
 Thu, 21 Oct 2021 13:45:05 +0000 (UTC)
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
X-Inumbo-ID: f325ece4-9260-4074-bc43-23d58a20a330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634823905;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=72kUg2ZZHwRaqGqivp7QR/Jib4R4k2Ey793AOqDKVSA=;
  b=IiAYgMNHritLNtLD6FxatpBJpZdyAUVwO14dKxPh4JQ2qzI6YeYMdZ6e
   OlufrTmq+na/kaMWzwSB41MrBgTHm+uVnNoaFMjRxSMx1qJNNgAh/Nh/b
   yqOQjKpELmqktckl13PWeD73saabzooDY0z+R6612njT0qIVIs2vBOf0n
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xGuOyD9paJCAlaZEVzqBD955AJo93agTlmHSefSNYwt6UIqLbxV9ZSKv2MIRC4aqc5EaRTC3qQ
 Gn+5nBMDxGEZUDqQTzIAXE8r6v/2Ff0jOuvQRePPB105rW+P+DHlO4cPEdw8XFSRDQZPPZrh4j
 sfsrPScGkIUl+LgTk6AwS9R9SGhgihEJt2yIZb6kW3oGp+ebXxb9S3RxKnD5YLE+BhsRXJasJn
 jQ9zaRrjfx62Mj0qbv81fiLMf7Oi5FielnaqLhx42B7izLs2tyMREMOFvOdRUwRLXXWfBvkFcf
 Ygu7YsQ8JVHXlvmZAYxbvZUZ
X-SBRS: 5.1
X-MesageID: 55742970
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lgwmnK/6lBJ1K0kk0NoXDrUDFnmTJUtcMsCJ2f8bNWPcYEJGY0x3y
 WIbUDrQbqyMY2f0LdgjOtzgp0NS65aEmt9hG1E/rSw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrZj29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhX0
 O9kuqWgdz0ZJ4KUpsMtfCJ8HSBxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFgWhs3JERRZ4yY
 eI8ODxuTBHybCZsGXk2NMwCoM2Wp3ngJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqEh/DNtTP2XpoIE7+1/eIsh0ecrkQWAQcTXEG2otG4jFC/QNNVL
 0EI+isoorM2/UbtRd74NzW6qnOZuh8XW/JLDvY3rgqKz8L8/AKxFmUCCDlbZ7QbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8iyuIECcsPVE4VTYrFTUi0/bYhI8ygUeaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2G30+MCYJuIhzkCOBDj9t1ImDGKwT9XwsQCz0BpWEGqOorBtV
 lA/kM+C8PtGM5iJkCGcKAnmNOD0v6jbWNEwbFgGInXAy9hP0yL8FWyzyGsnTKuMDiriUWW0C
 KM0kVgJjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwPhLPgj2xyBdzzvpX1
 XKnnSCEVyty5UNPl2Leegvg+eVzmnBWKZ37FPgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnekm2
 403Cid+8D0GCLeWSnCOqeY7dAlWRVBmVcGeg5EGLYarf1s5cFzN/teMmNvNjaQ+xP8L/goJl
 1ngMnJlJK3X3yCcc1rWMyE4NtsCn/9X9BoGAMDlBn7xs1ALaoez9qYPMZwxeLgs7ut4yvBoC
 fICfq297j5nE1wrIhwRMsvwqpJMbhOuiV7cNiapemFnLZVhWxbI6pnveQ62rHsCCS++tM0fp
 by811yEHcpfFlo6VMuGOuiyy16RvGQGnL4gVUX/PdQOKl7n95JnKnKtg6Zvcd0MMxjK2hCTy
 x2SXUUDveDIroJsqIvJiKmIop2HCex7GkYGTWDX4azvbXvR/3a5wJ8GW+GNJGiPWGTx8aSkR
 ONU0/Cjb6FXwAcU69JxSu85w7g/6t3jo65h4j5lRHibPU62Dr5AI2Wd2ZUdvKN62bIE6xC9X
 ViC+4cGNOzRat/lClMYOCEscv+HiaMPgjDX4Pk4fBf66Stw8ObVWEleJUDR2ilULb8zO4I52
 +Yx/sUR7lXn2BYtN9+HiAFS9niNcSNcA/l26MlCDd+5kBcvx3FDfYfYW33/75y4YtlRNlUnf
 22Pj63YirUAnkfPfhLfz5QWMTaxUXjWhC138Q==
IronPort-HdrOrdr: A9a23:Ky3g9qqdgT5f5NunnoxyjyMaV5pOeYIsimQD101hICG9E/bo9P
 xG88536faZslossRMb8+xoSZPhfZq0z/ccirX5W43MYOCMggqVxe9Zg7ff/w==
X-IronPort-AV: E=Sophos;i="5.87,169,1631592000"; 
   d="scan'208";a="55742970"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aa4t0YHCb+CCEVOnlbE0OMFhtT8yU2Ciszexxkm2vshwM4/nk0WdB0kxRFuHMMnE5WG73FmIcJFcZivit3MQuASeg4s9kyiYc1gsnjt57NwduAF8OjYVTgsMrxYtOQSo7yRewYLpyLIDHebZsrIlE2EYJX9J1SLD/hUzQ5QEr5tHrTpWBprOSKPIHsbK0yeqvs1meTklCArE7xWNspxv64w8GJ6Q/S2jqLaQKLZNv/iwr/5iU2GN4S6XeQhOtQUkpq77Ur6A0/pWb60catSIz/hmg6gDuIumeNCZuXanqDTDFiRhGZEOKb3cOImkbvtgqwnfznVnxavudMsOZ4jGsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1V3W6thCWTMKPgbT153Lf3fvyqIStFPaYavshmnXRc0=;
 b=V2rd1hGKqr8XrCpXKtl0AMKRlULdZoIXPuONiw5Bq4rccGjprHEiZXr3tiYouQMPq3OhrslKnRxfD30xLH+cNh9QpAu/ow00h2CmuG4Su8tPheV2KQziXMaI5whOurNcEr5WlYacVW6MLv9Loi2OSNOg/xKOVkKqVvwH2lhMdpV+Q/+ecZUVj3oqMN27YGTG/JeZvlbHah+n7s7j+DMJIEEKNM9Cef1zMgDX8CiXoL3LniPZ1fK4N3Qx16PCTfbN+YAvDsX9hXqtCTaUWC7qMrhhQmLFabq1FbtCGtKKGg7YbUfIQ8NNwiSfOCWHcanFNUMrfvBSHkBl5WRerHdrsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1V3W6thCWTMKPgbT153Lf3fvyqIStFPaYavshmnXRc0=;
 b=GnSMVBgwEcncgzRzcB55Gw5BFrBBomi1f0AIKy+0yL7rG2/n6+XIEx5GDhIkfUO9ZDBR5FCUqLJ7A6n+Z/WQoNNH4CtYjltyxlck4Lq7YWLfMpBzFXPUjxCIR8BpJOycxVo5F/TNRfg9mCm1Gd6XC5Alsesbjm2oaiku/fKu4So=
Date: Thu, 21 Oct 2021 15:44:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Marek
 =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	<xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>
Subject: Re: Ping: [PATCH] x86/xstate: reset cached register values on resume
Message-ID: <YXFuuwvFKbgkavSB@MacBook-Air-de-Roger.local>
References: <20210818113017.454251-1-marmarek@invisiblethingslab.com>
 <45de5185-b514-8c52-6922-4c587818c698@citrix.com>
 <3125583f-b965-7746-d833-c197857cd7d7@citrix.com>
 <6adf41a6-8f05-8ead-2b12-e922939955da@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6adf41a6-8f05-8ead-2b12-e922939955da@suse.com>
X-ClientProxiedBy: LO4P123CA0122.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee7be495-eb65-4520-fe93-08d99498ea2c
X-MS-TrafficTypeDiagnostic: DM5PR03MB3147:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB31472FA8E5779CAA974996918FBF9@DM5PR03MB3147.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AYg6CAnMgfX2cRrp2IqOF4LF6hwwqzcFS3VCofVqlZevPKw2sgsV9R5uxf7b/vdYll7NQbCXFgvKT/r6pV06cGKUa8l5MBDjOADqxnvF4m+KjTJI8sJMK5DIWU3ezSuXDhwjGnqS18vdMGJiF8qnTTCGYrOpFFSvQdY/IIhtzJwb6mnG9Kd2TgB69vQSc88Y8aECQLxpMjZJap5IQMw6atZ+mCJW9gSOCZgjadGouwuZUG7vSZUfgjJxa5FSNICYyl8sQGTHSQLGfdQi+BN4xhyL9MXKffu/jRM3dzJl2zstHxmPDDJdXm+2Klz2YbdrXtRXik5SdlDlSLAUnE0wj2+mGGUtWUqJuq3OctUt0qImXhNTycKTBng6kLxc6ZVElXdef2WvA/l0m8oHDE4bsNwDGYa4OUJJrHH5uD4Sc4K6rxG5bq9ITq6YG3WACTDCOaYXIJyv4iA7eOeAJHERbzhr/rSJrHrJUXaOJCUMY8ZENBxEwcFwV1s6sNm+ChCbq+iVmvA+ceAbZrAM42Gi8iBfEm7tO+HJXqiF70FNCZi8LMtFPmyQ4rW79BHP49MR+wqqL47xYULFkYgS30ZMWpBlhq2SAP6iITqbBgjoh5RBLmB5XbDO5DDVPBi+aVD3hLwqukeK1llsCucyvR/2Kw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(8676002)(316002)(83380400001)(66946007)(53546011)(4326008)(956004)(66556008)(38100700002)(26005)(85182001)(186003)(6916009)(8936002)(66574015)(2906002)(6496006)(54906003)(508600001)(9686003)(5660300002)(6666004)(86362001)(82960400001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dllpOVZhS2s2b3RpdXVrbm9kQ0JNNFRkUlk1R3VLUWN0a0lNMktQdXpUUmh6?=
 =?utf-8?B?emVRTHdsK0hyYllmaHpaN3Rac3hCU3IzdkhpK0dKTVhrSmNRcU94SnpSY01o?=
 =?utf-8?B?U0RIOGpMYlhJMWJuY3JUVHIxMFE4R1dqME9pUXA2cHA3SFBpVE9tQnZIZnZl?=
 =?utf-8?B?eVMwMW5yMTVnZk4yRjdQR3pxQmM5WlhxTndjeGlYdjVRUW1peGtPSUJYMWFv?=
 =?utf-8?B?L1lGT0VLVEt4QjMxODRtVnVwVm5FYlpGeWhhNExvWVgxZU1kSXlrTThiVHJY?=
 =?utf-8?B?NzdvOWVLMEJ4SlhyVi9JbXlaWjQ1dXU1ZXUwY0ZETzVhQjkzaThCdSszWjN6?=
 =?utf-8?B?NkIxZnROU010dVFteDM4V3IyU3lTN1F4M0hIcXNBZEhUb010VDgxQWdCTEMx?=
 =?utf-8?B?RGdLVVBPamRPK2xDWVZkL0taRklMeWhEMHdWamtJSXZDVHJyR1hLT2RFVTdN?=
 =?utf-8?B?cUFZdWZjeUZBNVkxYkNnaGU0dVlYd0tPYld3SWNneUFEaklmZFlhT080bjli?=
 =?utf-8?B?SFRFdHBuMnNRTFpjWUd4ZnBsaUduYXdLTWFpWmlHSFR2WWRPSWJxTFkxaXpH?=
 =?utf-8?B?Ym41cHBHeG5VYmZSVi9rZERtUU8wL3oyQ3NPTEZoSCtkNTJDK1hSUElOSVJC?=
 =?utf-8?B?cnpHdWordG5GandxK1BQZ08yc0xGcEg4dGpXOUZyQmV0NWZub0trTEFsQUh1?=
 =?utf-8?B?U1VwM1o1bjk2c3JCdlJGTXlGYXVRZkR0VWVIOWJJcm9tV3Rlb0doYk1QUlpQ?=
 =?utf-8?B?TFlKbzg3UjM0eFUxbDlGdlpBM0ZZcDZFemY2YTVYU1lvVkhaVytJbTUwNHRo?=
 =?utf-8?B?YjI4WlBmKy9YbUVCN2xsTktXbG16ZStDR2cybUt6TWN1bnRFQWJnUUYrOThv?=
 =?utf-8?B?VERaa1Rtck9JYTVrT2pPQ2NVN0RzSkR4VndZTFZKL00rcjlETWczRmpEbjFN?=
 =?utf-8?B?dTVWOVpQYWFIQmtRMGpSN21vZ3B2SzQ4UjFzZytlYmdhUGVaeGQ3NTZ2OStY?=
 =?utf-8?B?c3dHc1Naam1KVlcxVEJha09lTEJTeSthajRJRWRpV2l2MCt4ZjcrOWxJbVVo?=
 =?utf-8?B?Vm52RmtFSGxuazRIMGw5V0ZsTVRieDhiNWdEa2pIMldsTUZjYU96K1VoU1p6?=
 =?utf-8?B?Sy9BM0tFUTZpL0plR1hualF0STE1QXQ0TWREY2dCb051REgrZG5JaUYyY2NI?=
 =?utf-8?B?UC9laDlaam90VXpLQXNRbU9FL1l5clZqdEVnTTd6ZGwzVlhZd1V6eE9Vcktr?=
 =?utf-8?B?bnZCVnpySkp4aEE2K3dUcndvSE1IeW5rMjhPS201NW96WGFnQy9zYjg0cnIy?=
 =?utf-8?B?OFg2R2dxV0VPdk85NnNGZzIrKzAxY0hTY08rckxjbUV6MmVBQkM5eEpSZEdm?=
 =?utf-8?B?SkdaMlRtdDJwL2VtNzVmVGFCejZnckllSi9yUXNqdVFFdDFvRlVacFEydXpv?=
 =?utf-8?B?anlDREZHK2Z4T3VlVTVMaTZQUjdBbVlaMEw2djBRQ2hweHBiNUtRNW95REpD?=
 =?utf-8?B?bHpka1BYbUUzQ3dXNXJyWkFWNGE1aURVdkFjZm9Cek00TVhoZTBrM3o3R1lU?=
 =?utf-8?B?V0dlOWkyZXd1b3JrSTlVNEUycDBlRHN1YkYwblFQSlkyM3JpNTZDYnh4T1U2?=
 =?utf-8?B?Ri83bm4vOEVSZ3YxaFpqaDdwbi9FZWZFMnVaMTFXYXhxbWxkZ29zYmJMOEx2?=
 =?utf-8?B?UnVsTFQ5MHhkbERVNlY2bzdaSTBYdjZBSWhoZXVSWTd4OGRzdkZRdi9XRnZ2?=
 =?utf-8?Q?DtRGtjT+mdVnfdl1tZmRbKoL1nuMoH3JmvSZNv/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7be495-eb65-4520-fe93-08d99498ea2c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 13:44:33.5906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roger.pau@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3147
X-OriginatorOrg: citrix.com

On Mon, Oct 18, 2021 at 10:21:28AM +0200, Jan Beulich wrote:
> On 24.08.2021 23:11, Andrew Cooper wrote:
> > On 18/08/2021 13:44, Andrew Cooper wrote:
> >> On 18/08/2021 12:30, Marek Marczykowski-Górecki wrote:
> >>> set_xcr0() and set_msr_xss() use cached value to avoid setting the
> >>> register to the same value over and over. But suspend/resume implicitly
> >>> reset the registers and since percpu areas are not deallocated on
> >>> suspend anymore, the cache gets stale.
> >>> Reset the cache on resume, to ensure the next write will really hit the
> >>> hardware. Choose value 0, as it will never be a legitimate write to
> >>> those registers - and so, will force write (and cache update).
> >>>
> >>> Note the cache is used io get_xcr0() and get_msr_xss() too, but:
> >>> - set_xcr0() is called few lines below in xstate_init(), so it will
> >>>   update the cache with appropriate value
> >>> - get_msr_xss() is not used anywhere - and thus not before any
> >>>   set_msr_xss() that will fill the cache
> >>>
> >>> Fixes: aca2a985a55a "xen: don't free percpu areas during suspend"
> >>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> >> I'd prefer to do this differently.  As I said in the thread, there are
> >> other registers such as MSR_TSC_AUX which fall into the same category,
> >> and I'd like to make something which works systematically.
> > 
> > Ok - after some searching, I think we have problems with:
> > 
> > cpu/common.c:47:DEFINE_PER_CPU(struct cpuidmasks, cpuidmasks);
> > cpu/common.c:120:static DEFINE_PER_CPU(uint64_t, msr_misc_features);
> > msr.c:35:DEFINE_PER_CPU(uint32_t, tsc_aux);
> > xstate.c:36:static DEFINE_PER_CPU(uint64_t, xcr0);
> > xstate.c:79:static DEFINE_PER_CPU(uint64_t, xss);
> > 
> > There is also:
> > 
> > traps.c:100:DEFINE_PER_CPU(uint64_t, efer);
> > 
> > which we *almost* handle correctly, but fail to update the cache on the
> > BSP out of S3.
> > 
> > 
> > For the APIC, I think we have issues with:
> > 
> > irq.c:1083:static DEFINE_PER_CPU(struct pending_eoi,
> > pending_eoi[NR_DYNAMIC_VECTORS]);
> > 
> > because we don't defer S3 until all pending EOIs are complete.
> 
> As your planned more extensive rework appears to not have made much
> progress yet, may I suggest that we go with Marek's fix for 4.16,
> with the one adjustment I suggested alongside giving my R-b?

I think that's the only viable solution in order to avoid shipping a
broken 4.16 so we should go ahead with it.

Thanks, Roger.

