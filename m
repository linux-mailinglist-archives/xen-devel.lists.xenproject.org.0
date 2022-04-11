Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8AA4FB9AC
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 12:30:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302909.516785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrJ3-0002A2-Sg; Mon, 11 Apr 2022 10:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302909.516785; Mon, 11 Apr 2022 10:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrJ3-000288-Ot; Mon, 11 Apr 2022 10:30:01 +0000
Received: by outflank-mailman (input) for mailman id 302909;
 Mon, 11 Apr 2022 10:30:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MKM0=UV=citrix.com=prvs=09308b1b0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ndrJ2-0001w4-6F
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 10:30:00 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 555efc93-b982-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 12:29:58 +0200 (CEST)
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
X-Inumbo-ID: 555efc93-b982-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649672998;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6gaFlHue2/Ijap0jNc6Qz5qymc4QPOqXBkBeWhmpr4c=;
  b=EFvMPmd2sWUpphTg2Aeu+TfFRcm5KA1MeTLW/pCcvYYuMQ2uZ8j9x9Im
   cvVIPrqPK0eLHmb52TCjvnnvDZZru+Y1QdCkCniTEQkBwULx22a/GpBeb
   cRtn+m+Rc7xzrQ6QPy/c6/9bWmgPRWv0BOq1fJcKBkBkXtiK3vT/u659f
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68527943
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2E8KRazggUAg5iM37nd6t+fvxirEfRIJ4+MujC+fZmUNrF6WrkUHz
 2cZWDqFM/6MYGKjeYh2atm29U8A7JHRxoUxQQFvqSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY02IHhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplkbHqbgYkI6n2uuElCAEHFWZUMatdweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JATR6mPO
 5FxhTxHfk3dcw8TFwgrS61lmum1jXX5dgR6twfAzUYwyzeKl1EguFT3C/LJc9mDXu1JnUKVo
 G3X8mC/CRYfXPSH0Tuf+Xuoj+XStSn6RI4fGrC++vNwxlaUwwQ7ARwNXFq/qNGzi1KyVtxSL
 UAZ4Gwlqq1a3FSiU93VTxC+5nmesXY0WdBdDuk74wGl0bfP7kCSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaJiw9PWIEIygeQmM4D8LL+d9pyEiVF5A6TfDz3oad9SzML
 y6iiAVkoLQekMox9aCDpkiYhXWGqp7Sd1tgjunIZV6N4gR8bY+jQoWn71nH8PpNRLqkokm9U
 GsswJbHsr1XZX2ZvGnUGbhWQun1jxqQGGeE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOVS9/qYyjJ5fK5fTgAahwzRoATCqWdjCfdoElTibe4hggBanQEn6AlI
 ou8es2xF3scAqkP5GPoG7ZDiOFwm3lhlDm7qXXHI/OPi+T2WZJoYe1dbAvmgh4RsctoXzk5A
 /4AbpDXmn2zocX1YzXN8J57ELz5BSNTOHwCkOQOLrTrClM/QAkJUqaNqZt8K90Nt/kEzY/go
 yDiMnK0PXKi3BUr3y3RMSs9AF4uNL4ixU8G0dsEYQ7ziyd+O972hErdHrNuFYQaGCVY5accZ
 9EOetmaA+QJTTLC+j8HaoL6opAkfxOu7T9i9QL8CNTjV/aMnzD0x+I=
IronPort-HdrOrdr: A9a23:w07TgqMX8GBUWcBcTu6jsMiBIKoaSvp037By7TEVdfRUGvb2qy
 ncpoV+6faUskdoZJhOo6HiBEDtex7hHP1OkPIs1NWZLWvbUQKTRekIh7cKqAePJ8SKzI5gPN
 BbEpSWZuedMbAk5vyKmjVQWOxQp+VvuJrY49s2ZU0dMD2CRZsQljtENg==
