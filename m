Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E6B44E90B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 15:36:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225275.389031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlXed-00081T-3Y; Fri, 12 Nov 2021 14:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225275.389031; Fri, 12 Nov 2021 14:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlXed-0007za-0F; Fri, 12 Nov 2021 14:35:47 +0000
Received: by outflank-mailman (input) for mailman id 225275;
 Fri, 12 Nov 2021 14:35:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdsq=P7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mlXeb-0007zU-Lh
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 14:35:45 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d026e2db-43c5-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 15:35:44 +0100 (CET)
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
X-Inumbo-ID: d026e2db-43c5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636727744;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Ds2f7A33RJrf0LSr0rxdduWGhzUPoxnYPDT7GBBoJ7Y=;
  b=APGJJ8GZxWCVhRtMvZ82ChZUfZljqBV+s5EsdG22eBuF0jfQzBXsUH1S
   ShF4V95y/ZiLEeDQEsQA8omoxLxO4OLi161WrE4hrV74098Ny+Rjv8dkg
   +ORc/aI7vQFL3jL+wbgaN0EJNf1F15JNeCxxX8AjQhKa8YN/2dyFQ8McJ
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LL4Xjlm3zi9E2zPopdqTFN2d1IW82PinG/Vr+Z60pysarJb3QtBKJYRjzyqZwRAa+DWdrcA8wR
 qqoMsHT+6AP/+03w1nD73QtMW5lbrCHAwE8I1nGe4VXebjp+5R2BBeZnqQuuEqNFB3nssVoW2G
 djF8+CsCIJ8KrTQ16hXQ4QJqrk1ObeDHsz5DIucs5KIYGPERtg8bctPj79nFaMdjePCBOgRCsv
 lqYs4c1cHLAX0PCjlvL5NUpi2pN9UnLPIENfvs9EMESKO96eECC8cMhSN6a7o0gw/9+r89siqM
 WX4Mx47mvF9T4RmyXZv5TGTa
X-SBRS: 5.1
X-MesageID: 57714557
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dVfNHaubGhzg3K1mf6s2g0o/aufnVLdZMUV32f8akzHdYApBsoF/q
 tZmKWCOOKuIYGPwKYp0Poq0/R4D6MLWm4diSwFl+ChkRXtE+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2ILhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl5aG2EDgIOP32uP0zdAt3Hn55ZIwa0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY258RRKqDO
 pVxhTxHXBH+akxrIFMuWK0anMWsuHTfX2FlkQfAzUYwyzeKl1EguFT3C/LWd8KLQ4NJn0+ej
 mPA42n9RBodMbS32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXO5q/Skjk+1W/pEN
 lcZvCEpqMAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+lmpfSujm4ADg+bidvT84JuZAxHB12/
 wrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIe6/txq5v7bZpM6SfPu0IWpcd3l6
 2nS9HBWulkFsSIcO0xXF3jjiinkmJXGRxVdCu7/DjP8tVMRiGJIiuWVBbnnARRocNnxorqp5
 iFsdy2iAAYmV8zleMulGrVlIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGGyP
 hGO51kKv84OZhNGiJObharrVqzGKoC6RbzYug38NIISMvCdiifblM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4n5VdPl1KLqxMm+eZznEgWnDqLLbiilkjP+efONRa9FOZeWHPTP79R0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhWdyVmXs6v9JQMHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu2NXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:demt/q6o6wTgXr4H+APXwVmBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdhrNhQItKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkDNDSSNykKsS+Z2njALz9I+rDum8rJ9ISuv0uFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH4mG7j5vZZm2m/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTtj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZtA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKQ/ZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv1nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLaU5nghBgs/DWQZAV3Iv/fKXJy/vB9kgIm0kyR9nFoh/D2xRw7hdUAo5ot3Z
 WMDk0nrsAJciYsV9MOOA42e7rANoX8e2O+DIusGyWTKEgmAQOHl3el2sR+2AmVEKZ4u6fa3q
 6xCW9liQ==
