Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6803F9080DD
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 03:43:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740277.1147310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHvyY-0008I6-2W; Fri, 14 Jun 2024 01:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740277.1147310; Fri, 14 Jun 2024 01:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHvyX-0008Ft-Vd; Fri, 14 Jun 2024 01:43:33 +0000
Received: by outflank-mailman (input) for mailman id 740277;
 Fri, 14 Jun 2024 01:43:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OutG=NQ=oracle.com=martin.petersen@srs-se1.protection.inumbo.net>)
 id 1sHvyW-0008Fa-6o
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 01:43:32 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8084ff22-29ef-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 03:43:31 +0200 (CEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E1fQfK010219;
 Fri, 14 Jun 2024 01:43:12 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymh1gjvvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:43:11 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 45E0pne3014361; Fri, 14 Jun 2024 01:43:11 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3yncexqe84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2024 01:43:10 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB5755.namprd10.prod.outlook.com (2603:10b6:510:149::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 14 Jun
 2024 01:43:08 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 01:43:08 +0000
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
X-Inumbo-ID: 8084ff22-29ef-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to
	:cc:subject:from:in-reply-to:message-id:references:date
	:content-type:mime-version; s=corp-2023-11-20; bh=83/oQlKqI0WIri
	uOwqQN/8vWAiDrwoYh8lQRRYbJelM=; b=O7echI3uaiuL45xLoXuVYsHFNzObkm
	1HQwlq3/NiFw25gbMUjRNHfVgwFQ+MOj3zHrA3fLF/4Y5CsTZg4WiEMhm5lh6rxJ
	YN02g+M389cxusrmQKrF7T9Qq6LdtnKFIztK8F9N1K4AJnewQyxSpTJvGqNDwFJT
	0jpsO0QSFj13SetCHxxAHN5/oPDwCaY77n8MNa0kN1tYz7T2s578xKx9E8oQiiRU
	wUnScjrS0CPRwVyE/QbX3vM4h21CTqqJyrgfJ9CnepUi2nwjxhXPpReEEhUdYOa/
	kKuL/iTWSAkgkISKUhnWbuQQzoeSfa01mwVnTyXnnSON2967uOAOmppQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4XIjfkf0M73Qwe6rGb4w91fAv4ZF6psgZMW7U08hTgs4TS/poxp02YNX6Bc4Hrz1PsdQBtdyhLH0MT+jlyvZnaXxqq+ozkjHaSIFu7anHoiLzx6eWGKzkoNVxc2kv3JbfQlX4iLA+uEAG9q20ev/VQmYQ/dDOLW/asUulaK8lSNXP9JLJ08Wop1ohvNwMeE/QVf4BfYsWisCyT5R8CoETWd7KUOpX+3iaPucuYXsj4NqZIFMXtGkm45twOF2Qmvn+BeA221ky2DiNksZUVA3fKjfGIG6EqEK0o2HHS/VryIH5Ep6YBTqVH8n5YwE6xF5fP5EcH8HoICSA+IIqj0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83/oQlKqI0WIriuOwqQN/8vWAiDrwoYh8lQRRYbJelM=;
 b=Mzodl4+jOB3iSjnh9C7ouUrY0YPni9HSnOfxnCBpRh3scyDWjQvtisA8KB/xmMG7tDs7k0GD8eXEtf2WfRGCFCTi6DO3T0tC1Ku9YByWdJLyFkF6U7tqeiI7rMj7MukSdGJWPq1ggA/W8AiEgjEsd7VqOlp8EN6EKwN4eWolE5Imz+DGynDRYPlRrYyxLs2fbhdDmpNS5xJepM0tDHAjsjW1HTB6HcW1+0dxWb/ejNcCYjLYlArnEeHKqf9vPZZkNVITdEyfcmHTKXF3BrM8IoUJv3aAlZ/imREUsoCUwnYiq0tgHFmsNSyYmh4qK6zVMyN89mu/9cAYf/75ENx0kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83/oQlKqI0WIriuOwqQN/8vWAiDrwoYh8lQRRYbJelM=;
 b=KPQmcLCXnvj+i3xQjTfMGELVJ/p7Zx5bJYyxvHX95P8d4vRIxGGgEJlmKwNEaYlwHdy5If+0s+tgY+D+W3ug1SeGVH/gOhCqXzIEVvGWrcZhywxLOaklEAjxpSfZ2mGdBzuweagaOeYdchP4A0/DVWtU8ZT56tAalkzNMkR7UZg=
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Richard Weinberger <richard@nod.at>,
        Anton
 Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Josef Bacik <josef@toxicpanda.com>, Ilya
 Dryomov <idryomov@gmail.com>,
        Dongsheng Yang
 <dongsheng.yang@easystack.cn>,
        Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>,
        linux-um@lists.infradead.org, linux-block@vger.kernel.org,
        nbd@other.debian.org, ceph-devel@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
        Bart Van
 Assche <bvanassche@acm.org>,
        Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH 08/14] sd: simplify the disable case in sd_config_discard
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240531074837.1648501-9-hch@lst.de> (Christoph Hellwig's
	message of "Fri, 31 May 2024 09:48:03 +0200")
Organization: Oracle Corporation
Message-ID: <yq1sexgs3j2.fsf@ca-mkp.ca.oracle.com>
References: <20240531074837.1648501-1-hch@lst.de>
	<20240531074837.1648501-9-hch@lst.de>
Date: Thu, 13 Jun 2024 21:43:06 -0400
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0155.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::10) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|PH0PR10MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a12a1cf-0693-4ee1-a985-08dc8c1357a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|7416009|376009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FDqOOREikVKNZitaDZO9HCiUDcGw4sMiLpAs8DWGpz1WQTGxlBxBJScRX7/s?=
 =?us-ascii?Q?MOTz6t0daO/8QhtEBIpDhrLoV3mDmEWt2NkWyylhF3fDxFEBt19DUyNwuJk3?=
 =?us-ascii?Q?cxx5kh1UKjkosPnag5RkWsdZQ6YUdRWQrb0YyU4mtyBFQPjphU6hV6D8i1Gk?=
 =?us-ascii?Q?3umYiSAzXYvfOtad4+AIPAa5Kibt8sQ3/z1Z2wpYbF6sk9tn0kY2TovpJk8v?=
 =?us-ascii?Q?szZ+0N9Jx6Ql8QLfV62KO9BjTh8UWY6HkI8gDOLd6IjXD+SA+TmaLXP3WcbR?=
 =?us-ascii?Q?ZzQ7yvZTD8CYeaeskBfZQzvgoOAKcs5N6pmprHU00q4QpnLYlXBFOdSFZwOJ?=
 =?us-ascii?Q?YqnKtbFjRxPcfQO85vXDmFSllr+a0B19rUFoHEGs7VbHzN+Kpq5kO9mqziZy?=
 =?us-ascii?Q?ixisuhrw1DbTF0iZqh492F0K5iSyy0aJPLvld3wr70U74GtB510s8o9wZuqt?=
 =?us-ascii?Q?i8pExzTjVjiyHWmNp7lnjvBcOwFV9rUqx5uFdwctzYs2HMgW2c1iRh3nzeT2?=
 =?us-ascii?Q?pvTKSSCburRFxgkU1jKe+PcTamSF8807JqnIyOn28SCUN+T/2MV6l2hYhHR8?=
 =?us-ascii?Q?jWqXGE9TMBk8cFe/tn47dEBjjd7in/vZITwkSa8sTtIQva97fyJkzSupbnn0?=
 =?us-ascii?Q?q3ytLBhPJSLfhgMuWcq+J3hVcR2bxad22FJXEdgrGrSSO4gaGO6uufKE3KK3?=
 =?us-ascii?Q?ZXL6832Hb83E0KYtsAJW/QwVwe5c5HEyOS9mgCbDin5oRKeLFzbzMgisjbk9?=
 =?us-ascii?Q?mcZamAwAumOdmsbw00jJmRSIei6co6lyWG0VK1mVBMZlNPGR0sWKCWZ+gABC?=
 =?us-ascii?Q?ZT5sM2QiZxhJFdhsqRlgOfsoonr9eCol2DvrAwsf+yapgV1zpWnd3klll+eR?=
 =?us-ascii?Q?FJhmFKr+83fnuZClNEDqPxnAtg4Q9VBgfRHoA4htK64cO78TPD3q/PA5b0Tz?=
 =?us-ascii?Q?63OJyK61KKTWTE5oYsqAeo2Y24KRDU9EkR+ujnXT+JJKn+WWGTYSQeqFwJlm?=
 =?us-ascii?Q?TtskJJ4x9hYeK6xXQWBQYRzmDIZ1RkjOfU0hD2Dp8O907gs070ij3g0/3C2T?=
 =?us-ascii?Q?I2aHZ25aZEsFYjMIt2kdp/DA+iiDRTggMAil4k21ph03GwNTF2scwhi2xc8S?=
 =?us-ascii?Q?OkqbPdE25KkgqPapBlW2762KpKxU+B/TYO/Gf5JHUTfCrJQrBWjHGhnJrtlK?=
 =?us-ascii?Q?4X9hym1KRKkfq2iI7sL0/kkrOE9hK6US0e4aLnVHN1kA/RMAqlp6j8p6Juhk?=
 =?us-ascii?Q?ZCAQwjdoXo2PaFK0q+WBCNAWGjqwC/lDh5ExnjrXcJNaXqMWgRHebaB7B1eW?=
 =?us-ascii?Q?4S+rC72Q1VSfEFRQhM3DCsco?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(7416009)(376009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?74MkWV0yw1MnSRYanqfmBg1SSrfCVMKKZot3UhbIi6ikIL7w61Hs+JzczNtY?=
 =?us-ascii?Q?GzKaP4CV++RccJgK4z2ZkYmuZHKa1rMqIpHDmVIHOhFVEf6GhueIuUUR+FU8?=
 =?us-ascii?Q?Df5/HUvT61SMQdBUcmoM2BURkobuLnos7Qfb468T3ZQ+pN7cqal1oiFIHp/3?=
 =?us-ascii?Q?FZ/XTmWS7q7jEWI+6L+MYzj6cR8jEX6Ekt+6lyNY35SLYHP7ioOzWoPUEqcF?=
 =?us-ascii?Q?0Y4zqNg8Us1HpdDAa+OnAI2sWFLO7YWktVY40o2smSJ554XCYJbmDT3H5gyq?=
 =?us-ascii?Q?wf1DVdHNO/QMqFA6Qs3EDwyyhI2S+s9aGFJt4DUrS0nFtgpXYqiyP0ZBesWF?=
 =?us-ascii?Q?5MdAk6LctyzSLL5/m5ixUi8wuLDqpZX0a1JCOklEI+KdGQERnbKG7S9rSlV+?=
 =?us-ascii?Q?rDQp3yk/4Z4KxOonnOa8Xd28eIo/WBykgs8IeCviLUKVSwdibge+RvO/Dwom?=
 =?us-ascii?Q?miOGstBiaai7oPeqoXCA+Z0Gd4+r65H8ykSDphXpVQXg9+LWie2FneBJ9Tmj?=
 =?us-ascii?Q?brPwqE5uUaaRHOsN94ibPikjiHVHGmO6xTQf1WrRd3VP59O6AAlCd2pQFwz4?=
 =?us-ascii?Q?QvErGpY1tYkMIcrRx0/hDaWN+zaMv9juZEFmTY9+bQI4A+MT9x+5FJ5y44FW?=
 =?us-ascii?Q?jxS51E7d1WfGa9zlcmzy6eJLm+teha7/5V4PlnuAFYF/UWgziunJm24/47s2?=
 =?us-ascii?Q?tG9Es8a6L4lpMEGOb/O9/Y4+f1SdpH7a8Qi7Aohd6CMGwsCjxgTIFAcnPaYa?=
 =?us-ascii?Q?bVoOhfXbeNkq66NNcvXe/fnEfcZOUwyG4VVBFY6xitlx0jAnnLFTR9x80Xc0?=
 =?us-ascii?Q?ixGEA4ri0wOOk3j9dOR+ecSVoLchWQ/YoiE9+KP3GFHKB8dRP+iEClFcBhYs?=
 =?us-ascii?Q?LB7eoPxNdRYBCKL6s7VNrBJpC8+yyWRpALLR4ACYmOnoZMKM1TBlXSF/XHI1?=
 =?us-ascii?Q?HWGYej51KPHYe+AgByXv5KU/OmODTSVAiLLHCPxxaeRPInF4+y+G88G4vaKS?=
 =?us-ascii?Q?k0M8wlvKSGMHV7w8SDjFBxs6xSvl6i85TIhJlMk3xl0194IrMoFt7R4eCpgI?=
 =?us-ascii?Q?5TQ4un5xjgUGpbr4qZEg4xhXXDP03wrYL0b+Z1LKCfYloHMhUK2CMPfDU6zo?=
 =?us-ascii?Q?wgNkPsGMD68s7ZywATErw2IOx428+Jeh/JE1yUpXeJ4SWfzwpAY9JXQWFAo7?=
 =?us-ascii?Q?K/lgSVgDwQTo8htittMBUUOpursd/dyyW/cjwL2FQCmn2nodBOb9w/XDYuOQ?=
 =?us-ascii?Q?VaTUkXBd3QE9zSYpGT4FuXyE7J/Pww+zdM5ka1s+N7w4vMU36Npvqtna6P8l?=
 =?us-ascii?Q?mhhx4RpGFl3Ifi0nuy6QU1oexmPXzJ1BRK/Wue3OL9JnGGPUbgoQeUdhG1td?=
 =?us-ascii?Q?mi4JnJbmavKc8GuK+2AMH4Ctn0Auz/ffmMsIzdxrtvmKyizfGpM7toy/29Af?=
 =?us-ascii?Q?VOJvKlutzyHloE6+MFjUNnU49viafriX63mmbzEowA5hrwi5pIO/c/aa9hcE?=
 =?us-ascii?Q?z3RBci4qmS7N54J+qTaLtbr+KWpWhokJcbW8yPFJfrAIrVoy7HxMYBdZslwP?=
 =?us-ascii?Q?qd9RKU+ghgOlRe6UUXPu3Dv5/9tHIy1E7oq5alwd3ABIkHzea3dteUP3gAfJ?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	0lPW65u0YECiqQYUJ7yeLSLftKsAHjN0vcl3MYDlWJhYqGo1dq7NRSVTEsmed34r6CQz1qA+UprMSsSLaCFqU9NrwDmfO2BypP6f+YkFCcr1kHvvnbefQ5DR4GNKDc2/0JZYaqZaYJ0OODxtaaD/H+irq3zwv1OfavA4Xie7DrVYD7pEDynWFXlSHSiw0co95vgDz11sWyrZyd79CAkhGgwF76JaHuyJ69tmRG3XdAbBtukq0HKBfTKAd4sKbHyhdM5rJ8EvoKhv37PhNcMXnHKtunFpyxC6FjD0YSjHh4QdM/t+zm5DdmMa/O36WhFn/ejDLuO6caXNeqZWKxzMHbkD/tLjNA8XoDdpkiu0C2d/XyXEUdqAxRpK4gaEhdok626rnFQLAXzs5YPF5fa4aeG7Nu5kWMOQNlD8/AEUIcWbH2d/NHfdZ5x6IFMZ1jz26mzBcJnNwTJVIfWEFSDR32RpOqNpB/w7YZ5Kbq9iLFH0Jg4XJIjmmuR/R4+tXDgrGyQRXgY4UlI1M51NP0mHyYRpIPBIvUhsdtDBt/81TkUf0vZyY8L7WhrRHc7RR0JgmRDx17bS4TT/2ySZscEE0I2KENwCdp4HGU7d9yEmHzw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a12a1cf-0693-4ee1-a985-08dc8c1357a4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 01:43:08.3496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kn0mFWR8Rz6AnwqoM1ejr+zhCAbtriQhJe0d3JC58dDZhpYkaZ1yPc+A5lec2A32DRXSJrUqvJx7Ipwk1IyL5aXMnIKxpgLjSyX6HzL9dA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406140008
X-Proofpoint-ORIG-GUID: RnxgKt0-4twp6Tm4NBsFYwO1NBlGp6S3
X-Proofpoint-GUID: RnxgKt0-4twp6Tm4NBsFYwO1NBlGp6S3


Christoph,

> Fall through to the main call to blk_queue_max_discard_sectors given
> that max_blocks has been initialized to zero above instead of
> duplicating the call.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