X-IronPort-AV: E=Sophos;i="5.90,251,1643691600"; 
   d="scan'208";a="68527943"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6pmUTyy3jgcQyA1nmlPi2QZUNjynYv4LssEdB3/hsDmMyCbiqvLnq10RM3AOquaJaFsBnmoNu/F2A4XwqKHSgDSFiXel2XS+T2Lc3T6E1GZAmE7RgtCTz//RwmeBCKiqs0Bn20UhE3OBrlgWVHuzkf8nsGOoK4+2am022rx8zeoSa3yBkosngTLMlmTGCsuCeXUyere/5S7x5aTAe3TObvODYYJLqkIpX8dOht9egFfmjXAuWH+2Q1zDOmosY/CJC+1kL2F4JVVyP9VcRq1w0BXy/0iQ1mgOoMsFCZ/coawR/7K8V7gVzPMdxgPeHlekZrxaFT9L1yDS1dV/ZvdiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6CTnpQSp1wplXGnglhNQpxSpwnXmSn+VgzCt05rRGs=;
 b=nq36FRpSbxyrKVASzbOHlNUJahbo9CkmYDp7Dio8AMvtB38gbyXIPSdA6SE0fYLZbecOsLAtWtpjLKYLGN93DqsGuuy3Fvxw+1qxmgrWItHtE4DvbuINRYfpj2idhDMuxtQN1LVnPH0+PFKYdEOVDSqjH43Xm6QIIzgW+qFeaSn+RizHd/JzQmzTeybMaBbcLGjwUa0838nea7t5+Id1PAxpUz1ZIekgkeDidOALHhzdJbF+Jwt7wQinRtkAbEd3VAvyj6itZlKTgZ7dQLcgZ/05d1q02uByNmDx06+a+4uzR/CPXsENu6/85ioFO7hRVzmlMrmPDfDkiLO4m4laug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6CTnpQSp1wplXGnglhNQpxSpwnXmSn+VgzCt05rRGs=;
 b=DwGlbM11FF/lvUz2BAwUgGgY+LIvM/v+aE5iPhQrGQBbTS9WkFYxf3e/aTkfWrXKgnB2lqp4IM3nP6UvV28K8gDUVSrGAi/8Arb8ZWXSr//XRP02B5oQ3LEzQ3zT5dYuLgtSgCpkvji3bg04eVYqYius6UkrUY3j7tQjUez92Eo=
Date: Mon, 11 Apr 2022 12:29:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alexandru Isaila <aisaila@bitdefender.com>
Subject: Re: [PATCH v4] IOMMU/x86: disallow device assignment to PoD guests
Message-ID: <YlQDHONozx9KYnFo@Air-de-Roger>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
 <db695753-718d-7bc9-3b1a-efd75b0166f9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db695753-718d-7bc9-3b1a-efd75b0166f9@suse.com>
