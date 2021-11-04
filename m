Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986234451E5
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 12:00:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221435.383141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miaTe-000386-1q; Thu, 04 Nov 2021 11:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221435.383141; Thu, 04 Nov 2021 11:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miaTd-000358-UQ; Thu, 04 Nov 2021 11:00:13 +0000
Received: by outflank-mailman (input) for mailman id 221435;
 Thu, 04 Nov 2021 11:00:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDfK=PX=citrix.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1miaTb-00034j-DS
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 11:00:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f6a09b7-3d5e-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 12:00:09 +0100 (CET)
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
X-Inumbo-ID: 5f6a09b7-3d5e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636023609;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=KthbVi3WH/DgRzFkRx9xFpp1B13xzcx04bcqM/SQSwk=;
  b=GJOry1W/VnFc9bAJu+vKWQcgAPYvA5cW8OjJj8xzoat0GG56AJwfwrtm
   TrxGft3K6dDRQfTS4iRG4HzDHjjLLwQcitF7yeXlE/Fs2a1wvwfm5FsX6
   QtLSWI87LBSGCKsLM9AuV+liqjHqxDOzQCoYQavUwPBDH+ToCcXm7UJRQ
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VDdXn8stlkBYSLPNvyrQceDJ2tIIWEw5afYGtH7ZpI8eNaQMQzLxY3G9sIF5cE+lL5qMDI+GJd
 UFbXOXbbD5X8CETKYmvFmrOgYfzwyHbx8ihy4HZfZQq1TnlBu3gdn4Gl1ksALq8gDxtyJyMdct
 zo7Efcb4zelxP/akt9KQKE6VUBOt5Xe+L9JHtqGfdwUZZqZ+svDmJ6DHlbDBLK1kPgN8CV0uXh
 4C/f3T6CjP0juohLhZYjbdS8PGZVr5orgjKAm56OcVuEftDyQr3oj1CvNp03Ow2H7A59cJaJoN
 3jBaSEM/qrUTBzKM9bXl52OF
X-SBRS: 5.1
X-MesageID: 57031824
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lZorHaxDn7D6CH4l3jp6t+duwCrEfRIJ4+MujC+fZmUNrF6WrkUPm
 DAbXD/XbPvbNmLwfIxyPou3/RwG6p6GnN41SFZrqyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrZl2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/JIk
 sxGjYSScF5zY5Xxp/wXeURDSggraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors8jNsjwIIIWvDdkzDfVDPkOSpHfWaTao9Rf2V/cg+gTQq6FP
 ppDNVKDajzjbkd0EXUqUqgxs+mLlFz9YidxqFia8P9fD2/7k1UqjemF3MDuUtCDW8h9hEuTo
 WPCuWPjDXkyNtOFziGe2mmxneKJliT+MKoTC7+Q5vNsmEeUxGEYFFsRT1TTice+jkmyStdOM
 Xs+8yAlrbUx3EGzR9y7VBq9yFafpQIVUddUF+w86SmOx7DS7gLfAXILJhZebPQ2uclwQiYlv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRty9v+pIA+iDrfQ9AlF7S65vX3Ezztx
 zGBrAAlmq4ey8UM0s2GEUvv2mz24MKTF0hsu1uRDjnNAh5FiJCNRbXy8FPj9dR5ddzEdmS+p
 HIuxtPHxbVbZX2SrxClTOIIFbCvwv+KNjzAnFJid6UcGySRF22LJt4JvmwnTKt9GoNdIGKyP
 heP0e9EzMYLZCPCUENhX26m5y3GJ4DEHM+taP3bZ8EmjnNZJF7ep3EGiaJ9MgnQfKkQfUMXZ
 cjznSWEVy9y5UFbINyeHbd1PVgDnHFW+I8rbcqnpylLKJLHDJJvdZ8LMUGVcscy576erQPe/
 r53bpXRlkQBDbWnMnOPoOb/yGzmy1BhVfgaTOQNJ4a+zvdOQjl9W5c9P5t4I+SJYJi5Zs+Xp
 yrgCye0OXL0hGHdKBXiV5yQQOiHYHqLllpiZXZEFQ/xgxALON/zhI9CJ8pfVeR2r4RLkK8rJ
 8Tpju3dW5yjvBycoG9DBXQ8xaQ/HCmWafWmZXX5MGZkIsc/GmQkOLbMJ2PSycXHNQLu3eMWq
 Ly8zALLB50FQgVpFsHNb/yziVi2uBAgdChaBSMk+/FfJxfh9pZEMSv0gqNlKs0AM0yblDCby
 xyXEVETouyU+90599zAhKalqYa1ErQhQhoGTjeDtbvmZzPH+meDwJNbVLradz7qS26pqr6pY
 v9Yzq+gPaRfzkpKqYd1D51i0bk6u4n0v7Zfwwk9RCfLYl2nB6lOOH6D2cUT5KRByqUA4Vm9W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33vXYl8qCGXENeOwi3pBZcdLYlYpk4x
 eoBudIN71DtgBQdLdvb3Dtf8H6BLyJcXvx/5I0aGoLiliEi1kpGPc7HEibz7ZyCN4dMP00tL
 mPGjabOne0BlE/Lcn51HnnRx+tNw58JvUkSnlMFIl2InPvDh+M2g0INoWhmEFwNw0UVyf93N
 0hqK1ZxdPeH8DpfjcReW3yhRlNaDxqD902tk1YEmQU1laVzurAh+IHlBduwwQ==
