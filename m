Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99396337021
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 11:37:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96443.182460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKIh4-0004J8-VZ; Thu, 11 Mar 2021 10:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96443.182460; Thu, 11 Mar 2021 10:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKIh4-0004Ij-S0; Thu, 11 Mar 2021 10:37:26 +0000
Received: by outflank-mailman (input) for mailman id 96443;
 Thu, 11 Mar 2021 10:37:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0MTW=IJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lKIh3-0004Id-Fy
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 10:37:25 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66f198ba-7803-4afb-935f-2684380ca3c7;
 Thu, 11 Mar 2021 10:37:24 +0000 (UTC)
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
X-Inumbo-ID: 66f198ba-7803-4afb-935f-2684380ca3c7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615459044;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=DsaCN3T5sodwJ/bJ4UDVTBLDfR8xYuJolsmH31scPc8=;
  b=M/mXJtFsNuzVfQN7QgYmgryCW+SFJzXJ+KimreaUgSfUHLGPgPrgVj9C
   zCoyu5o8bakEZZboqEPvofEAyIXBMYZoUbzBvbgsQNXgMOLYTomgJnDUn
   2sbfaD4y1NzcdxA7g7tGY7cKRdGZFRgBZJn3K0k/9EKrAWG85Y4BfN4nK
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FkjFPoBZPYfz1AWYFkd8cRwNrNG3RSP5qXsMC6L0JWfBUDlOM45lU+wii7qo/QGSpXBlwyZhH4
 ZCYkNENp4vIsIHG7Vxo7BhT5ed8r8LsjwG4vVHmhCSgNOELX6dkTE2+8UTxsHMLzzyvW2vFAQq
 DRwrEhfyXRhmiDTSuK6VdBSsYTkIF4oSDkUadePiMl9XqHSRDn0/32XSlzQAVJvWwFZqOjbLMQ
 aDGe5FdFXnre0ZZEkScEJrVkJzqxDEKGFKbZwlYP3g+/kUIgBafh1VUjfgEmQwXKhxgEQKq+BC
 r60=
X-SBRS: 5.2
X-MesageID: 39053044
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:n4OxQKsbJlwbwP9RCujudQGL7skCiYYji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOj7U5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qz6Y
 5JSII7MtH5CDFB4frSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjztRICzzKDwReCBtA50lGJ
 2AoudGvSOnY3QLbsK9b0N1ItTrjdvNiZ7gfFo6FwcqgTP+9w+AxZzbN1yj3hkYWy5S2rtKyw
 n4uiHw+6nLiYDf9jbyzGnWhq4m/OfJ6twGP8CUj9hQFzOEsHfVWK1Ee5mv+A84u/uu7lFCqq
 i9nz4FM95o433cOkGZyCGdozXI6zol53/8xVLwuxKKyqaVNVFKabsyuatjfhTU8EYmtt1nuZ
 g7pF6xjJZLEQjG2B30+tmgbWAaqmOPvXEgneQP5kYvKLc2Vbk5l/15wGplVL0EHC789bk9Fv
 hvAMz29J9tAC2nRkGckW91zNO2WHMvWj+AX0gZo8SQlwNbhXZj0iIjtYEit0ZF0Kh4Z4hP5u
 zCPKgtvLZSTvUOZaY4IOsaW8O4BkHEXBqkChPfHX3XUIU8f17doZ/+57s4oMuwfoYT8Zc0kJ
 PdFHtFqG8bYSvVeIyz9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykvGnv+4UDqTgKr
 iOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+dEmJpu7NN432ps3WePveP9PWYHUZc1K6Jk
 FGcCn4Jc1G4EzucGT/mgLtV3TkfVG63Z8YKtmZw8EjjKw2cqFcuAkcjlq0ouuRLydZj6AwdE
 xiZJfukqaxo3iK7X/Fhl8ZfyZ1PwJw2vHNQnlKrQgFPwffarAYoeiSfmhUwT+hKgJgSdjVVC
 pSvU5+967yD5H4/1FsN/uXdkahy1cDrnODSJkR3oeZ493+R58+BpE6HIprFQvKEBRxsR1wqH
 hKbTIFQkO3LEKvtYyVyLgvQM3Pfdh1hwmmZeROr2jEiEmarcYzAkcAUyWWSs6RiwY2Tz9yjl
 l8mpVvxIaoqHKKEy8Ske44OFpDZCCyDKhdBAqIXolSh4vmYRp9V2uMmDychSwiY2aCzTRguk
 XRaQmvPd3bCFtUvX5Vlpzn9155bU2xVUN9YHISi/w0KU32/lJIlcObbKu61GWcLmYYyuYGKT
 fffH85OQV13e260xaThRePHXgr3Y8VI+TYFbgvGoujnU+FGcmtr+UhEPBV9po+a4yrne8PTO
 6FewiaaBn/EPgk3gSJpnAjfAl4wUNU5c/A6VnA1iyf2nV6PN/5ZHJBbJsfK8uH72flS+2Tua
 8JxO4djK+VCCHJdtWCyavrdDZNJRPYnH6uQ4gT2OVplJN3kIE2IoLSXjTJ3kxWxRkSLM/7k0
 UFXaRwiYqxTbNHTog3eyhD+EAum8nKBEw3shbuCutWRyBns1bre/eI6aHPs7whHwmooxbxI0
 CW92l48+3eVyWOkZ4cBKRYGxUdVGEMrFBj9viFbYveFUGDcPxC5kOzNjuFS4BmIZL1b4k4n1
 Jd+NGHn+ieair+1kTxhFJAU91z2lfiZ9izDgKKEfNP6PqgNz238+2X3PI=
