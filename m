Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 927684F7824
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 09:51:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300474.512567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncMvg-0003pB-FI; Thu, 07 Apr 2022 07:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300474.512567; Thu, 07 Apr 2022 07:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncMvg-0003mh-CF; Thu, 07 Apr 2022 07:51:44 +0000
Received: by outflank-mailman (input) for mailman id 300474;
 Thu, 07 Apr 2022 07:51:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qv4n=UR=citrix.com=prvs=089d11f18=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncMvf-0003mZ-4R
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 07:51:43 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e9558aa-b647-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 09:51:41 +0200 (CEST)
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
X-Inumbo-ID: 8e9558aa-b647-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649317901;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=iuzz5TjosdkX7axvdCs2xyp2M77EnJ+zWOTnFVIIdZ0=;
  b=aEArxyl0X6/7k3VMAPjtmMW/H71YHH6dZfQOhpLB5wQJJQ0EJSfghVun
   urZPHOO3MzUzEKetkSbwJjCbhWHYSXXd5ChWkgzUpwvLrnhtqvGZwPwD/
   PmsVwcA5NPMuGCmU5dJLAmmmavRFkSTNOe7qRRd6mK4eTW58sm1Pkt5mm
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67655932
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:m9fQM66EjgUDZieBmhoUzAxRtBTHchMFZxGqfqrLsTDasY5as4F+v
 jdMWG/TPPuKMDCheookaY2xpE4Bv8OBzdA3SAU+pHxmHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YThXFvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurTrFQd3GLLNt905eCMIMAdBIoBU2brYdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQQqiDO
 ptCM1KDajzyeQBpYVw0BKgCker3n2bcfT5C81ea8P9fD2/7k1UqjemF3MDuUt+HW8RT2FqZr
 2Tu/mLlDxVcP9uaoRKd+2+orv/Cm2X8Qo16PL+y++NugVaT7ncOExBQXly+ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0ZjZLO7RkskfXkPOSulvHQDhfJtJcVDA4nJRqRWIMy
 V6mpvfCP2xMloKKZGC886jB+FteJhMpBWMFYCYFSy4M7N/ivJw/g3rzczpzLEKmpoarQG+tm
 lhmuAB73uxO1pBTi81X6Hid21qRSo71ohnZD+k9dkas9UtHaYGsfOREAnCLvK8bfO51orRs1
 UXoevRyDshTVflhdwTXGY3h+Y1FAd7fbVUwZnY1QvEcG8yFoSLLQGypyGgWyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/MmOdLsVpR1kvG5fTgAahwyRoATCnSWXFXZlByCmGbKhzy9+KTSuf9X1
 WinnTaEUi9BVPUPIMueTOYBy747rh3SNkuILa0XOy+PiOLEDFbMEO9tGALXMogRsfPVyC2Io
 o03H5bblH1ivBjWP3C/HXg7dgtRcxDWxPne9qRqSwJ0ClY+QzF+VqWJmNvMueVNxsxoqwsBx
 VnkMmdww1vjn3zXbwKMb3FocrT0Wphj63k8OEQR0ZyAghDPva7HAH8jSqYK
IronPort-HdrOrdr: A9a23:yM4SgqPl7ds3OsBcT1j155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080kqQFnLX5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YdT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt9dBmxCe2Cm+yNNNW177c1TLu
 vi2iMLnUvqRZxRBf7Lc0UtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13jDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2u
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LrEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GS1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusq8q+SWnqL0wxg1Mfg+BFBh8Ib1W7qwk5y4CoOgFt7TFEJxBy/r1bop8CnKhNPKWsqd
 60dpiAr4s+PfP+XZgNdNvpfvHHeFAlYSi8eV56cm6XXJ3uBRr22urKCfMOlaaXRKA=