X-IronPort-AV: E=Sophos;i="5.87,229,1631592000"; 
   d="scan'208";a="57714557"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=els3Vky/lXho2/I5HHdAh+PlkGkAqe8v6Sr7uxrMPlnpnmRCZhNzXGs7UlfaJZ1bkLbqcA2xeA6itNqg+WGGLRAf9ScygJm/n19TDW7iqhMGalCDvuc7p0HXQ4DDJFCAHd1PXOddoq4qm0FiCKLtWYsL1wQFQJ2BuoGVZAG93uXJ+JVwk+iKzt2UdNe0FqqDbRGt4NI6Mh2Xn9IqOqHmgYhXUVo74nwDP/ma6wgja27i7ekjCqwgsEJ/8ySVNRBge6X/CNMF7aWePywry9fH3SOD9b4FSUErW0QiGCJd+xFWsMVaDP9E4DK9NyOC46XarlPb2yj6PzkJUg111fRcKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0bzl3Qa7MhO23SqKi3jN9f4lzmHAWw3lTDuxg0RuoE=;
 b=QTvKJWajtYoQk52WEnYyk0ujf281uJh06pwJiKhC7Y4ab6hYs6/RC7UXBDahbJkhau+owCP3GWgd3NQL1TnduwYcAE1Yj1uHCNuTnyrgJCPbQsxERc4srPDgZpQUldnqZDOhIuatncWStlB8eqQfzkcpM9y+OBx+NveSIMBk/YTibQ4LPyHI3hgNXDl2k1j6P5P5EnjHVg6Vd6F8I1qD0LOvlkzrVrdBXGvguORL1qTAJadZ/owbn4a29yAkpUoCFnSFRt8TonQNRAr1UeOT4AOwcCGGKEFowwuoLx/Et9ZeKpw4YjUHzSECJ66jPFf3melJ4ywpUk3MjMDHK/UFxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0bzl3Qa7MhO23SqKi3jN9f4lzmHAWw3lTDuxg0RuoE=;
 b=be414Z2t796IJpvuz4b68ksqfqzBxn+/Hh9XoUvXFc89MlnMkVJYjoKF8QeBsSwoSP65mwee5AczZxr2i1YTQmV0basnfNZK11OP/uBIyEFnPrQBsPiCu7JZQUiPHK2/KM3Mfkdjh/q6LTz8lRO3FT3tFl9TJfR0T7CNXlUwuAg=
Date: Fri, 12 Nov 2021 15:35:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 3/6] VT-d: don't leak domid mapping on error path
Message-ID: <YY57tg+oX/fN7FB3@Air-de-Roger>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
 <d4ca5274-dbbf-4cde-1a4b-0d7fe294c360@suse.com>
 <YY5vMYpmqVJhqyL1@Air-de-Roger>
 <b640505d-96cd-3306-ae16-eceb9e528995@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b640505d-96cd-3306-ae16-eceb9e528995@suse.com>