IronPort-HdrOrdr: A9a23:HISeAquh2+F323Wz4p5g8goZ7skCwYMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H8BEGBKUmskKKdkrNhQYtKPTOW91dASbsN0WKM+UyYJ8STzJ8/6U
 4kSdkFNDSSNyk1sS+Z2njBLz9I+rDum8rI5ds2jU0dNj2CA5sQtzuRYTzrdnGeMTM2Y6bRY6
 DsgfavyQDQG0g/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZebxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESttu/oXvUjZ1SxhkFxnAid0idvrD
 AKmWZmAy1H0QKSQohym2qq5+Cv6kd215ao8y7mvZKqm72GeNt9MbsbuWsRSGqo12Mw+N57y6
 5FxGSfqt5eCg7Bhj3045zSWwhtjVfcmwtprQaC50YvILf2RYUh5bD3xnklW6vo3RiKnLwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23wO9UoJg3cw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAijGQA7KMmiVPVP7fZt3dk7lutry+vE49euqcJsHwN87n4
 nASkpRsSood0fnGaS1rdR2G9D2MROAtBjWu7NjDqlCy8rBreDQQF6+oXgV4r6dn8k=
X-IronPort-AV: E=Sophos;i="5.87,208,1631592000"; 
   d="scan'208,217";a="57031824"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHNd7upw2fz090eS0F4gX9+qu38dRiapZINigYvgc1Dmggh3qWM2bfRqa6Nko0zijZYGhskoYagOCSiqf/iGlKwX3DvOc3KlsiLiSsT9mx0NFr/vLMQfakBdlt4tveTs4k7RUGPQFAvd0B7I9neKzOGUsXmdUbRWMjOGfNrYr7clO0aih4jDbrt5Qw3a8IjOMVr6y1FiovyMMy8wORQ7hkZhT3Cf1Exk5ixdNsoaZ2VoLqnzPhO//Yb8LoVLEtEiebf7Wz9JbyNnQqc3//kCzY0iJZ9CUk/6erhhIPpTxbvCgf/zGw9WA6mqOgr7TziHyxFzaIphoS5IuLNb/gmDTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KthbVi3WH/DgRzFkRx9xFpp1B13xzcx04bcqM/SQSwk=;
 b=cFErQA5wurGidz8yY76xcL+UlvK72gTwt3NZr0BQdVIqfAvqGeXmConEYD1onbvy5OR84P7H9WUxMR+YR57GGcZ6P7axUuxRd9b/ogVNV3jRhFXvxts7TaOzlKUM5+j3DKXN9oEznBNxtpDWoK4wDNXsNYxD73lsxkIvo7Ujtmc/2tzS+Gr3O+fqFdTxHMuBTEWk8F0cyI9SSmZ50lesvI+prRX4Rhp5yfgBicuwaBKEHBqeFD/kn0ImbLYNChALcNFOiijJ1Gh/3/NJKM2iAdypAY3MthBWVuKa4oJQqhg7/L/a+6zuuzAdZ3L00cozlWtMUb76vt3D4Vd0BVovjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KthbVi3WH/DgRzFkRx9xFpp1B13xzcx04bcqM/SQSwk=;
 b=gzJd9g7E1DcZ80+MHygZjiOcFM4HyerE6nNtiMxkJbzpmc5uw+St4VBqZxyHWHjdl2mesifgn5MG6OuR2aGKWfMqDcHMW2DTqH7aAAOeVqPATDE2TSoSD8dxs2zn6SOrAYn+C8F7C+A/pw1ghRHh+ge5kIr0Uvb4weh2f0pNML0=
