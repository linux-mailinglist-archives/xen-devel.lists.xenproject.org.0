Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 650313BA3AF
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 19:34:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149272.275990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzN3g-0002SF-R6; Fri, 02 Jul 2021 17:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149272.275990; Fri, 02 Jul 2021 17:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzN3g-0002PE-MK; Fri, 02 Jul 2021 17:34:32 +0000
Received: by outflank-mailman (input) for mailman id 149272;
 Fri, 02 Jul 2021 17:34:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wENR=L2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lzN3f-0002Op-FW
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 17:34:31 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21030f05-1198-4c84-b98a-983ba5d6a80f;
 Fri, 02 Jul 2021 17:34:30 +0000 (UTC)
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
X-Inumbo-ID: 21030f05-1198-4c84-b98a-983ba5d6a80f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625247270;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=oKIxEfPmbuVRb1uO8qr3dJruNe1XRbrn7LXjL9ztNYk=;
  b=cqJKPk7UcNtPAtOVJkYtStRChHIsyjGKVEK+Kcf0dcAUXY9O1LndINYx
   JEuCjXCo7kBp5EArlfGSzppDk79y58hm9c21XuH/1V9L7qW03jksOHtVE
   5v/1zZ9WDs60Qacizofo7aytv9lXwdAIyM65aY0ggA4pG7sNGyN8Qgvwu
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lvLqR0Xt8Hcv7hJcDkOC6Idfk8jMj1X4SDYxuoBcRpETUo4IVNCAXBIPn+s3WW0sBW6hDtBT+i
 yzIKQiYHvUFJRwoYq0QobDvuZbEj5sRdGalSVxhPTFibO20vqrgwr2KHiy6RpNH6pU4PDmqwYM
 6X96ZrK23J9MXHCr237pN9wmoKM40zj8jso7ryukTC+WeHIpOb44oNOPziP4GUUwpOtx5DeH1V
 AnDAHOBDr+ZaFiYp9pwykDTgvVh9v36k5+TvFN7p+woxAxEycwwKmJxVVJ3NzoaF5NW6t5u2UP
 Y9Y=
X-SBRS: 5.1
X-MesageID: 47858398
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:kF/XpKgFMhyVawMVP3gCZrJ7s3BQXzl13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQJVoMkmsjqKdgLNhdotKOTOLhILGFvAH0WKP+Vzd8mjFh5dgPM
 RbAuJD4b/LfD9HZK/BiWHWferIguP3lpxA7t2urEuFODsaDp2ImD0JaDpzfHcXeCB2Qb4CUL
 aM7MtOoDStPV4NaN6gO3UDV+/f4/XWiZPPe3c9dlIawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/ssu81gTX2wbonttrcZrau5V+7f63+4gowwbX+0WVjUNaKv+/VQUO0aCSAZAR4Z
 zxSlkbToBOAjjqDxuISFPWqnTdOXAVmjLfIBaj8AfeiN28SzQgB8Vbg4VFNhPf9ko7pdl5lL
 lGxmSDqvNsfGX9dQnGlqz1vitR5z2JSLsZ4J0upm0aVZFbZK5arIQZ8k8QGJAcHDji4IRiFO
 V1FsnT6PtfbFvfNhnizyFS6c3pWm52EgaNQ0AEtMDQ2z9KnGphx09dwMAEhH8P+J80VpEB7e
 XZNaZjkq1IU6YtHOtA7Sc6ML6K40n2MGLx2U6pUCra/ZA8SgDwQsTMkcoIDcmRCe018Kc=
X-IronPort-AV: E=Sophos;i="5.83,319,1616472000"; 
   d="scan'208";a="47858398"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBTr9ko5XPMPiY67MCrTYkdglpF4NPKVMZvW6TulUwZ9RvVW96W3Ws2jjoALr6VXqk+46Y9F8MMObqUCZTQnQJ8wthvXYgk49Mx2YIPFVtwBn8hBAOsL5UrO0iVdZeZVuK6Z+zSbzzZgP5NJJwPIrmFRS1oK7gKjIuiLGO2zNFaiZJXEaod2FlpyK5+8j66A4Uq9RJoRDT1wzdMM2ZBSkCsikhvSq3dLrERxTK004RVUg0x04+7wexAGvircOrv3NrrSY5Lx5YQo58xSciNpLO2fy7NDELE9vhL8ybQcjcmR3nzS2nvnaSphiskxeEbzyvlPzZBMmIls4ErK6fgsBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bROnHpnTR/M8aKMS4PXc+XiJb4a9Hhm+XOczIWCLeyE=;
 b=R6Xnme82RYiYm4K3ty+nPoBRtYZDxGopbK4zv5Hf4iUA+oCaoQWiCVlhzxA+sjOJbMZv23D+xADdKB85qBwdojbEVDxjqdulYqdG9WnmeVaqqsFMKSY0gl7TkCyuU+uoLMLI3rGMna5IieGhPlzbdKbF05c+Fn5kT9CU/N7qwFkTtvljxc+KsofDO8gik1C9tsKzY5bzoe5YnFpa4x2TmnwaSDSiRBVjnZp5nKKlUM6k37O7C8iVT2NBvGmIEfMqS9OMtl2AydSznjCTE2cplvwpPnK8Ls7k5W2889lX7wrwY1Bk5J7YGUgPGWurwFd6OK1cnSv1OzkNAbFQkUC42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bROnHpnTR/M8aKMS4PXc+XiJb4a9Hhm+XOczIWCLeyE=;
 b=Y6CE3L2zo86eB+Y7ZIkcWS6UQCg9a87psgaeT7JqjlVt4RKDVqjb2MebzeQtXes5jLNFhKNUTuU2+0R332/+oFr0p/r/Z/y0FBKWIcGMnQt9imVSzwwvlC11so8IZ0wU/q/G567NiWAvJDvd3EN02BfeD/epO4zs3Nh0LGwgfwo=