X-ClientProxiedBy: PR3P195CA0003.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9971efd-5aa2-4435-2cda-08d9a5e9b294
X-MS-TrafficTypeDiagnostic: DM4PR03MB5967:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM4PR03MB596771C66FE6DE43D5A44D9D8F959@DM4PR03MB5967.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: izyhifJTI5NyMMPXgLJ7zi/28Qwo7Lc1glXW5lGA4Zir2pjmuJNiwUzZ7mRapS+NPzqPgOn7uWHLPtCv5ZMFGSCn1h/UxC+4QIV94W0wN2OD56cIjdTLLWRF//Umn8cKxfHiIAI90gBRHT/AylZa9ZJ5MVoGGdPAKoJaHDSn+qE2Kz6sHc+MVWW6cpRSyz85Aqt4ghnxAM2cEA4MVYu7nB1a2JwPTGN+GOXWON7/QtnKnjRS81VuLuegi5VKaQaxTFchWg5mvowXSB5g17CisJx6vWypaqVJ+3V2KlbI813ccmTnQgojHOBOnOA+6tOcAPWZUmDYO9w4BAL2fIRuzUjyVuq4SdNCE7i53Fp4JQ95970VIlTqu0VZo3vArWmzKWpBStAPocVaPeZQDiw09LtnUznXuoVoNkC/IIsPIZL3z/W6GCdsAnfbWLDJOUbZLvkIY4ftpSo+9fVgT7TraOSAPlvxX4GZOhvZVx2gc7Ap5Fibck9/lRDzbuG0XmmFlBE0ShMtKrWoCW62I9pbwpBx5FCkc5r3pXI8ZbvUTB/QIU11puI1ch3L75vhubfNIXSdikNVL76AotKusmYUawYcZ2s0M+ndmACsMrSpbtKda1A6W1FW9JiHzuasMxJOQQi7Ef73S4rz81rEivWyeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66476007)(66556008)(8936002)(83380400001)(186003)(9686003)(6496006)(26005)(86362001)(316002)(5660300002)(508600001)(54906003)(66946007)(33716001)(82960400001)(38100700002)(85182001)(53546011)(8676002)(4326008)(6916009)(956004)(6486002)(6666004)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGNTZGM5T1dwTFREZG16aENXcklxSDV4OU9NWGh3ZlhZZWw4RG9OVG50N1Qv?=
 =?utf-8?B?bk5rOXV0d1RiZU91eE9xVUFTaVQ4QXR1bk9WNFdheXFUWitCUEduY09PN0Na?=
 =?utf-8?B?QWVOMjAvdGNnSER0eHZGeFlCZEFGNzJTNU5MMCtybS9Ia1QxcEdYTUJLR3Ba?=
 =?utf-8?B?YnoyZG14UVZ0dG4xUU5WMDk4dHRMZlhFVkd6dHZXU3pEUnNiTjY1aDRjMWN0?=
 =?utf-8?B?dWpnaVFhYm5FOU4rTlZ6djBjYkthQkJhTjRQTk1pSHF5cS9EdHR1TllGMHRQ?=
 =?utf-8?B?a2txRU1TVjhwVzBlenRPR1FjVFdPcVZweWFkc3RUaGNuRnc4czFIU2Vzdkpp?=
 =?utf-8?B?QXl2bXVrUWNYKzFCODRjVUNadVV4aUpEaG1qVnZVMjI3bVBaUlNGM3A4UkQx?=
 =?utf-8?B?bFdKanBKR29lc0pLUjBmZkRaWmhHRnVHd1orWnB5RlJnaWtWMFFNcmdLb1RC?=
 =?utf-8?B?bTBLMktNNkZVZGdjYkVjWWh5M1QrSHFDYmJvY2NyOVBweFhyME9SVjdlQXA1?=
 =?utf-8?B?Y0VIeGFaUUJpRnBua1l0UU8zL3J0V3J4NzBTa0liM3NGRWQvV0hmdTVQUld2?=
 =?utf-8?B?SFZuV25ZM2F6VElwMlg2YWNYTXlLMUM1enlPdWpIdUFaWFF6dkU5QzJ2TVV5?=
 =?utf-8?B?L2tweEx6LzFRSTd6RnNzYWsrdkcrVlk5VzloQUM0MlkzejVtRHhoY0VuMGhx?=
 =?utf-8?B?VnNaTGhPNWM5bjdtZEtzZ0xWdlhKK2VhUm1iSVhMa0tSV2g0UGFuNGFuSXdC?=
 =?utf-8?B?L0ZRK0NOSkthc01rSk9wa3lTdzFnOVY4MEZYK2lWYU8rWHdrMlM0MUxjMWV5?=
 =?utf-8?B?cUVNQXFGZmFIWGVDVUNxb1Y4TFhNeStPVWsrU2VPR2NKc2RVK2FINE5HVVI0?=
 =?utf-8?B?cTJvUG9OY0UxVEplZU5JODlxSEZJT2xDWDYyWUZyRFN5OW9VSEViZTFic0c1?=
 =?utf-8?B?NUNLY0tkSlVNeEJEWFRjbWlyWUJkUjVUNU1ySExIOGVkNmx6NWY2Qk1raEpO?=
 =?utf-8?B?UnNXdlVuTVVFdUMvdnNObXEzYkdhbEg3VlY5VEVHRklrUXBMVmlaZ2dmMFNo?=
 =?utf-8?B?dXBPZ05HeWxHWlNvUTNYS3ZQYkJ2VmREYnB0emR6T3JqakJCSW5qWVpRMWFS?=
 =?utf-8?B?YW0xVjlhOVJWSmRxQWYvWUNFUk9VOVlrd0hyQURXSlpBYVNUaUVXZm9ZOVJE?=
 =?utf-8?B?Z0k0M2pQYWNTV2lBUTZnc0Y4K1pVTUlqMXYycTNZMDlnTzJmaFU3U3VCREhX?=
 =?utf-8?B?bGJhdktsaVdMNzRCdlNRZVhNVWZyTmZoN3UyWUxRUkd6M1ZtV0JjU1l6dXdq?=
 =?utf-8?B?K3hSanZvN0szWi8yZ1hEUTl5UUNZdExTWkRTUWJZa0EvM29pNG5hSGd6QWxj?=
 =?utf-8?B?QUIrRzBibnFmb0VEV2VHekVyeklrdVhLREdieFNRTzQxaEQyZFFzcDVlUUIx?=
 =?utf-8?B?cktjZXNxMmZJZ2tuaXlCRjM3Q1Z1U2RHZFE1eWhsMmh4ckI1MDZkcmlEanY4?=
 =?utf-8?B?K0VMWGZWZXBmQ0loLzRkS1ZMNmNZcEFlZlJIRkcyZjRVT01WQlNzckxtQW1p?=
 =?utf-8?B?aS93YVZJQnhVZTNyTWJvVWFjNUlUODQxckt3Z281RTdlVEJmbkE3T0RxRW12?=
 =?utf-8?B?emxZMDJ5ZUZyQ0pKbmlxMnpKZ2dkY1hTR243R09NQ2szY0MxQnFoRE9vd3cr?=
 =?utf-8?B?ejlvZzhacnA5RmVEeFpGTTJKL21HNnJJWGozTEd3NytOTjQ2ZklGbGU3NThx?=
 =?utf-8?B?blZyVWRVOHRuQlF2bUV0SmdFbUxiMWJUZFFCNnpWZ0tzQTExTUwwWEU2Wmg0?=
 =?utf-8?B?UzF3eEtTREZOcW5MamRrVk9pejVENEEvanNSZnZscTNQQkh4TFZBNnBKSkJw?=
 =?utf-8?B?NURhd0s1SUJCU3oybmt0d0ZFSjJlcFdMUVZlbjVGTDJKMlBYeiszTzI4Nkdj?=
 =?utf-8?B?aEMrcCtpT2Q1YWZCUTZFWE15eWlXTk5pSXZ2bGJGQmpiYlFmQTU3ZmZKNGR4?=
 =?utf-8?B?eE1EZUxmTERXTXJyanZrRG1sL3g1NFFKbXZyYXVWczllMXY4MjRUSnFCRWwy?=
 =?utf-8?B?ajhsU3dVRFg5SnVlL1kwT2k5d2lEY3pIWno0dmdzVmRIRXdiajNQL0dXVWNz?=
 =?utf-8?B?L0NhcWZ6R2pZUXlvbldGdEU3UkV3QjFDN1JIMU5uKzZhY3VGclpqby9Wc084?=
 =?utf-8?Q?QMysmtUacCVn1iV7OXnZ0a4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9971efd-5aa2-4435-2cda-08d9a5e9b294
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 14:35:39.3396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEsIgETA94folTDb1nrprob4WFzw8YYQLKRYRMpdp+TjvPAKep0dsuKEbbEeFkwAfgcsCX2Eq+b7wDzrDv7hUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5967
X-OriginatorOrg: citrix.com