X-IronPort-AV: E=Sophos;i="5.90,241,1643691600"; 
   d="scan'208";a="67655932"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g65vN52xpCMMJKvKPHEoVC58q8HiPYH3IrH6dAm/pCjN0XYkQ+2pc4fbRRgsg3GqNZBHm0uW11UmfsX1iYszwcDCX+LFl45q8jK+sOLwwTPp/8TwG1qTFgxlmf+lCJOS5qdpjJbBKB9VCV+4a7YuWvjX4ABYKcbV7Z4Fqr7QacuVGwED0phZQH94QikYL2zsrXlYx55ET8VpzSRDO62Hq02vQlnQf0ffi+yLCSS/92oyCUfXmVahlCctzxve3dziohuJx/84PPxZVZOxzst+KLVSdEjLN1MvScMH/ekS05jKnBS8jT36cGqOmYkAg7D9ohbCtp/+Cjdo3VsyUdJOKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2Kpg8y5RPcHqkiCNsY2dXAlF1DobT7TsFHypAPVAbM=;
 b=h+WWsf1RpIoro6nGPgT7A568UJ8gLZQn6uE/jc7iwRKYAwaZ+S65wO51zy6ECI9OX9idzWLbIEpsbW6V0OdB8UzKPVd79j8nRXDJuEDWGa3aISvcSMxSl9VzXawEwdEmXYsMXwzbKv4tJX5RewWA6zITjRFKMzmfkjv929BzWuJrX2a3y/RVdlUgnrrsoxtpZ8ryyZz3s2BQOkuTJQY8ISwwQLdYA6u0R0nhgP3tPb1huSItCvHrhN49rLa2WwBaL4zPqAsFa9V8JKqYxYWrTCBphuAr5GELzxytNQh+k/AYT66JkpK4cnu3TWxuviubBVRwNZLIp8j2CaRS1PcRCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2Kpg8y5RPcHqkiCNsY2dXAlF1DobT7TsFHypAPVAbM=;
 b=Zmspf28J79sWXcGD6CWSUk96mf14dnf7vH9wTNoNRSqYYaGSGX0/kCJviHmtMqqajWd6w0jXfgpbDPLfAfI/faq76N1qPTewmsscbkXVCXza07V0DhTk2HVXRJ1/nKKmA+x0oHKKcWMv/0EFFfJJV3gpyhWrpu2pmwuFDhV9sIU=
Date: Thu, 7 Apr 2022 09:51:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul
 Durrant <paul@xen.org>
Subject: Re: [PATCH v2 2/2] VT-d: avoid infinite recursion on
 domain_context_mapping_one() error path
Message-ID: <Yk6YAoxuOZ4Ejosm@Air-de-Roger>
References: <6e1c7faf-d1ea-1a61-5452-9dec5b8fd221@suse.com>
 <fcc51df9-0896-247b-d4ad-0de4db6c2a9c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fcc51df9-0896-247b-d4ad-0de4db6c2a9c@suse.com>
