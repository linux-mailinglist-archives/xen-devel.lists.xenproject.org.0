Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FA848D614
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 11:51:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257070.441523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7xgo-0000YA-Fi; Thu, 13 Jan 2022 10:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257070.441523; Thu, 13 Jan 2022 10:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7xgo-0000Ux-AA; Thu, 13 Jan 2022 10:50:42 +0000
Received: by outflank-mailman (input) for mailman id 257070;
 Thu, 13 Jan 2022 10:50:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=64pG=R5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7xgn-0000Ub-0j
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 10:50:41 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a49abc31-745e-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 11:50:39 +0100 (CET)
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
X-Inumbo-ID: a49abc31-745e-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642071039;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=X4Zl10Df0O6Sf8y+jRnLH+48TFPJIAv634tFYvJgMFM=;
  b=NIPqGW3/V9NnOgBOEb6MNakrumNtzhW4fxu6Mn6+QtROv5AkNzN0+8Kc
   vSwdm8U9rcJTbgI8JKZMoLAvTj+Dp4/OfcYqzDKTBMd0W8WHVcuTuZFC/
   uUymUGyI1hk9uXamGX2jqkHSqZzRVT2PLuqpygqKK+K0fyBcQQ3FxjJM2
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2MmGywQV0I0xaX21vf5g54J7Pd21AMz0VPP7D1Fh8dcMB9bYaSFhTE12EBnrMcRIH1Q6Jp6ESt
 s7pYYSW7r3Vgt8iiiy8yZwBZ35k+0UZsWEbEODM4UilBtk1TqOvw/lKR2UODt7nV4WznbFXD2F
 b/nSqmGbG2OF8btXUn0qOWbWqbJ7quQPXkCQAjKl+NcZGXbr/5rt6GQph2OAzSAKXD2RGBObQQ
 LfMRW/4nnkWoDCidHrnHCumoRPhIDHNCDEywjPPoUY4dw1R6tlbN1EJKMeIsfm1zFKu0Us6/Dq
 biIEee08ZXeYBq/Dr2nfUBJk