X-IronPort-AV: E=Sophos;i="5.81,240,1610427600"; 
   d="scan'208";a="39053044"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnXGHDNjPt6aa3l+NinNv2YV2JxWZult09avUM1xQRWbor/sUqMrgMS9eZBxQLvJnb+fkhF1dAz9XZm5ewOAusdvF1Vxm8rhheJFs8JrVPrsN4WI3pkJ1QYZZiu7W3j/nWaHAitpDcBOB6jsFUl9rBcXFy3HdaQoPvZK5MUFujLe/XwYFmjEmy4qrnSa4U1GF6bqYL8FEZSe8B/EPud75QxFsm5a/pNppT09363uYgFKQvzirVhM1R9QQetsrpzwRMLFYVf6va89pMyfExAjGgOAhAjzaGuSxo0uc9fIl2i+kpLGUn2pnvDJAY3iGnUowZC0jSBmjEkDZHV55N8Ezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLOWvj6/I7vNuUP4n4VkxtN6WBjipND4hx9RMT1j7g4=;
 b=FZItxeFRSWzcVMHov77pmvyEXtbTeBeHLDeXDgzaW6YpAs+u92ep2GMQfSjhJXRMwVUJ1Txe2Zv9lcvs0U/Hf4sH4Z9TZ9E/mKaRNIS+lq+UUouqUXLhtS7HMACz4kK48p0f+5PceOgq5Uu4xp55ZRpGvg4PG0O4nK3jJ7tNjzqDgEErFPAUO6Ed7EBDzaPAW0+7C/SuOgMRUqMPD+JtskiDAZ/aZkNSpVNXEloJODSa6rfTe5EueIZqxh83VficPShtQmHdvX4uyeUFsC22O+JUS8oUxyjE3wS9sE5UnOHhEPon377Dhzxq54jZ6/v2mkWtqb+sbxWGzPwY9hFgsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLOWvj6/I7vNuUP4n4VkxtN6WBjipND4hx9RMT1j7g4=;
 b=euDVi7NVvLsq6nk3unPClThs3ofIDLInxobXojeZ707mKmqWwco4SPX6ayeAj6PJqEb17TjyeZD+ONhzCeGrJSHB9rlWDEEWa1aT2S+EkaX3mGeymHyr9rDFiZ/d8YV1z0sR+F5TqhUVdWNXuYFHKrRU2jBWPd/9FUd0vXB7TC0=
Date: Thu, 11 Mar 2021 11:37:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: xen-blkfront: BUG_ON(info->nr_rings)
Message-ID: <YEny0OzZvJZybY30@Air-de-Roger>
References: <CAKf6xpuRADfXfC2JA_D==-k+RTHF90h3+um1uiBf9-QXGFk+zA@mail.gmail.com>
 <e2020ca3-4dfb-793e-f37b-d33b77cfae88@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e2020ca3-4dfb-793e-f37b-d33b77cfae88@xen.org>