From: Christian Lindig <christian.lindig@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, Anthony
 Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, David
 Scott <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Ian
 Jackson" <iwj@xenproject.org>
Subject: Re: [PATCH for-4.16 v6] gnttab: allow setting max version per-domain
Thread-Topic: [PATCH for-4.16 v6] gnttab: allow setting max version per-domain
Thread-Index: AQHX0WmL9nixhMEvEEqGVp3NZX0Jw6vzM2UA
Date: Thu, 4 Nov 2021 11:00:01 +0000
Message-ID: <40742A94-35DF-4561-B68A-500FF0A861F5@citrix.com>
References: <20211104104834.10977-1-roger.pau@citrix.com>
In-Reply-To: <20211104104834.10977-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12361bc3-7994-45b3-530e-08d99f823fc3
x-ms-traffictypediagnostic: MWHPR03MB2717:
x-microsoft-antispam-prvs: <MWHPR03MB27177B1E2CBCE9070F3BAB6BF68D9@MWHPR03MB2717.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eeXf3y3WtbmEBjsXn7wxS2FALfX2w6RpTFHo0DvJC+E0v1s4Yd8L8d26ArpZi1QuDtqreZZ6sdCXbW0v3goFjCcQvSMPKHIFCgRVbpx2hR3famcaIqvXtfCQEWKCMQPoXYPAquwgPz7hPK3MZrZitWaTkcnY+S0DdY5uqS4SZJMXgDRthjTm2ErQfvSON0FujC5Ho4/g9asNd1zfrXFq/Y91IZKNRAaxoTGsNXwnTtiFuGRi9jsRH7wfwivcYerpuHlkqtaFlFcXbgUJKLd/vQ7icdY9EK/XByQX0ZdCNXSEl9NKcRA+nwiJ0oA4cY9hnOQZRaWkDrW5Ckjigf9IndtE3bacJQkwcuqSBe58Wofw12UQQciFsUo2JZFXDLhbdTJOjn36jBEzPaY6XpjMo1dFfglQuTtxBRvf9teu4YtsSa8pUcRB245DLdH7DcwBGmPWr9dFzcuylnXH17+wMvmz867V7tKC0jOcfcp9VOXAvUQ+rkHZzaIWufx+u0HI7a2IP1bDGCi3q7NAQQs/EUNe8V9B6XWqZH5VOvojiWgxDGL/9COWiDEYVRCwCRaYqi8kp0jNy1OO9Vnbo0T9O/m4EhDbqzMmPjqkt6TiVv17yIHYTyv5EjYPKIYynANovFt87PlKg2Shqc8vQ1mG/fJbCUZlCMoevTU/ZF7bDtGi3o3hpr2Yq3CwrKEqv5/nnnL0YyUe/6Twp0ea31k84C0tYTITxElYLnQrLMCqYIgmUjZMtoDPmkKqYIHCcOWl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6380.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(4326008)(6636002)(5660300002)(66556008)(6862004)(82960400001)(38070700005)(37006003)(26005)(44832011)(2616005)(508600001)(122000001)(66946007)(66476007)(91956017)(38100700002)(71200400001)(186003)(6506007)(36756003)(4744005)(2906002)(53546011)(86362001)(8676002)(6486002)(76116006)(316002)(66446008)(33656002)(8936002)(6512007)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6qwcYPAOws11IbA7uw94ivnOn+y3ihQsIJPC03Qc11ETuwSrYMyIHRPUbLQA?=
 =?us-ascii?Q?hHDVQMYVRtd9xqFGbQlV+C0qF63SUQ8El4E21pbmWmOrD0I+/0sETCkFmSZc?=
 =?us-ascii?Q?gSZTeFWJluV/MK6FunmMHiAxrnmTcFCjkoUKup/hBNznzMMKie9ATgplSwe6?=
 =?us-ascii?Q?fdnU0fw83hGuAnsakrpwjtpanbNT7Kzprh7+hdG1X7Ejboo8VqaXye4CFH6Y?=
 =?us-ascii?Q?20J/avpyrVh2pAb4pUSliyyQ+2PwLs07+XUB7NYlFaGOIQADIVLjP1tkfxD0?=
 =?us-ascii?Q?HnVH+KgsNiQg5WeIVtgTFwBeU5RH0QBUlXja+e6G3jF5zrsjJdHOWvSmtvgu?=
 =?us-ascii?Q?9vtFeeqLMRHObe6bdgDacQ8hfPywuHBOgsJDcn32WOWwqb3HmLoshlFvj+LW?=
 =?us-ascii?Q?/bnmuwDHj3bKK80dhjihNSLfnBF2HQoQ2qriVNCld3YPl0QVsn+1BPaauCJ2?=
 =?us-ascii?Q?pbGNwBa36R87jdc+kwo62oa1bYZmiSIAVloYNj3X9ofoQcL7RRP9pagXEIsZ?=
 =?us-ascii?Q?CTh4pqzFdoYscx3zkB/n3JgBl334mhCY9z9WBUHWJiTv4ihT+9/UAKuV8qHJ?=
 =?us-ascii?Q?D5uEpsWK9dnAw+fwhGWiGUi9sUFMLCnUYIlvT3j4GCtXgzhU0xbRVMoy4naF?=
 =?us-ascii?Q?K0GARR51BEMWWNh+CyKqwXFneina9B4mBELWz22jB/+VlZa4zH67m1Yi1hAq?=
 =?us-ascii?Q?1YqaHcEECbNYXNfWZ9ocJEHTHU9ZkwSVPKZkeznDiJtue4/+xZK9RZsbj+wh?=
 =?us-ascii?Q?R86hIavrKOZnCRaKQslvZ5EvrvIxdysk1gxx06AeLMZL5/u0aNeJOmes6SZO?=
 =?us-ascii?Q?vHUYqZsas+olGHSy1DJhkTJVwT17yDAqipMh1HwbMd5r7ps0N+f72+BSayvm?=
 =?us-ascii?Q?B3A/Uwl1dioxBUREbOVMBJCRWN5eNYlDbrXkMCeQOKm1dH2hUBXpqxhXTwr5?=
 =?us-ascii?Q?LxmBaojDvLDfBv55/IKdjHL+VmhmOMwe3r4CbmKu66tzj1+HNYjHhqXoO6P9?=
 =?us-ascii?Q?YIAS+1oXKN5/f5pfFkGa9GKakYo90TiYyS/X9TFNchGspgIiVprUxeV8PtMX?=
 =?us-ascii?Q?MIiTst6qcdr+T/KTGSiEIWb3XvRxbWrytTOfGASpShYkQ5cLIjPIMTXXFnOE?=
 =?us-ascii?Q?agyC6J7IjvvSwQWTmLXMiB28raXyQ0Enb9VIfB7Evl1O4deK2NF0aRdvVjy1?=
 =?us-ascii?Q?oSof62FZdmktmzR3J4qNDNVbqIlqiszNtS/9arDjXV83Crd2zEC/89uBczc+?=
 =?us-ascii?Q?HHy6/BMs9svCIHyHp51Wrb/cocdNs26dGdTPg85CjIf6nNnrHgdcIwbTunuK?=
 =?us-ascii?Q?ULANJXOBcpUsaKAg7QtEzmCVUF8jBmABX537bstSMd9rZGZze2tZ84W5QBuz?=
 =?us-ascii?Q?sIIk3i/d5Ym50UkqrI7SzwhHPwLZUWuA8iVynb8G5gifJB8j0cqLnfWVsRgm?=
 =?us-ascii?Q?YW6FDWnbJa/q29slpWrFnyXz9qCyh9bHbm3CzGddaPR8cBZqF/sC2mZF0mGL?=
 =?us-ascii?Q?38q3oXwC9/VANFwH2bH56wg8y8qt7Tb3IzztrN9mOA2xaXlp7CdlTVZmSZkE?=
 =?us-ascii?Q?UINuyeyue2ufunhLrQRM2R3Lb6UsJacZjAaD5KP2IikrsZJ/Rg1MXKriDM7y?=
 =?us-ascii?Q?w0hT3JxwU+Qk21/fKgP08W6BirptC74dheRnmzxvrLki8BypuUgiZnuR0e+N?=
 =?us-ascii?Q?w/Bw4iVSx/xn0Htlfe3n09ju+OA=3D?=