X-SBRS: 5.2
X-MesageID: 61910122
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9/fEjqNk80XNv4DvrR1lkcFynXyQoLVcMsEvi/4bfWQNrUon0DFUy
 GcZXj/SPvuJNGTxf9x/aNjk9khQucXVzoNiTwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Es4w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoymrnoBo9
 thRj6SbWER0Ee7ym/QiFCANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uTtIYAhW1q7ixINfH5P
 cU/eCMyVzXJWkJTGU0LIZcBus790xETdBUH8QnI9MLb+VP71AVs1JD9PdyTfcaFLe1XlEuFo
 mPN/0ziHwoXcteYzFKt22iwi+r4uDL0UYMfCpW17vdvxlaUwwQ7DxkbVkCyp/WjvUe4V8hCM
 Ewf+icorq8a+VSiS5/2WBjQiGSNvgMYHcFRFeI6wAiXz+zf5APxLmIJVCJbYdoq8so/XyU31
 0ShlsnsQzdotdW9S2+Z97qShSO/P24SN2BqTT8JS04J7sfupKk3jwnTVZBzHaitlNr3FDrsh
 TeQo0AWjrMfl5RTj/2T8lXOgjbqrZ/MJiYr4QHQUnOg/xlOboevbIy16nDW9f9Fao2eSzGpu
 3wJmNOX6uwUOo2cjyyGQOgLH7aB6u6MNXvXhlsHN4I66z2n9nqnfIZRyDJzPkFkNoADYzCBX
 aPIkVoPvtkJZiLsNPIpJdLqYyg38UT+PcjHV6DNUNdSWKBaZUza02JQZl6vmFm4xSDAjpoDE
 ZucdM+tC1MTBqJm0Ce6So8h7FM7+swt7TiNHM6mlnxLxZLbPSfIEuldbDNie8hktPvsnenDz
 zpI2yJmIT17Wfa2XCTY+JV7wbsifSliXsCeRyC6m4e+zuta9IMJV665LVAJIdUNc0FpegHgp
 CHVtqhwkguXuJE/AV/WAk2PkZu2NXqFkVo1PDY3IXGj0GU5bICk4c83LsVrJ+F+r7Q9ka4vF
 ZHpnvls5NwVGlwrHBxHPPHAQHFKLkz31WpiwQL4CNTAQ3KQb1OQoYK1Fuce3CIPEjC2paMDT
 06IjWvmrW44b106Vq7+Mav3p3vo5CR1sL8sAyPgf4cCEG2xoNkCA3Gg1ZcffpBTQSgvMxPHj
 W569z9C+7mUy2L0mfGU7Z25Q3CBSLohThEETjiCvd5b90DypwKe/GOJa87RFRj1X2Lo4qSyI
 +JTyvD3Kvocm1hW9YF7Ft5WIWgWtrMDfpdWkVZpGmvldVOuBu8yK3WKx5AX5KZM2qVYqU29X
 UfWootWPrCAOcXEFl8NJVV6MrTfhK9MwjSCv+4oJEja5TNs+ObVW0tlIBTR2jdWK6F4Md15z
 L556tIW8QG2ljEjLs2C0nJP722JI3FZC/cnu5gWDZXFkA0uzl0eM5XQBjWvuMOEaslWM1lsK
 TiR3fKQi7NZz0vEUnwyCXmSgrYN2cVQ4EhHlQZQKU6Il9zJgu4M8CdQqTlnHB5Iyhhn0v5oP
 jQ5PUNCOqjTrSxjg9JOXj7wFlgZVgGZ4EH413AAiHbdExuzTmXIIWAwZbSN8UQe/z4OdzRX5
 ujFmmPsUDKsd8DtxCoiH0VirqW7H9B28wTDnuGhHtiEQMZmMWa03Pf2aDpasQbjDOMwmFbD9
 Ltj8+tHYKHmMTId/v8gAI6A2LVMEB2JKQSumx26EH/lyY0ERAyP5A==
IronPort-HdrOrdr: A9a23:2wdpb6nZywUIKLhs4x+a4BcIAMHpDfPOimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdeEYbmIK8/oSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYHNu/xKDwReOApP+tcKH
 LKjfA32wZINE5nJviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Su1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfo2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8AzeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wgK7VBaM0ot
 gsCZ4Y5I2mePVmGJ6VNN1xMPdfNVa9Mi4kEFjiV2gPR5t3ck4klfbMkccIDaeRCdg18Kc=
X-IronPort-AV: E=Sophos;i="5.88,284,1635220800"; 
   d="scan'208";a="61910122"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ae3ZSTcy7z4XbeAwhjBxAvn/62ohf5idZMyFq2ULnj5TOZRgLo53o1dgOsasQ+94OAuvPLV5wJSvjrRAa2Ms03JKVl242nKzphYjB52Nh4W3IB/PHO4+C7w2Be7BYUPjBQd6NYWiwdcUIHjYIOSs7LoSI7peAOpK2OX8J332PL9HsJ9dGPMMTHyxTBzmrdfQW/ntBCBpQ+wTkp0nkgrsgfN3A3LPKsQaRzvfOH2zsMWpg2DzuqqpEMOCMd4UjmvoAka0meTLoLYmmupUfjp2HwUKGhAJtv8dTptC8OY8LZZ204RmZYFDgUs1SLJfveIjXibD1EjjqrmImC5ahrOCdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDdjx7/nl34sXRhRakvicR80sWlVZN+Lx89AJZViGcw=;
 b=fZZB/OI+qO1n/kuzDzH60OxZQVxJD4yq8rURnSrm2clLm0XuA7OXAi4WE5HlpqyIIzm0qyiwdNuv2+k88ayZmYCEGtYL4VS60fi9TLt1tQkr6yDn6/4U2YQAGFDA8ltkmrj3EKbXqwJWcMN7ChPAQBWDQZOnwweIOijpHVrXkBLPNxi8y7ktMcGOSsJvtMtzWLk2Kz1FMKS3cRvHwYpW8EoUtLmE++oKWkYwPGATQPuik+Xq0CY7Yn9j9jPAnSESj6jaZpSljP9NgItz6fsNpY2YHRvjL4bKMZigYDyFsZwi43GX6smuA8bcwuhOkzH96OoIm54MDWQLcoysNI1SrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDdjx7/nl34sXRhRakvicR80sWlVZN+Lx89AJZViGcw=;
 b=R3vi6Dv8Lt0FDqCCV+O6TWRpzhUM23IJyEMSQOYUJYtHaCDIjjnhNGSXFsto3iO9TEp6dts1c8URT6v+qoG9SE9FXTdZCCr2KMHEdaLfFKL4Pm9DP1QNmvdiOT0g3Ej8pPqn4iK+JYXSS46QdOc899EU65AaJWUZlXNDo7h/RN4=