X-ClientProxiedBy: LO2P265CA0111.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e96b0bda-2cea-4142-334e-08d8e479a13a
X-MS-TrafficTypeDiagnostic: DM6PR03MB3946:
X-Microsoft-Antispam-PRVS: <DM6PR03MB394621136ADD96F5D51F86F48F909@DM6PR03MB3946.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mJcglVYt7UCMvKtUU3e25BZq2i5QYv++VghCkkM94wUseQgyQLYqxc7OKzi0w2HmUNJblz+LMMOY7AKDP+woj04VSrq8zNnLmxktDjsVk44L0gAIK/m6xqyi4nxjcu056+K4XlZ3gptzKClmGHxIykLg+r3iugJ+HWKpuA+p0YlbR0T33v8vFolFHzJfYaEA0BRMwSvVKptDyTRTDtIO/SCp/8CpAcI7jQ4KFiBJZ4nuun165o35ZNhN5mIPy1n91m6rdDhC/QOZC2aauRwvIqtjg9whqP+6uR8R+R7qzmB8XfYLZtPWttkpZ4X610CfDdgPAt35MA+PzaWyNA3/Dz7qt8tzoHzXVhwOz7QW2orWC+uI2ptxRbuUC3h3O/6RGpFfDEz35Vr7LTeWnVn58zuTAtCpqPdfChHMxjcgvu1fDSZ045ttxXx01SqSBkivCVZL4Nb2hxr404iznxvaNjes2vGiBbnmX4DdZa1Mw9+LWWV/a/DZlMBgcrfZKlzkxfZexiXRZVNZ1Jr6Dhux6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(6916009)(2906002)(53546011)(83380400001)(4326008)(85182001)(6496006)(86362001)(316002)(5660300002)(478600001)(33716001)(16526019)(186003)(6486002)(956004)(9686003)(8676002)(66946007)(26005)(6666004)(8936002)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VFc1elJiRkwza1JsZk5BNGlxUDhkQW1CRkk1R011eEsxK1M4R21ZYmRPcUNr?=
 =?utf-8?B?UzJBalpsUWJBOHNna0hLSVhOWEtsUkNqSW50SUFvN0dpV1RoNHFUajB6T1Bm?=
 =?utf-8?B?RHVpZGdwenkvYWp4cmVKb1Jka3BnOC9xdlJHZ1RWdzh2VVlHdGVaZkV6ZW9a?=
 =?utf-8?B?OHlhZi9XRnMrREdjQnJoMnZXZnQvR1JPSG5rYng3eDQ3clg0QTBZQjQ5QWZX?=
 =?utf-8?B?YkM1NXFrQUhjSlIxbEJweUxQRnJ1RFp0UmxORitPa0F0YzErdllWMEttS0k3?=
 =?utf-8?B?bmRpQXhuL3pUL1FMMTc4K2UrMXhJcjlHbW15cjdLSkltdWpEQkdlUytYdkdJ?=
 =?utf-8?B?UHBQNytkMXlHazA4WGttSEd4VHZnSitGNXJqRXdtUTkzaVhlaUEvcGZzVjRq?=
 =?utf-8?B?MGdZT0FOOFI0dW5KUm5oUE9IY0VhbGNjSVBsRU1RSFFuSWRUMGwybzB3VXpE?=
 =?utf-8?B?UkFid05KY254WTJpOVdvZUUvRUtxRUx5eGdtakhLNEhnWXkzbmtEbmxZM2FO?=
 =?utf-8?B?eDZoOUh0aWpQWFdqdkp1ZTY1c3k2ai9HNzJkZGZzYmMwaXdYNnFQOU1tdUI1?=
 =?utf-8?B?amFZUTM3N25mOFBtcEhQWktDYlNxbUxCN2Fuc08xZksrZUhTWFFvajdxVWZy?=
 =?utf-8?B?SzBXZWtpbXlZMmp5WFNSOEN3QW1JM1JxcFM5ZXZINjc5cnMrVk14UmtjTDYx?=
 =?utf-8?B?ZmRVK0I5dlk2WWVnQzlkM1NlcDEwWmhwWVJGeHMzMTNhTTg2RFMrSFRSR2JU?=
 =?utf-8?B?YlBLOGJqQ0htVHY4L2lMTFV0Mi8zQmJ3T2NMT2RYRUgwVVVZWm9TNEVVNXpm?=
 =?utf-8?B?WE1ZcGR3Tm1HN1RUZGVub2t4NEE4MWlXaXBzR3hkWVU2WTdScUJJUkNtbXZN?=
 =?utf-8?B?TUJLVHBtTFpmSUd1L1lKY0lNZ2s5czNreEdwemhUREY2cTZndVlIdDZVT3lh?=
 =?utf-8?B?Sjhua2FjSzNVMlFKZnJaQjZLYkl1ZG1jTUtaRXFZQkFpYVU0ait3cWlIYWI4?=
 =?utf-8?B?bDdTbnA1M1BJZTl2b1ZoeFJHM2lZSE53NVFxY09veHd2bW9hZGZZTnAxWFFZ?=
 =?utf-8?B?OEg0VHpLMkxzSWwybTM5RzRLK2o2V016RVJ6eHJlVmljbHdFM1BVYWlnTC9M?=
 =?utf-8?B?UFJSQSt0NlJzdk1WZWdmQnBTRnQ0Zk5GN1U4ODBaM0FRZDZsZmFLTGxuS2JV?=
 =?utf-8?B?ZWFyZ3ZDWVlOWXo0ZS9BNUJLTnlEZ0dIanZQUUlPNVJtQy9ub2dZN2NDMjVV?=
 =?utf-8?B?R1BBZjdUOGNJaXh3c0pZbzNpMEQ2UjNwUGx5T01Nb3NiZWZWeEVxQVloOUZp?=
 =?utf-8?B?eEVmeUNZZmxhN2d0SGJoUjJtaXlDV2xaL1lEbFN4VlJabmpCRmJIdlhSTG1C?=
 =?utf-8?B?bUtxdGhLTUZ3aGJ4QWR6ZWdxdnBwUmpWZStkZUc1eGpZQlFrTWlCYzZjOG80?=
 =?utf-8?B?dFJHSUdCd0NkUkV2anVzOU0yVU9HMkdpMVZiY3czdnd4aERGTTlpa2xZL20x?=
 =?utf-8?B?S2FTSFh4Y2tlNjg3dG9IT2I1dld0TUlmaytXRlRONlhkV0J4WGhGQklPSERZ?=
 =?utf-8?B?WGlKUmpNeVR5V0lkSjZVMnk1aGowUW5LK1oxNTAzMkRCNFZkSGVpWUhkTzZM?=
 =?utf-8?B?MmtzU3h0V2Y1Y25VZUwzQXAvRm10V3MyREVRR0I1VXB2ZEcwSnZqYlFEcUNk?=
 =?utf-8?B?ajNUdkNUMDYyVVRMQSsxcmMzYUdnWW1lOUZ4emdoUk5UWG5paklPTmdFSi9l?=
 =?utf-8?Q?6RRqtDN2B5pscQqqsWKdKOSQvueA0x8XhLxc2ta?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e96b0bda-2cea-4142-334e-08d8e479a13a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 10:37:12.2257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LNrSczb/HE+w9W/ZeMvMpUjoRVP5F6cC5Jl6WkQ6kAPkYAaz0UczcSfzB7ARVtvSIgU0VCPuDA+BKDIHtJL1Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3946