Content-Type: multipart/alternative;
	boundary="_000_40742A9435DF4561B68A500FF0A861F5citrixcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6380.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12361bc3-7994-45b3-530e-08d99f823fc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2021 11:00:01.1178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mMUPdzudJLZ27/oe1ZNnNh1/mbYnxKoQXRDXvB1caN5HB1ilAKcVKVr+/CJsBFLMQJ27hhyw+ZryfwhiASZCdypP3SfgBLsTSjRruQCqiKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2717
X-OriginatorOrg: citrix.com

--_000_40742A9435DF4561B68A500FF0A861F5citrixcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 4 Nov 2021, at 10:48, Roger Pau Monne <roger.pau@citrix.com<mailto:roger=
.pau@citrix.com>> wrote:

Introduce a new domain create field so that toolstack can specify the
maximum grant table version usable by the domain. This is plumbed into
xl and settable by the user as max_grant_version.

Acked-by: Christian Lindig <christian.lindig@citrix.com<mailto:christian.li=
ndig@citrix.com>>

--_000_40742A9435DF4561B68A500FF0A861F5citrixcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <CA4087CF6D77B441AA5BDFF13159FDC1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On 4 Nov 2021, at 10:48, Roger Pau Monne &lt;<a href=3D"mai=
lto:roger.pau@citrix.com" class=3D"">roger.pau@citrix.com</a>&gt; wrote:</d=
iv>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none; float: none; display: inline !=
important;" class=3D"">Introduce
 a new domain create field so that toolstack can specify the</span><br styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">maximum
 grant table version usable by the domain. This is plumbed into</span><br s=
tyle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: normal; letter=
-spacing: normal; text-align: start; text-indent: 0px; text-transform: none=
; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; t=
ext-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">xl
 and settable by the user as max_grant_version.</span><br style=3D"caret-co=
lor: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: nor=
mal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal=
; text-align: start; text-indent: 0px; text-transform: none; white-space: n=
ormal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D"">
</div>
</blockquote>
</div>
<br class=3D"">
<div class=3D"">Acked-by: Christian Lindig &lt;<a href=3D"mailto:christian.=
lindig@citrix.com" class=3D"">christian.lindig@citrix.com</a>&gt;<br class=
=3D"">
</div>
</body>
</html>

--_000_40742A9435DF4561B68A500FF0A861F5citrixcom_--