X-ClientProxiedBy: LO4P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b92a0a9-8dd1-48be-c7f6-08da1ba63723
X-MS-TrafficTypeDiagnostic: BN6PR03MB2722:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB272213B380307CCD9766DF0E8FEA9@BN6PR03MB2722.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LnEOPkksXU1hZj0PiIfuQwE66n/KOiZmKzOUOlr0QnHCXChMFwuWey92U1htgKonPuAhrMB7/DEiALT1ZdcJeFH6S0+Nq44RyuIOmigGRlfDo9r6owKUHMdbOvMc9AakoUhOSZvzjokWOwFQMDsJWKDrxJLw9jOqyo/aWZsL5RzD/Rsr2ndp7Z8q6VnxiCv9dNTx4nxfpRdmpc1mDA6EaugOH4pPKXddku65507XnEnf72Waja3XFLhavuwk4NU8vk22elmuSa2iHA6y5QWpKib9ghITpi6OjcLTbL8S1BKgGpzKBR8c9JjJYYMtQ03Ha6ZBHbZV+VmGu5a4V4LF3FXMwfN8NCo7ZKnnxChd6WV5X9UnfkiPovwFkgbvSNpvES6nT9hTC2j8zoGEX+KdgtxmKDr7mmewCeYH8wk/mJXKvahwNwiUOjD5sW0XhukmBIwc/1ZlHyEqLSEKbuETHC3E8turCM08cPRRFKE+I0H0UaPCTYd/wOow6MlWC+u2IBgAcbDAcrbQRVgO3u5o0iXdbAgfTjqiUPffvbMCRKVXuWho+mp0khRyk78IGCiO2qgbkpUTwDM+SCqZso/a76jm+3ZowJCWamGfBO8KEvaQ4sZwiYU67a06epJWB0971t+wXPzVsn88BQaWUk7RSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6916009)(6666004)(9686003)(6506007)(6512007)(86362001)(33716001)(54906003)(6486002)(316002)(508600001)(38100700002)(186003)(26005)(82960400001)(83380400001)(66556008)(66946007)(66476007)(5660300002)(8676002)(4326008)(8936002)(85182001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGxjcjVrUVVLNWI1SlNSSWx4TUNDYnArMWduNHlqWDRFRmFweCtoNzArNkUx?=
 =?utf-8?B?NXRiZ3VScUJ5ZHVoMEFVRmFOcXA4MmVxWFVkMDcxRnp5SE9BNVBGRHE5L24w?=
 =?utf-8?B?SDlFaVV2R3hhcVJwTUNIV016OU9MMlR4R0YyMnh0YkZINjVHYzluNUJqWFd1?=
 =?utf-8?B?KzNYK1JmbHNiS3N3MVdHLzMrc282S2QxRXowcXNMMEdTbXI3aXZsZWtEUnNC?=
 =?utf-8?B?TElCeGRpWkpML0hQeW1UM0hzaWZEN09FK2hvNmhLdlBQVVJ6dkZMdHc0bmR5?=
 =?utf-8?B?L3lCU2ltSW8wT1VhTlhxZno1YkR0ZWhaL0dpYWl1L0VIdGcyYzAxUTZFcU5q?=
 =?utf-8?B?bFhFblFyWEk5MjZQQUpPQzFYODZiaVJyelcrcnpOa0NhK0tqelMyQTloU2pR?=
 =?utf-8?B?cGxIYXdRVDk4anQ0QzhqTmpLd2RaWXZrSnQzZE9iYW13TmhXRHhWdHZ4S3ZY?=
 =?utf-8?B?b1lnVExsdTQ0eTlkWUZadkhtZzU2OG8wcDdibFJBYnozd3lLbEJSaGlOZit4?=
 =?utf-8?B?TTlmN2ZEVmpCd1g2Q1NWSDdSMXE4S3ExN0FBV0x0cWhQL24yYk5NN25wZVls?=
 =?utf-8?B?cCt6NVdZd1NJT3FKWEhCU1NET2djVWZkbXZJd2RNNmdTREN0RVlzdTR5TUI3?=
 =?utf-8?B?aEdRRlNTQktUNjdXa1I4N2xWSlRVZFlBM20wRGw4aW9oNHhDUEtmVWQxUWEw?=
 =?utf-8?B?Wlh2SU9oazM4S3JtaU44eWMxWVJVZnA4NDNQN2JKZks3SnUxVWFvaUpGVFU1?=
 =?utf-8?B?VmFiZkdyajROY0lUU1o3VFUyRk5yanBlRTBrcXdPTGlUQTlScXJsVjdEeWQ4?=
 =?utf-8?B?Uy9lTlJwSGsyTGNVaGpraFJDeHBFWlhkcm9Ob05LeHNVNHg2WXFlTkV1TU00?=
 =?utf-8?B?UndoVGRvZm9iTDBqbkxodHFBNXpuVUx2VjBzNnE4Q3RGWnQwZmhXK1ZvKzM2?=
 =?utf-8?B?MzdrSzkwS2tKUkNFV0pYSmYzdGt3dng0Zmtvd1AzZGllbmRkNVZkNGVMajc4?=
 =?utf-8?B?aTVmc3RaajM3aTFyeVdVV1I5MUs1S0VLQUkvZkt1VWd0OHFmcHZFaVFnWmI1?=
 =?utf-8?B?TlRHaUpjNEtnY0pkcUluZGdYN2JiaStYRmNYanFDYy9lSGt2NTdUV2VXdk1S?=
 =?utf-8?B?eHBwZlR5bGt1dXNRZW9rTzR0VWxWODl1TnM1aEJZc0FWcDlNYVlKTThpeS9H?=
 =?utf-8?B?TElnbUZXbDc2RGNHSk5YWHhEM3FHanZ5Slo2N1JvK2pKdFJWOUNxMlBKVk5G?=
 =?utf-8?B?a3pYSEV4NWk2QlJyZ0dlb2o3bFNUdERBSzFheGZYcmN3VVp6REE3T1lDL080?=
 =?utf-8?B?VGpkMzhmaUtqTXNHODFKcGxvMk9GZFROelJEdTQzNmx1NjcxdFEzc3VxTHdm?=
 =?utf-8?B?WGRJRC9IVnB1a0YyMXp6cmhYbFRkbnBzekhmY1YzK2tzbmdvMFZUbnYzM1dK?=
 =?utf-8?B?VnM3Y0xESjBBN2ZBQ0ZybjZHTnRaUHhmRDZJY200bXpFLzBkb0JTbjlxOFVu?=
 =?utf-8?B?bmluQy9Ta0VwaS9UVGErT0JFMlI5dEd0b2dKSnRCZ1pFUDcrMThxejYzSDFl?=
 =?utf-8?B?R0dOcUJqWHNJN0l3eklGZ3pGTWpaYmpha3FudzFFQ1g1Q01VQWJwcUdFLzl6?=
 =?utf-8?B?MUJWYkhJdGh3dy9lSE1kVXJPNUhYQ01kQk5CblpRTTdzV09UK2M3MXFoQ2J0?=
 =?utf-8?B?UExwVnc5U0RYR0RvSnJLVDlGZFZveXNTZ2FOZ1VmYzI4S3dxYjlodFQ0RUNk?=
 =?utf-8?B?WVZvd2ZQQnorcnI0OXdFZUpGYmV1RlJNS09YUTljM1J0YVNIc1l4Q3RTWHpG?=
 =?utf-8?B?T2x2dTdPSzBTalFMMDhkKzVrSVNDdU8rU0diQWI0bzFSVmkyMVRTM2ZGMDRw?=
 =?utf-8?B?UVlHUzBqN0NXV25ldHpHV0o3RCtXcTJMb0ZhRmw5YkxZWHZjL29RRHVuejdQ?=
 =?utf-8?B?VmQ2S0E1NWpQMGNrd3BMT3cvRlhnbmJrV0ZPNjR1MHBNNWI5S1FlWDRXelZ0?=
 =?utf-8?B?S2N0NnB5L2F5cEoxMEZzZTFZWXNvWXN6dnNwVWp3T05yK2JTelJQUGM1RGZ6?=
 =?utf-8?B?NTlLdFAvQXZHOW5nTHVpN0xRMUNONVVvd1lYQm01Y2pTeDZtZWNZQXpuRytp?=
 =?utf-8?B?bjB5Q3MvZklCNklZMFA4Uy83OW52WXcwaGVsQXlKQWFPYjJPRUFKT2hxYkRz?=
 =?utf-8?B?RmU3MlBQSmlCN1cramFmVjV3L3dENjFiVTI3ZTRQeEFNTGk3MjZXS2w0eHY0?=
 =?utf-8?B?NG9oQzNUanNHMkpsZE5YdDdCb3NtL2UvbDVobnBaWHFmd3liYzBlYUJzaWRx?=
 =?utf-8?B?UFJHcmw2R1VPL3d1dm1vQ2svTkNoK1ZyUHprUmdsdWlkUis0dndUVDNFa1Nu?=
 =?utf-8?Q?QcPSNzCOtmIJlXEM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b92a0a9-8dd1-48be-c7f6-08da1ba63723
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 10:29:53.2783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EjTDS9m5wwsdSVFlCj822rwWMyftQJbP3JYSi6vUN1p41mqhoxrGIiFpH2XGUdudzOrS8QM/4GeTcwOskQ1j9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2722
X-OriginatorOrg: citrix.com

On Mon, Apr 11, 2022 at 11:47:46AM +0200, Jan Beulich wrote:
> While it is okay for IOMMU page tables to be set up for guests starting
> in PoD mode, actual device assignment may only occur once all PoD
> entries have been removed from the P2M. So far this was enforced only
> for boot-time assignment, and only in the tool stack.
> 
> Also use the new function to replace p2m_pod_entry_count(): Its unlocked
> access to p2m->pod.entry_count wasn't really okay (irrespective of the
> result being stale by the time the caller gets to see it). Nor was the
> use of that function in line with the immediately preceding comment: A
> PoD guest isn't just one with a non-zero entry count, but also one with
> a non-empty cache (e.g. prior to actually launching the guest).
> 
> To allow the tool stack to see a consistent snapshot of PoD state, move
> the tail of XENMEM_{get,set}_pod_target handling into a function, adding
> proper locking there.
> 
> In libxl take the liberty to use the new local variable r also for a
> pre-existing call into libxc.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Just one comment below.