Date: Thu, 13 Jan 2022 11:50:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v5 09/14] vpci/header: emulate PCI_COMMAND register for
 guests
Message-ID: <YeAD9PH9o65o+M+w@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-10-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211125110251.2877218-10-andr2000@gmail.com>
X-ClientProxiedBy: MR1P264CA0070.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2efbcb2f-ed07-4857-a361-08d9d682867c
X-MS-TrafficTypeDiagnostic: DM5PR03MB2747:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB2747707133775E7F1A5960C28F539@DM5PR03MB2747.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kMG9TH18HH+xANtKe8zAj2P6ys+ERf5dFsDiHgTGWCKxrQ3aofzV8Ne1xkICyvGL4ZHBzKsqc8wY1IZ/owHQJk0eKO53dqSQ6G+6bfHonY8qGs0s0ORCihI2M1Olp/qyAF+2kJjB2hzBBNnquPrpoDQ7odqpdFveOedD2O8GuvDAv9dstyQG4xnZLQP7umwgVAa5DDzrtsZeQU65MhuQFT36Q9fHSFWq5mqsQgAUw5feijcaz90uwRG9AseyRGusNBF+fKx5hs6JhTP0+P4xZwZKvGu3+ghNosc9SYLTAXx3QSSm2hP1WY9W1lqOv9y5fEQCq26xnS7eqxBGZL05jhu9vlLhzjdMG0YU+fjtPAmoncjXVc+Rcl7eYOqX4/gZWqOL2nnQSeGx5E5DiOYemocr5MGXw5xGLo8M7dY+nSRQDkVFdYf1f+uBa90sHTXLmOUYhdwX3wPA2FkHrTUE1JKjPVpj9iX0GgvO8eZVwI5PygugZ42GxtAjeZv2jtmWwqfhdWuuZImNVbutd036bD76U7jgzaSjT6Dp/hc2sicRNV1OubVtXHQbA7sExg7+dvM01Dtl+S4h2YqpN7Qf/gjszmIqCYDa5/ybc3a85HdkHT0eilIJsgymwyDP5N+O62R6v3qWccShW+AatzEIPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(186003)(66946007)(66476007)(83380400001)(26005)(6512007)(9686003)(2906002)(5660300002)(8676002)(4326008)(82960400001)(33716001)(6916009)(8936002)(85182001)(508600001)(6486002)(6506007)(86362001)(7416002)(66556008)(6666004)(316002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K25QaGE1cGlqVGFhMEpJdFR0c3MrelBhOFFjTXRabVpkRlpNbmp0RFBCM3ZQ?=
 =?utf-8?B?MHk5ajdtZGk3OXpMMytnOEFwWTZKOFl2bXUvNDg1eWNZbmJ1R2VRTVRlV3Er?=
 =?utf-8?B?L1Z0Ymw0eGV0NWthdFVGOEw3K1ZsN1lDMzRrSzNRQVFYZW43cmxkSkRpNSth?=
 =?utf-8?B?YmN0Y0pENzhKNzd0QzVaUWk2b2ViQS92RzM0dkFCWkt6Q2V6Z3FISWRMYy9y?=
 =?utf-8?B?ZnpaOG1qakFkQkFEdHpsUnpua2oyVGxDTFR6L3NSRWlhNlNlcmxVY0hIWFc1?=
 =?utf-8?B?bGtSSUYzdmxGVGNVc3FTQThEd2RHV2RURUl0VEFuWUhubUdzUXU5bHkweHN0?=
 =?utf-8?B?dFNqWjl6Z0F4T3hXR3dnMVpTU2x5MEZaNEd3VTI2Z3V5OHBEUU5UOGZvZFZE?=
 =?utf-8?B?Z3J2TDVnK0lVc21xSHhjWU16YzBFMHBXeHgrckI4UWFHbVo5QjJ5T0lNVUZM?=
 =?utf-8?B?ZFdXVGVGQkVDUzdVN3JLSmlrVlFjN3pwTHJMZFZBZ2o2YTZDK3RUR1NTOExr?=
 =?utf-8?B?VmRMM0hBZ1IyanAxU3pxaFJlZzJ6eVVXZWFXTkFtUGRpRjByK3V1VUxzODhp?=
 =?utf-8?B?L21DSHM0ZFRlak0vQldET1ZHYkhQeEdUelRnYkhYSCsxZWRmNml0b3JrNTJG?=
 =?utf-8?B?bXFWdXQra0tZUWhwa2JScTM5eHVyQzl0YVVhcFFsSlpIMEpzU3cxNWRGQ0RM?=
 =?utf-8?B?U2lROUs4a1MzaVVWWVRjbk9qVW1UT05XNGNycWpJaDJQU0czWTNreDZhVDJ0?=
 =?utf-8?B?ZUxteHVmTFpMOGp4OFBkdDBpM0ZUR0U0S053eWwwUW5JcjhQZ0JBemY1TTlx?=
 =?utf-8?B?dysycUkzc05XQ0VhcVE0Uk9EblNYTEZDc1NRWU5vYlFUVllVUGpaQlhqRmgx?=
 =?utf-8?B?T0NmTUwxZTZIY2hjT3VZK0RSUlozZ2dQdWpvQXQzQUFNZWNGckhYcWV1RDFI?=
 =?utf-8?B?QnYwZWpJalZmS2FIZDdNY29tenJZS0FmWS9sWW5FaFE1V2I5YjNTcEhtc2Js?=
 =?utf-8?B?OGxEQi9NU1JlUE9nNnNhYzFoUHhtVDc5ZEpJdDdwWFdFRDNuMUIwaEpabnZH?=
 =?utf-8?B?am5wQ0NBd1ZkREYxaHFiMWcxK0FVb0tWbWdkOEFxckhxRThtUk9US2FpVU94?=
 =?utf-8?B?a1RmV2dlQ21oUWxlVTJVeFQ5M05JVGRuSmpCeEdwMXpOeWdjQUg5RWJvSmMz?=
 =?utf-8?B?bFJqVHdQTEdUMGl0eTdIQ0w4NUhqd1FtZlZkNE81RmhtY1UzUGZ6MCsxUTFD?=
 =?utf-8?B?SDR3QU9LbVp4WEFIait6VzlLYWFoMG9yV1BMdGdDV1VBRGJaSE5TY2hZSDc1?=
 =?utf-8?B?LzVSRGRGY0hpN1h4dEtFV2FXM1AxTUhiblRNNlViK0Nrd0ZvUUlpdjVwSlRV?=
 =?utf-8?B?Q0dNZU84bUkvTDJ5RWwvVHdwd0daYmV2TkxPdG55TDhiQWErclRkL1htSmVY?=
 =?utf-8?B?SnI4NUV0OUN6NUMvM3poSzl0ZkFQdk9BTUZFWjVEcXFsbDZ2Wi8xZG1CWkYv?=
 =?utf-8?B?a1A3KzdTb1htcWJYTmdiM1VDUjFLeVdRVGxsY3dmUkk5TktKY3RxYVFRZVRh?=
 =?utf-8?B?Q1k1amNJbGRBSGRRK0RBc1hiUk5PWXV1MGw1U2NQU2p2STBiRSt2aDl6S3Ni?=
 =?utf-8?B?aGVuUWlXdFVLM0tEaXRqdnJZNFRjT1krZFAxRTJTM1lJcjNvWFJmTXVZa2Jh?=
 =?utf-8?B?QkF6WmJEdkVrL1IyK1RyaGNEcGlxVlZVL0gxWGJqalU2MXhvODh6NkVMenNP?=
 =?utf-8?B?Q2FKRTl2MzUwVkYzMDJaM2YwSGJvdlFSOTZUSEhhc2dJYmdsU0pmRnYvMGpF?=
 =?utf-8?B?WXpHUzRCK0Mvb09OZHp5L09MU3lNbW52TlRCMFdMQnBPMjVNZndHNUI5K3hr?=
 =?utf-8?B?TkJIR25YQ0liYTBmN2pIcXN4OVlYRkg4anVIM0NEREJEU2Q2dkl4UytHNW5Q?=
 =?utf-8?B?R3Noclk0VU9ZTXZpakhtYzhudk9jMUZqZnFSSEtkSFNnUEt1RXhTVTBFNFRQ?=
 =?utf-8?B?eFAzTExQcGZYR0lnTUxuRGZFRmFBdkY4NTdpU0s5OCsrSFFRVFNYaEphaUpp?=
 =?utf-8?B?VDd5Tm4vbk03N21ydU56VTNoSmJzVVRrU1VtVGhkUmNrNk56OUp5Nkx0UVZh?=
 =?utf-8?B?eHoyaXA1ZUpQQ09sT20rRTh2TU1PU2MwY0JUK2RMK2I1Q0k2RC9TZUpzOU8z?=
 =?utf-8?Q?9k+d2hg07SZv7wn0kqoIa6A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2efbcb2f-ed07-4857-a361-08d9d682867c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 10:50:34.3792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79IcYaBRZV/liAtbr/O0pAb59UEsR9/rNObV15nHPHnLM54354D9kxFPBROADxdYRKHk/RbxrLqJfo7ATMckkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2747
X-OriginatorOrg: citrix.com

On Thu, Nov 25, 2021 at 01:02:46PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add basic emulation support for guests. At the moment only emulate
> PCI_COMMAND_INTX_DISABLE bit, the rest is not emulated yet and left
> as TODO.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v3:
> - gate more code on CONFIG_HAS_MSI
> - removed logic for the case when MSI/MSI-X not enabled
> ---
>  xen/drivers/vpci/header.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index b0499d32c5d8..2e44055946b0 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -491,6 +491,22 @@ static void cmd_write(const struct pci_dev *pdev, unsigned int reg,
>          pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
>  
> +static void guest_cmd_write(const struct pci_dev *pdev, unsigned int reg,
> +                            uint32_t cmd, void *data)
> +{
> +    /* TODO: Add proper emulation for all bits of the command register. */
> +
> +#ifdef CONFIG_HAS_PCI_MSI
> +    if ( pdev->vpci->msi->enabled )

You need to check for MSI-X also, pdev->vpci->msix->enabled.

> +    {
> +        /* Guest wants to enable INTx. It can't be enabled if MSI/MSI-X enabled. */
> +        cmd |= PCI_COMMAND_INTX_DISABLE;

You will also need to make sure PCI_COMMAND_INTX_DISABLE is set in the
command register when attempting to enable MSI or MSIX capabilities.

Thanks, Roger.

