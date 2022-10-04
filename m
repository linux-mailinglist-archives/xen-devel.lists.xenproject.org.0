Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B9F5F44E7
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 15:57:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415558.660160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofiP6-0001Zq-SF; Tue, 04 Oct 2022 13:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415558.660160; Tue, 04 Oct 2022 13:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofiP6-0001XT-Or; Tue, 04 Oct 2022 13:56:12 +0000
Received: by outflank-mailman (input) for mailman id 415558;
 Tue, 04 Oct 2022 13:56:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AV+7=2F=citrix.com=prvs=269045312=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ofiP5-0001XM-Bq
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 13:56:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48590a00-43ec-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 15:56:05 +0200 (CEST)
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 09:55:49 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB5289.namprd03.prod.outlook.com (2603:10b6:5:24c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Tue, 4 Oct
 2022 13:55:45 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 13:55:45 +0000
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
X-Inumbo-ID: 48590a00-43ec-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664891765;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dfdStoyO+h5MNLXSV7IWhaBB7yGjFbW519k6WdhACk8=;
  b=VKe+jUMNmA7EktCHhAhsZp+ya88riNIuaesSSWwtk4/0V+A/+RSmAx6w
   DddbG0+JPrVyh1ypBir4+61T4biUI8PGVP2dc+jL0SjVh/Duh9Dv9QDlM
   7Jb+qb7TGjonRXHYsY9pbJn2i02wnx7i/30c9jXT+4dEZttUS2ITGszRm
   Q=;
X-IronPort-RemoteIP: 104.47.55.103
X-IronPort-MID: 81590465
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qhZuma4T+l5yuck74BjcSQxRtCLGchMFZxGqfqrLsTDasY5as4F+v
 jFMDW2GPa7fM2Dzed5+Otjj/EpXupeHzdRlTwQ5+yFnHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvymTras1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPewP9TlK6q4mlB5gRiPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5HC111y
 ewqdQwUYxal2sfmzJGfbrJF05FLwMnDZOvzu1lG5BSAVbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGLl2Sd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iL1276XwX2mMG4UPJvmrKdHhVSw/Wc4FU0ycEK5i9yk1mfrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/I+wBGAzOzT+QnxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+pQSiaPCEUKSoHenUCRA5cu937+thr1VTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPdLNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:NecAOK6plCC0IhbR9wPXwVOBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A30QaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgrf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQS/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpbzPKN
 MeQv002cwmMG9zNxvizylSKZ2XLz4O9y69Mwc/Upf/6UkUoJh7p3FotvD30E1wtq7VcKM0l9
 gsAp4Y6o2mcfVmHJ6VJN1xNfdfWVa9Ni7kASa1HWnNMp0hFjbkl6PXiY9Fl91CPqZ4h6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.95,158,1661832000"; 
   d="scan'208";a="81590465"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKxmS9myChunW0/pdmuytCF0nzPs9VVvxOArGSieF5R4clYAqMoWjHis6lALYrEDL+iKpBcl7zaTWYnveNlDTE+DCh27BtEuMK+9KUqwix1A5hObSRFQAarFj6AbDvkG6FLgbq2l8JAwsGfMxpC4ROfnEudjJ/CFq2jppOYYrBV6x6x1VS52UrWFnq/p7yYvKiClXEsBVueKX4yEh7CAtiuBMEixVItdNyQw/decdGulK6Ut4AnZulfDTvc387TOW3nT5Gc7DbIDcXUYcxA9QSTtFw4f3rXBkOeqEyCX8da9I6uRlJMgBaOMjzh7B95kbZ1DEm0bbiwa1lD6QVNB7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYSnlllqaL3Sw6jUTiMk8Dpoap57tZWhKEnvmSz0SGU=;
 b=C04Vg3SFPo4qtY276Ydkh0VCMF4dn3j7Rg60rGeuycjKmgDwyelW6NYauJOcC7q/QCnU1O4U38HiyfTIQrnnslZspXAnCzzId/2BvZnbAFj82ezaQX67fXK8NeBT7Dsp1npF7PF+d6iUN2qJ2aaOXMUGPuh8FXzv3QwsSrk9mNyZh6IEH+I0TqT9vzmfyHy3Uch0InQ2ID84JzvMl11doaC0/KJGcQriFPP9utoR3NPkWnsIWKKi9Kp/M6bFsOLHbEVXH0/DiFgeXtPrITXii2hrTvVeH/3jwWKHaeJxY+RF29S6K7MLQLOjfVTPsuu+w2yL1ndTB1NTD2EQX6TXTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYSnlllqaL3Sw6jUTiMk8Dpoap57tZWhKEnvmSz0SGU=;
 b=BDwTvw7NKV4AreLrpQv9BeIFbQdM8ZnENAeY8EAuLwPxkPDb8+r4AQK9y81Ym0tkOq5Q8PK2t9JEoqAqkKG+4ByjwtCpmpv+1DHH2mELHQHiBwe40itZ2rjOSZjtyEuXIOAkSBwR07FliqVHn4R3b901o3ex6sUInEFgxZ37RDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Oct 2022 15:55:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17] x86/efi: don't translate EFI memory map MMIO
 regions to e820 RESERVED