X-OriginatorOrg: citrix.com

On Thu, Mar 11, 2021 at 09:01:51AM +0000, Paul Durrant wrote:
> On 10/03/2021 14:58, Jason Andryuk wrote:
> > Hi,
> > 
> > I was running a loop of `xl block-attach ; xl block-detach` and I
> > triggered a BUG in xen-blkfront, drivers/block/xen-blkfront.c:1917
> > This is BUG_ON(info->nr_rings) in negotiate_mq called by blkback_changed.
> > 
> > I'm using Linux 5.4.103 and blktap3 on Xen 4.12 (OpenXT), though I
> > don't think that matters.  The backtrace and some preceding logs (from
> > the reproducer) are below.
> > 
> > I just repro-ed with this:
> > path=<backend path/state>
> > xenstore-write $path 5 ; xenstore-write $path 4
> > 
> > info->nr_rings is still set because of the unexpected transition
> > XenbusStateClosing -> XenbusStateConnected:
> > dom7: [ 2866.574853] vbd vbd-51728: blkfront:blkback_changed to state 5.
> > dom7: [ 2866.578385] vbd vbd-51728: blkfront:blkback_changed to state 4.
> > 
> > I'm not totally sure how to handle this.  The XenbusStateConnected
> > event should be creating a new blkfront device, but instead it's seen
> > by the old one which hasn't been cleaned up yet.

IIRC xenbus state changes (like you perform above) never trigger the
creation or destruction of devices on the bus. See
xenbus_otherend_changed.

xl block-detach however should indeed remove the device. We should add
an option to `xl block-detach -w` to wait for the device to actually
be removed before returning (or exit with a timeout).

> > 
> 
> Sounds like blkfront needs to be fixed. Once it is in state 5 the only state
> it should go to should be 6. From there it can cycle back to 4.

Indeed, there's likely some logic to be improved in blkfront so it
doesn't get messed up so badly on state changes by blkback.

I'm happy to review patch for both blkfront and libxl/xl in order to
make this better :).

Thanks, Roger.