> ---
> If p2m->pod.entry_count == p2m->pod.count it is in principle possible to
> permit device assignment by actively resolving all remaining PoD entries.
> 
> Initially I thought this was introduced by f89f555827a6 ("remove late
> (on-demand) construction of IOMMU page tables"), but without
> arch_iommu_use_permitted() checking for PoD I think the issue has been
> there before that.
> ---
> v4: Drop tool stack side change (superseded by 07449ecfa425). Extend VM
>     event related paragraph of description.
> v3: In p2m_pod_set_mem_target() move check down.
> v2: New.
> 
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -20,6 +20,7 @@
>   */
>  
>  #include <xen/event.h>
> +#include <xen/iocap.h>
>  #include <xen/ioreq.h>
>  #include <xen/mm.h>
>  #include <xen/sched.h>
> @@ -360,7 +361,10 @@ p2m_pod_set_mem_target(struct domain *d,
>  
>      ASSERT( pod_target >= p2m->pod.count );
>  
> -    ret = p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptible*/);
> +    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
> +        ret = -ENOTEMPTY;

ENOTEMPTY seems weird here.  I think the reasoning is that the set of
passthrough devices is not empty? IMO it's confusing as the function
itself is related to buffer management, so returning ENOTEMPTY could
be confused with some other condition.

Might be less ambiguous to use EXDEV.

Thanks, Roger.