X-ClientProxiedBy: LO4P123CA0411.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae49b020-6fc9-4e89-4404-08da186b7016
X-MS-TrafficTypeDiagnostic: MWHPR03MB2864:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR03MB28640FB9FE502890E48131558FE69@MWHPR03MB2864.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HbLae0XiqwPkTNf3455rIdOPLi/v0rT9ZjWxAf8mz9YEKRt1mFyMI0UR6iG+XNQeDdtGF7jC3/194BbddUtaHSniaQGCRALzeYDw+e+lZUvZgWw/74QDufqcOKkgirDoTfk/JyK2Wtt5WQY5B4KocrGcJkMpij0D2Q5f4XIy39xJIms0yRv10uzNnU1670q8swVgiTZxm0/nnukKR+lUwriqVxwaCjQsYeFrfLm5yKJkx2z44SIIEeqH0KmxyN3gQyStVLprQZFgVVuXTVw0XgnxfjsWv04XoFkNbodkmD3MZH5oOrbqPDmxXU2IMwAm6UE8Fk37ggWe0GEnpls6dnM7EVUokv/q2xbsjhTEWi26QPBp4eEIfxhln8mpUP3d+BUh8vhxB05h1xY3WjK2Hb9p2/Mq2WXfPvtcXKr2VY8uv45Ks0N+r+2dMGF2hG0m53RY7ZLHz7mA0DAZupVEpVexffz1DM+iZpvwbaI1sdNH4wJyUjxoI5tflKfdQ50QBO0yaxULF6+9DxfdLWwJ5C3HFRmn2Ajupi/y8HKNxa0gYHipTIarbJjNg9X2PjXzRrnon2MENgRe5wjbGnIAMYx9FSMGo3mHpNj30GDDSEbeOK8Uf0RCQ2qeuTHn2a3X37HzImRxstJnhgpuD2BtwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(508600001)(26005)(6512007)(9686003)(6506007)(6666004)(186003)(2906002)(83380400001)(4744005)(8936002)(33716001)(5660300002)(6916009)(54906003)(316002)(8676002)(66946007)(4326008)(66476007)(66556008)(6486002)(86362001)(82960400001)(85182001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmxHZjM3cjVwZTNHalRpNGRaa1BEZW1LR3pMbCtMcW5VeVNneXRDemlnUjhp?=
 =?utf-8?B?a1N3ZFUxZGlMNWVyVE54QllVNkJ2TU56UnY5d2ZQZ1pyamczUTNTMEkvT1oy?=
 =?utf-8?B?WHBRdHpUR2RTUlMyb1kwa3MwTUlXV3V5OENqeTNpNTVnaDNwcDMyeU4yYXpm?=
 =?utf-8?B?cTF6eXl4OHBMalF3cGhaNzFCb0kydktGdWN3L2VCTlhNMVpzT2ZNVTJHcXdL?=
 =?utf-8?B?VUlWNzVLTXpTTml2cFZVcWtLQ1U0RWhxU1hSMHhQTWtUOHpMWFJTLy9PKytW?=
 =?utf-8?B?VlZmQ29XN0w3YnBzQnEwZEF3bTZEOTBETVo3M2VicFVCRWdrQVEzRklkT2Ny?=
 =?utf-8?B?YkQ2TEp6Nm03V0c3aGJ3U1pzd2JzbWNIc3Jtc1NSdHN4SENDaldRNGY1bFhW?=
 =?utf-8?B?b25uclNHSVRUT1JoT2wvT09xMTM2YllTM3dvVk81elBMUEtRakpWTE9zU09T?=
 =?utf-8?B?SVh1T2UyQnBWNlprcHFjQWRRai9yN0NNVEFoU1d5NGpSdmwyNStvWlhDUy9P?=
 =?utf-8?B?MEw4TG1YcUhJdENRTjl6TFNJZEMvS3hKb3RveEttZHdRclJROFlzeGduSENm?=
 =?utf-8?B?bGlReEQ3WVVHWjlLZ1NmMnFtdjRlZ1ZjMjNRQzBzQjJITWgzckM5TEZpeDA3?=
 =?utf-8?B?NDdPOWJlR2E2eFl6dnhaWGZqZXp1VStINmRIUnE4a1RETXhteWtGVnJmSFZl?=
 =?utf-8?B?U3Zva2FTb2tIaEN0RjZHUWRRclprTEtlRmw2SDBqTkl1TTljYTQ4RFNpbXdW?=
 =?utf-8?B?QmphZ3FUaVJvK1dnWUxPZlh5N1FPQXArY2lHK2RvV2NNRTBoWEM4WUdSb3Z4?=
 =?utf-8?B?VlVvQmdFbGMzUXZRb3Z1QVYwNEpzT1ZvQUxidCt1NE1ndXdMdHd0REtWK0hT?=
 =?utf-8?B?RUgzeGxacUtqYTlHdHhGQW5pc0dTZHE3NWsyK0Fzbm52cUJvbS9iUkRFNU0w?=
 =?utf-8?B?UmVDYVNvZEVvNE9GT2dqRXZPc2lSWDRHN0JoR2oyR0dERmJDS2sycmZjdnhS?=
 =?utf-8?B?OEloa2FzZ3VYUGpZUHpDbUpCL2FNaW9NT1NIQUJqNTV5UFphd1ZYMWtUUHlM?=
 =?utf-8?B?MGNKZ1YvbE9LdmdjYlg2TnhobWZrTHQ3UUZkMWZOVkJmSHM3dU51cnIxRzhs?=
 =?utf-8?B?N3RLODFzVDNjTCtSRkpNalk1L3NaUGk0bjNNK1gxKzB5aXRhWi93YWZUUHBz?=
 =?utf-8?B?bkJzL2JlNy9aaWhuT2I4S0M2VDB4YkVXaHJxRGdHTjJETGt4RmxCY1VtWE9l?=
 =?utf-8?B?RUo2U2tDakFPZUtid2QvSmxFSk03alN3SkpPaWFKeXR5Vld5WHRXdVB1K29V?=
 =?utf-8?B?RnNlOFY1SDF4MkpZeVBWaGxHUmpuL2FzSFV5WHpvaXhuSXF0VHVwdC9McVVD?=
 =?utf-8?B?M0VvUUUyRVZvTzhCZGl5dWl0aTBVOUZmZVRiM3JkVjZhc28wTVNYWVRXd1JQ?=
 =?utf-8?B?ckVvQTJmaE5ObGtDTWorN3hpYmt5RngwVGRRSmNVN2JEN1ZaR2NnZ3VpU1dl?=
 =?utf-8?B?RmMyTnNhRVlkeEprbkMrY3h2QTJhME5DdStVR01SR3ZsWUd5VWRxbVdCYXVr?=
 =?utf-8?B?NUJYSzZTcWFQRm5hOVlGd3BMbWFweGI3Uk9lWllTZzNxVERNRlQzUVEweXJx?=
 =?utf-8?B?Sk5Gd2N0dzU4YjUyYysvTElRRjFxeWh4WC9HTUhvWFVkVE9Ma3d2MjYzRUV4?=
 =?utf-8?B?bkJJN2xpZHdHTlpFYkxVdW5PeURodFU2aktzQ2xvNE95WGxOUWFWclAvbG4y?=
 =?utf-8?B?dVJqdXloaklTSlVUOGZYM3A4MmQzRUdKQzAzK0J5YktGZi9tdFlEa3A5THpV?=
 =?utf-8?B?dTVwYmxybGZWNkRDOCtGcmtiMllTUXdtSFU5T055bzBOMUhOeFN6Rjdrc3Vs?=
 =?utf-8?B?djZRY1QxZjdGSDFwaENINmNaVkZhUGhMNHh3V0t1dko5TFlMVkw2blA4aUI3?=
 =?utf-8?B?OUhxS3ZsMjdrUy83MURIK2ViYUgwRUp5Uk5EZW8wUlc2Mkl5YlU4b1UweW5H?=
 =?utf-8?B?T0UxL1NJekFWRFBRclRaaGN3ZlRaWVRNMHJYRTVsMklQOWJ0NC9oTndOV0Rr?=
 =?utf-8?B?UkdYT3lNYzFsQU1QQU1Iby94UnVrbjVMbm44WTI4d1BBQzNwcVFVeXNCelNO?=
 =?utf-8?B?RWRLeXNrQnRvcHNpTzgvaGFPTGdyTEVPanZURXhqV3pRdjFlT1hBdFUrelVE?=
 =?utf-8?B?dFdjVGJGWUgwbDNIQzlYNWU2TXBjLzB2WnFLYTJSRlM2WFhMUmJJdHpRY0Y2?=
 =?utf-8?B?VWNzc3Bqd0Y3NkxMWWZNeWt3S1l6dHpITW9CTUNuTkRNSzZxQTR5V3c4THMw?=
 =?utf-8?B?Z09KT2craFM0QUJyM3k1MGdMZlBVWTJUdDFTelZPbStBU2U5dUZzTFFjTVo3?=
 =?utf-8?Q?+M+64BcK96ATw0jc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae49b020-6fc9-4e89-4404-08da186b7016
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 07:51:34.8358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVL4ql0lp/P3ier1EXPebeJIzFrLM6z7UIljQa3hD1egYJFHgR6DGKj1B9UnwP9dLlODm4D0zWwCVXWl6gD6Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2864
X-OriginatorOrg: citrix.com

On Thu, Apr 07, 2022 at 08:11:45AM +0200, Jan Beulich wrote:
> Despite the comment there infinite recursion was still possible, by
> flip-flopping between two domains. This is because prev_dom is derived
> from the DID found in the context entry, which was already updated by
> the time error recovery is invoked. Simply introduce yet another mode
> flag to prevent rolling back an in-progress roll-back of a prior
> mapping attempt.
> 
> Also drop the existing recursion prevention for having been dead anyway:
> Earlier in the function we already bail when prev_dom == domain.

I wonder whether it would be cleaner to stash the previous context
entry if present and try to (re)set that one instead of recurring into
ourselves.

> Fixes: 8f41e481b485 ("VT-d: re-assign devices directly")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