Subject: Re: [PATCH] xen/Makefile: drop -Werror
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
	<xen-devel@lists.xenproject.org>
References: <20210702170602.890817-1-fontaine.fabrice@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b920b793-734a-5f1f-6c4c-0d31ed27d01c@citrix.com>
Date: Fri, 2 Jul 2021 18:34:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210702170602.890817-1-fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0396.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3800f9e-5a6a-4a2e-14c2-08d93d7fa278
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5775:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5775A33E5BAA06F7564D4967BA1F9@SJ0PR03MB5775.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yGJNu/cugMsqhTJ+M05GhZDVvxZVmFgzr2d8Rn13wgtg2jDom3c3x9pNWrmkrPzp/byTe7t8Vpu1Qz9Nfs+OkloY3RMqpcMhiV2BEg1pFfuxlQTy/pegfEa/q5WRxu1652/EgFT4glP0q3cVZ5RkKKcCsny0a6Z59aftMhei9h4XpnPmVBLB/9zSB8pm6ZUnK0M4ckfN73EN4mFedRR9DuihlWlNK8g6fRmLlBRF1fOvZ4NkRtW5q3Hx72KGcuiTbVxCUEde+QOAzHTIVgXdZMxZlIwhNndkYYNbX7OHUjgLuDl+xJsrewzO+nH2+3Xy6e5rTD1EoScYzcTTluNdQ38FaTisQs2LHFZgTLx1HU8fbFDcrNvcQaAAq7vr0KDpcl10aeYwMCrgWml5zjqLEg4Xvff4YxeNNSLl+s/hbnsxZ2Kl8Cgm9A1Pp1K1oKLVj4wN+yQWrahTjcOlNARWofWh9AqmuwFzzf6TqZGXU/Au/TuTMs4e8F4TF1tAjcb9GfnBTbZzvdRK/DdMh3w5GwyD5F434XTTtLik5h8Xdb7cvMnyaSr14rurLrJYGi1HjpX6qdetwXcW68or9QWDD1UNfk9VeBy8rj/bRr94MdXE3iILSZorSPxzX8IH7JOH3hGJT5SgRc6l17R9A4Hvsmlu6dL1S2W54U10C/Q+IdBPxtZeQxVULt6HXWlzRrQcEhT8ftiD3yiqelfTB9tjWAKOFqsaAIOFQRvE8tx8dbLKg9dux2AxbKhZGURWg6q9TH3lkCH4jM5L8M5UHwOcXsj1BuWV4MZB48c/quX90Y9Ec203tMMCUESRqhoJubNF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(4744005)(2616005)(66556008)(66946007)(16526019)(478600001)(66476007)(38100700002)(26005)(956004)(36756003)(6666004)(8676002)(6486002)(8936002)(31696002)(186003)(966005)(5660300002)(316002)(16576012)(53546011)(86362001)(2906002)(31686004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bENjU2I3dlZ3NkpNeFpSMjZqZlZKNXY1U0NLUVhvU01QQjR2bWFmQVNyVk9S?=
 =?utf-8?B?R0RKNGl4YzM4enpqYXRyK0NJZGFPanpsTktIa3Fya3hRenBtRWVtcTVzZk1V?=
 =?utf-8?B?TDhLOS9sYy9haklBMUZ3aytrVEdoU2xyOWx1elZ6eXVaZExMMmVvWVAwWnFt?=
 =?utf-8?B?MWxrUW1Da0M0cEIzL093U3czQklzaEhYdjlXKytxK0E0WUVYdGhPcVRhV0xH?=
 =?utf-8?B?VFlvd2RnTXhwR0ZobG1hZmlEODRnU0xkY3RXK3RSRXp1VDFJbmRYS2NjTnQ4?=
 =?utf-8?B?VGYrdU9zblhMOXlTc1Nqekp2TU1CN1NvMDNaV3JkTGswc3NmTVFlazJMekR5?=
 =?utf-8?B?K1hTV2lXNWg3QXRFeWxmRjZtL0xES29wc05ONXBUd2FQTFVoSGUwNFVqV1p4?=
 =?utf-8?B?aGl3N3kwMzdmUVRmcTN1N2JLeEtEYjFaM1M3bVJsOGlubUZHVGw4OUl3RGhH?=
 =?utf-8?B?bVJjTjg3U1hRSzU0V3BHZExGRDlwL01Mdm9YY0hmUW91eWxValdRb3VmM0Nt?=
 =?utf-8?B?RDRxV3BVNTJCUmVNMTNMK3VMRThDOTNJTHl3Rnk5U0JWY2wwQzZWazBVV1lx?=
 =?utf-8?B?cFFabUtyR3B5WVZtb2Q5OGVIcksvK29FaE03cUwvcUNBbnd4dmphMFJQY1E2?=
 =?utf-8?B?N2lmWHVYT0VodkpiT0tBaUV0TnVLZWNtSm53djZOYm5tOFpLdGpqeDNOaVFH?=
 =?utf-8?B?c0xzUHJIR0paQ1dHWXJPckVESHRvOSt6RFVLamgrSGowNWR4VW1PRThaZGkv?=
 =?utf-8?B?YWxxb2ZUNDRCQS80amhaalBkaGxjOFZrY0EwUnU0MlhvZUI3SitXUkIwOTJJ?=
 =?utf-8?B?d1ZzcDlkVmlOTTZaaDl4STk2RzlMUXQ2dmI1amZ2eVlHMnhEdXFrbGwzNHhD?=
 =?utf-8?B?RHBCSUtHbU14YVVIcXRNbjhpQnErR2hXQ0svK2xGY2Q2VG90Tkx5VDFTSmhn?=
 =?utf-8?B?RXZpOGJVbGpTSXBKS2FMTTZueVV2eStINVlkcEQ4eHdaUUpjd3NSSXk0M3Qv?=
 =?utf-8?B?SzJMSFNWV1V2YnlISEJyUFBhRVNrSUxRRTRYVEpFMmk5L2wvZWFNSHRrMS9G?=
 =?utf-8?B?Q2xjQldYV21TbGZDWStjSXNnZTFhdXh5SzVUOXJna1hwTHRUOHk1d1FKSkZM?=
 =?utf-8?B?dTNqVXF0RkxaUTkrYjRZaC9iTU1YUS9wc0dHUWNCTFNqOUszeWtKN2V0Z3g1?=
 =?utf-8?B?cWtjR1U5MlkrVUJPOTh5dGFWT1BSc0lUYnJXR3p2ZTNXNkxFaDFyNVVNeTdz?=
 =?utf-8?B?dHAvZ2pHWUJHMDdJQitlamMyZWNzSXVvWXptUHNiTnZiei9qemM0N0hkYkRq?=
 =?utf-8?B?WTFucDc4Qy8wQ3dkVm5sVU1SdGhsSFBlN3RUM0E0dFQzT3BCZDk3Y3dIaGN1?=
 =?utf-8?B?RGpaZEVCZG14OTkxeEtKMWRGVndScnBuUk1kVmd5UTBZemh5NExUZ0pZOEVo?=
 =?utf-8?B?VVJXR2J6bGJxbk84djh4M1hDRnNpazF4N05HSGdZTm52Q0NvRndxaW1XMy95?=
 =?utf-8?B?VzdaSmZHUWoybzRIVEFIS3BxUFhWVGVtMzZQWmtuUXl1Z1NGZXo5a09CbEpN?=
 =?utf-8?B?OGY2S3lBL1A5cDFPYkVYUWJicDJrQjhyZ0hnaXl2cG5GWkE5RzBXc21oTUgv?=
 =?utf-8?B?dGtKZlRhcTY2bEJMMVZiYXdidHpIOEpSQUY4b0Q4WkxOVXZYdHJSNTVFbUdy?=
 =?utf-8?B?OG11ZzlOVVEvTVk4M0FUMlkxdWpVMkRDNmFFSHRvS0h0SnB6ZGdTS2V6OWRV?=
 =?utf-8?Q?TFVty/GOoYUB9TgzvAIVkXPBLZrEdmcehG19qj8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3800f9e-5a6a-4a2e-14c2-08d93d7fa278
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 17:34:24.7774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZlWLryENd9iZ5rvbw8MK2Gh+dALsGLPzwyEVcekx08hx0KQhLGW5jPQMefBXQojqvOJme9Ic6TIfyNFIwJmixt3qCKFxtaXQ1NVmEh/py+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5775
X-OriginatorOrg: citrix.com

On 02/07/2021 18:06, Fabrice Fontaine wrote:
> Drop -Werror to avoid the following build failure with -DNDEBUG:
>
> In file included from <command-line>:0:0:
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/xen-4.14.2/xen/include/xen/config.h:94:0: error: "NDEBUG" redefined [-Werror]
>  #define NDEBUG
>
> <command-line>:0:0: note: this is the location of the previous definition
>
> Fixes:
>  - http://autobuild.buildroot.org/results/66573ad0abc4244c0dfeac8b684a7bfcc31c0d4d
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

For better or worse, It is Xen's policy that -Werror will remain.  95%
of the time, it is the right thing.  We will however build failures
whenever they crop up.

This one is weird though.  How is NDEBUG getting in twice?  What does
the rest of this build environment look like?

~Andrew