On Fri, Nov 12, 2021 at 02:45:14PM +0100, Jan Beulich wrote:
> On 12.11.2021 14:42, Roger Pau Monné wrote:
> > On Fri, Nov 12, 2021 at 10:48:43AM +0100, Jan Beulich wrote:
> >> While domain_context_mapping() invokes domain_context_unmap() in a sub-
> >> case of handling DEV_TYPE_PCI when encountering an error, thus avoiding
> >> a leak, individual calls to domain_context_mapping_one() aren't
> >> similarly covered. Such a leak might persist until domain destruction.
> >> Leverage that these cases can be recognized by pdev being non-NULL.
> > 
> > Would it help to place the domid cleanup in domain_context_unmap_one,
> > as that would then cover calls from domain_context_unmap and the
> > failure path in domain_context_mapping_one.
> 
> I don't think that would work (without further convolution), because of
> the up to 3 successive calls in DEV_TYPE_PCI handling. Cleanup may happen
> only on the first map's error path or after the last unmap.

Hm, I see. And AFAICT that's because some devices that get assigned to
a guest iommu context are not actually assigned to the guest (ie:
pdev->domain doesn't get set, neither the device is added to the
per-domain list), which makes them invisible to
any_pdev_behind_iommu.

I dislike that the domid is added in domain_context_mapping_one, while
the cleanup is not done in domain_context_unmap_one, and that some
devices context could be using the domain id without being assigned to
the domain.

Thanks, Roger.