Message-ID: <Yzw7Ww1s+Ru6qXZf@Air-de-Roger>
References: <20220930141737.67574-1-roger.pau@citrix.com>
 <e3235c0f-5964-0f95-fcc0-bcc44bf9d784@suse.com>
 <Yzv8lpnf28aXgQQM@MacBook-Air-de-Roger.local>
 <ea544e76-0dfd-4f24-89ef-25265f7b049a@suse.com>
 <YzwkXh+8xzbCZdkO@MacBook-Air-de-Roger.local>
 <2d49fdfa-bd76-0469-0840-6260c5a8ff48@suse.com>
 <YzwuJTOtcIopeOlm@Air-de-Roger>
 <5c0f68e5-145a-1616-a128-a2b1a602c1bc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c0f68e5-145a-1616-a128-a2b1a602c1bc@suse.com>
X-ClientProxiedBy: LO4P123CA0372.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: 45feafde-de58-4a9b-f481-08daa610222e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t/atnNW/Z5HZ24jtK+qwjOgNBu3ou2+zN1LwuRXhL/P/54wjAEz6CkxVtfyPyRHyiFT9cBQZvSWQPMOCpUEbLtNabN+BTNQJWg4v16eZpp/O8mpdkq0nuNj9KLA7uvdI14Fp8pWMPFAtAesB7/LwOWu8Y6lGv22QSztlehrmWDN+UmSrqEUM5RYxaa3nBpp3exUIpttqEYojbEnBi2rWSDne0M/f9inUStHGOzwujQLfG1eYaGvmr2xvVhO1YiklLPNSfy+7dJtbuBvl/pd4mZQdcA62vtsrP0QxyRC1l1xFe89rfaFHcmim8HugYWmtmnaJqKcLaJIjHtqw9DIhE1Z2luwkIkW5ovy8ag76T1nqQPN+T/xbjPa9Q9qcgTBSJcLW/m4f+Xt3d21X2A3hS3XxGl6jGi2Lp3jCi3bq1RKf37GRho1GyIpxAF3Uu6jC9H+mi+Gs2MlX46WsZL9u5vcxhqgfSwjrRz6MxtjfwtmUvMUmFPcPKzVNnRfgEv7LT1swvkl/Oof0LFej8AB+G09qzEBB4mxXS9jK8de16bLH7hOyXUOJdoOv1T6yKP+JtSZx3Arm8qIHFo4sAIseB/enE/xMLYkb4G5si2mV5F8qr59566QAqFix9g2/3FTJ6i8z71wZakHn7NoYQrbMdF+t1xayZ5d3tyCylsy1kKYzCgJBwlTKNUJhHxhP6BxO0cjTxQ0MYKe5KwUpmHh0Fwd2aMCcJK+xvizt8i1nuH/yGY6AcISCPkNl2vBzk9BT73lvelkWvJOmmmjsinCkQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199015)(8936002)(41300700001)(2906002)(38100700002)(478600001)(83380400001)(6916009)(85182001)(66946007)(6486002)(6666004)(66556008)(66476007)(186003)(5660300002)(54906003)(6512007)(9686003)(26005)(8676002)(33716001)(86362001)(53546011)(316002)(4326008)(6506007)(82960400001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXNLOFp4UWpVZHRUSDZZTVhrOUFmVlVlMnQ0QkJSTU1yZXQzcU04NFpaYzBW?=
 =?utf-8?B?cVZNNXRaaDQ2eUNyRnJzR0JQdEcrVHJCRmo3ZGFPODRmMkFSRU1BcmNORDZt?=
 =?utf-8?B?QkcxU2RheTZxcXd5UTIxcVJRbG9YRzlxQzUzVUJzWlVBLy9Jcmptc1Y5aUpo?=
 =?utf-8?B?NjA4SkpiaEdVeGxjRU1nNWpMREUvSzAzU0ZvUXZ2ejVXS3N5ZHFSVWZ0OHZK?=
 =?utf-8?B?VVZVWFJIQmw1YmpEc252S20vNnBRdkFMM0NqYUVzMFVUODdvNTN5S3Q0NGs1?=
 =?utf-8?B?M1VQbU9rV2tDUm9QQjgydE1IVnp0VndWdWw1Y1QrOExRMHdETWpCWC9TTW9O?=
 =?utf-8?B?Y241Ty9vRExicENmUktFNkg5WHAxaDJOcHo3Q1JJRjltdU01SmpTNUpmSnk1?=
 =?utf-8?B?N2ZmaGVtWjl1Qkdta2o2ZzV2MEU5SkFsdWxPbVBJamJwWGFIK0xSR09DU3dZ?=
 =?utf-8?B?NFFqK0ZWeWQ4LzlhVFdrR2FaWGZueStpNlYvS3A2MWt0WGdGclZXVFBHeURh?=
 =?utf-8?B?bVR5WWdVcWJnbTZhaCsxU2xkTFFkRjNsaHMvNzliWVhVUVlTSU5xcEw4NWRR?=
 =?utf-8?B?andxTDJwSTdZNG5OYkVqaHNxUk15Tm5VV3dvL0wyQ09CUlErTlUrL21jSEJ1?=
 =?utf-8?B?OExUcUJrWlU3RXc3NThHNWl4NGtKT3o5eVBQcjB3Q2tQS2hITHZUWWdiL29m?=
 =?utf-8?B?b1RCQlF2eHFhaURpeVdTQmZ3Z3RFbEZaR3ZST1daUzRoU0I4aUlRbDBCaUJp?=
 =?utf-8?B?RGxvMGJrMk9RZkh2ZGd0RWVDT0h5ZUIwVkZGUUh1cHF0aXJMcE9DbldOMURk?=
 =?utf-8?B?aXE3TS9NQXI1dms0UURqTkJRTTNXUzl4SUxHbjBLQ0IxYUtiTDBZQllzcHh0?=
 =?utf-8?B?blRjRlQ5TmZOcERINjZTQlcvUHhQemxlNTZZZGFHaUh4bGVFMWZndmxRZ0w1?=
 =?utf-8?B?S1ordG15YjI5dkl2Z1RoU1VjSjZXUDZNY01GZFFITGt6c2JPbUZ5bStKaFpo?=
 =?utf-8?B?SXExZ3pFcGc4L2Rkc0E4L2hPNjQ0VDU0SmZqbmgwQmtCc0NRL3lHMXkvbW1P?=
 =?utf-8?B?b3Z4anVQL3hMT3lEUWNXYTU2bEM1VkxTVVZjMXBXVjZEUUl6YVE5VnN4TnZO?=
 =?utf-8?B?M1Arcm1Qei91Q1RQTWNvNHRRRGxZQ0VyS052eE15SWt1ZEc2VE4yTGY5Yzda?=
 =?utf-8?B?bTdSbUtPZTRsZ0l2RGttTlg2OHhOY2JxOVBFZ2daTGJTVTErVXB2ekJLeE9I?=
 =?utf-8?B?akZ6Rm5PY1BIZEtzUHdnaElic0M5OHVEWUI1QzdpZjk5RlpGOGRBRmRyVXla?=
 =?utf-8?B?bnFPL3pSNU0rTnVQVm52d290RGliR29samp4T1FNYTNjeE91NjhKem5ESnhG?=
 =?utf-8?B?akdFbzd0cGZjNFV2QnpXV0tNb0w1aThtU2JBeDlrQ0J0U3R3a1VyR0ZWSm1S?=
 =?utf-8?B?bitsMGwydVMwVHNKWGNvZU1UL0ZiVTh3Q0VXOUxhOTJJU2czdGxaOVQrVzRv?=
 =?utf-8?B?YmtpaDdOSVM5Q3RVd05JY1JCVTJ6K0N2bGZOMVpMbkM5TDdsR2NnVG1UVVNO?=
 =?utf-8?B?TmJ2K1hHdSt0RkYyWlJhKzlmeEhxQUZIL1FMc0lYZ21yRDV4K3hBaDdiZXA0?=
 =?utf-8?B?SWpJRzNSRVlWRFBFdFJzdWJWOU5IYlBWWFBYQnFsNWR6NXpiNlBLVm9HczRN?=
 =?utf-8?B?MlJDUC9BRnIrd0Q0NjJNcmNxZHgvSVhRaVI1TGJKK016ck41ZzJyTStTTUR2?=
 =?utf-8?B?VThaL0FtODA4RmJPaEJFSEFWSysvekVyTVE4cmJsRERzS2dPSHlrakptcnJR?=
 =?utf-8?B?UFE1dU9PR0EyNFpBTVVNdkRVMU00SVd1MnEyL1pJSjB1NjVCWnpwelFqSEZa?=
 =?utf-8?B?QTA2THcvdENDdloyZFdybUxsZm5Kb2NMdkJJRXhhV0UvbGhTS05tZm04bjVO?=
 =?utf-8?B?QVVlbEVYUjJPelozdlV5bUlETXJFT2haUUk4NlBBZThoZzhuWU1UWCtDN3Js?=
 =?utf-8?B?eW9JVGtzbjJuTitnSytqcWxxaEQvSFdxUGlqWDhzcmFpQU9nekxnSHBwL1Fh?=
 =?utf-8?B?MkxNOGUwN3Y4NXJscDc5SEZKbTlvbFpmWWJFMlFjazZCN2tyazFzTDRNQTVy?=
 =?utf-8?B?UkVVN0VBaDBJcmNCQitTNG9kaUZLTEc3QzhKTVpzT3QxSFFwem1BMFpGT1ls?=
 =?utf-8?B?Z2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45feafde-de58-4a9b-f481-08daa610222e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 13:55:45.2504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sI93bCXDBLNNlQ1cKZt6/8venp++sEETQcDwP62Ch16y5x83t+k9k5hKorYf39jgM8PVChzbF639iLgEyKSCug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5289

On Tue, Oct 04, 2022 at 03:15:02PM +0200, Jan Beulich wrote:
> On 04.10.2022 14:59, Roger Pau Monné wrote:
> > On Tue, Oct 04, 2022 at 02:21:20PM +0200, Jan Beulich wrote:
> >> On 04.10.2022 14:17, Roger Pau Monné wrote:
> >>> On Tue, Oct 04, 2022 at 12:40:10PM +0200, Jan Beulich wrote:
> >>>> On 04.10.2022 11:27, Roger Pau Monné wrote:
> >>>>> On Tue, Oct 04, 2022 at 11:01:18AM +0200, Jan Beulich wrote:
> >>>>>> On 30.09.2022 16:17, Roger Pau Monne wrote:
> >>>>>>> The EFI memory map contains two memory types (EfiMemoryMappedIO and
> >>>>>>> EfiMemoryMappedIOPortSpace) used to describe IO memory areas of
> >>>>>>> devices used by EFI.
> >>>>>>>
> >>>>>>> The current parsing of the EFI memory map was translating
> >>>>>>> EfiMemoryMappedIO and EfiMemoryMappedIOPortSpace to E820_RESERVED on
> >>>>>>> x86.  This is an issue because device MMIO regions (BARs) should not
> >>>>>>> be positioned on reserved regions.  Any BARs positioned on non-hole
> >>>>>>> areas of the memory map will cause is_memory_hole() to return false,
> >>>>>>> which would then cause memory decoding to be disabled for such device.
> >>>>>>> This leads to EFI firmware malfunctions when using runtime services.
> >>>>>>>
> >>>>>>> The system under which this was observed has:
> >>>>>>>
> >>>>>>> EFI memory map:
> >>>>>>> [...]
> >>>>>>>  00000fd000000-00000fe7fffff type=11 attr=800000000000100d
> >>>>>>> [...]
> >>>>>>> 0000:00:1f.5 disabled: BAR [0xfe010, 0xfe010] overlaps with memory map
> >>>>>>>
> >>>>>>> The device behind this BAR is:
> >>>>>>>
> >>>>>>> 00:1f.5 Serial bus controller [0c80]: Intel Corporation Lewisburg SPI Controller (rev 09)
> >>>>>>> 	Subsystem: Super Micro Computer Inc Device 091c
> >>>>>>> 	Flags: fast devsel
> >>>>>>> 	Memory at fe010000 (32-bit, non-prefetchable) [size=4K]well
> >>>>>>>
> >>>>>>> For the record, the symptom observed in that machine was a hard freeze
> >>>>>>> when attempting to set an EFI variable (XEN_EFI_set_variable).
> >>>>>>>
> >>>>>>> Fix by not adding regions with type EfiMemoryMappedIO or
> >>>>>>> EfiMemoryMappedIOPortSpace to the e820 memory map, that allows BARs to
> >>>>>>> be positioned there.
> >>>>>>>
> >>>>>>> Fixes: 75cc460a1b ('xen/pci: detect when BARs are not suitably positioned')
> >>>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>>>>
> >>>>>> In the best case this is moving us from one way of being wrong to another:
> >>>>>> So far we wrongly include BARs in E820_RESERVED (_if_ they can be
> >>>>>> legitimately covered by a EfiMemoryMappedIO region in the first place,
> >>>>>> which I'm not sure is actually permitted - iirc just like E820_RESERVED
> >>>>>> may not be used for BARs, this memory type also may not be), whereas with
> >>>>>> your change we would no longer report non-BAR MMIO space (chipset specific
> >>>>>> ranges for example) as reserved. In fact I think the example you provide
> >>>>>> is at least partly due to bogus firmware behavior: The BAR is put in space
> >>>>>> normally used for firmware specific memory (MMIO) ranges. I think firmware
> >>>>>> should either assign the BAR differently or exclude the range from the
> >>>>>> memory map.
> >>>>>
> >>>>> Hm, I'm not sure the example is bogus, how would firmware request a BAR
> >>>>> to be mapped for run time services to access it otherwise if it's not
> >>>>> using EfiMemoryMappedIO?
> >>>>>
> >>>>> Not adding the BAR to the memory map in any way would mean the OS is
> >>>>> free to not map it for runtime services to access.
> >>>>
> >>>> My view is that BARs should not be marked for runtime services use. Doing
> >>>> so requires awareness of the driver inside the OS, which I don't think
> >>>> one can expect. If firmware needs to make use of a device in a system, it
> >>>> ought to properly hide it from the OS. Note how the potential sharing of
> >>>> an RTC requires special provisions in the spec, mandating driver awareness.
> >>>>
> >>>> Having a BAR expressed in the memory map also contradicts the ability of
> >>>> an OS to relocate all BARs of all devices, if necessary.
> >>>
> >>> I've failed to figure out if there's a way in UEFI to report a device
> >>> is in use by the firmware.  I've already looked before sending the
> >>> patch (see also the post commit notes about for example not passing
> >>> through the device to any guest for obvious reason).
> >>>
> >>> I've got no idea if Linux has any checks to avoid trying to move BARs
> >>> residing in EfiMemoryMappedIO ranges, we have now observed this
> >>> behavior in two systems already.
> >>>
> >>> Maybe we could do a special check for PCI devices and allow them
> >>> having BARs in EfiMemoryMappedIO, together with printing a warning
> >>> message.
> >>
> >> Right, that's one of the possible quirk workarounds I was thinking of.
> >> At the risk of stating the obvious - the same would presumably apply to
> >> E820_RESERVED on non-EFI systems then.
> > 
> > One option would be to strictly limit to EfiMemoryMappedIO, by taking
> > the EFI memory map into account also if present.
> > 
> > Another maybe simpler option is to allow BARs to be placed in
> > E820_RESERVED regions, and translate EfiMemoryMappedIO into
> > E820_RESERVED like we have been doing.
> > 
> > I will attempt the later if you are OK with the approach.
> 
> I might be okay with the approach, but first of all I continue to be
> worried of us violating specifications if we make this the default
> behavior.

In any case it would be the firmware violating the specification by
not hiding those PCI devices, Xen is just trying to cope.

Xen went from not checking the position of the BARs at all to
enforcing them to not be placed over any regions on the memory map. I
think we need to relax the checks a bit to match reality.

Thanks, Roger.

