Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C55F490C16C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 03:40:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742657.1149510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJNpP-0001SS-Tn; Tue, 18 Jun 2024 01:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742657.1149510; Tue, 18 Jun 2024 01:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJNpP-0001Pl-QV; Tue, 18 Jun 2024 01:40:07 +0000
Received: by outflank-mailman (input) for mailman id 742657;
 Tue, 18 Jun 2024 01:40:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2iLq=NU=nvidia.com=chaitanyak@srs-se1.protection.inumbo.net>)
 id 1sJNpN-0008Qz-NA
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 01:40:05 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2418::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aeff0e65-2d13-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 03:40:05 +0200 (CEST)
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by SJ2PR12MB8884.namprd12.prod.outlook.com (2603:10b6:a03:547::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 01:40:00 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 01:39:59 +0000
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
X-Inumbo-ID: aeff0e65-2d13-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6czwxac9jwpJGKgdP+YxOzIuz4+JPrKKK862AQvbe7SyUyAAurMVus7acSzZkbb+97s4PaFzrtDZKX++k8XQXkhTvDrivCrsRE+1MhujtE16a09WPgUqeCvqvL83xY3akDsRQR1ge6WlNwMUmujbZsNkxeMA9qVDuO6c+9S2GUYlNDWMHcQ3ENUI9FazJf2rFsJ9yUJqZDu5yJhknLsW4nkP7jHWHihzFW84Z954cbgWo4IZvefV78ETNq9qwlbSQ5LkA9tqNbeXDG+wUeT6WkC9dLZuKQIA6B3uAjVUMUiHFJkFqc0MIA/kf8a62PZCzuReK+j9V0RdujAe/sWZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyWzqgWMr39DzFWVNgHbQzxwZNrFXOBMYbmXYJ7MEe4=;
 b=lbUwRq0nNq1NLdc8KP8SAjETpJpP6KNdH5LsaNTVVJk6dXZaZUdVhkQMJQdYfEXCeVani8QC2IOdX6HN9YzoLeB9kPCxEWl0U5r2Fmrphu7jzmiwmvaMpy/QirrtMespp374hOVa5B4OBVqwJF919Y49rvHYTGYwozjR1DgJwcHL60TPXbGOaWEwnFCXASxKfC/brpPKhfAi3kdB1LtdtGvwnIXfcV+C0GZJntmWPfdqJSgdCvg458kaCMhw25VQwixpluIlG8YcGleCs7XhjF1MWKbCoAPn5bvPCz9AUH2MuoeATSx7QP/JOTnxsthUBac7EszZfvEIpgQNhoO5tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyWzqgWMr39DzFWVNgHbQzxwZNrFXOBMYbmXYJ7MEe4=;
 b=BJxm6AJaUVicEpJOQaXQ3Us/ojmY0iUVqG9MBuKv+vkxwap4R9eOVt05as+HP4BPzzxR1ruSRvbcN59XblUXoU6b0IG+cVPuZXcYatiHkYeE+UZ9IT6UObjxSO0FwWnd3vaDyK1G42ERds8RacUVbvrdlUjAMHeWIDk1Mq1Dmr2XnGKLq2i4J+0gOMNmGQTdn/gp43TC1Wp/xGxiSTX3apIRu8xT6Fpc7ugEFdoszuRyaZfcsjhjrhONt/qrrhd9omg8fguAQskQwXAMqP1MPwiib5KEW6ZHNQPmXmrSib8rKuqmLmrLkqwdfM5ubJqygXQRRPJIaMpfrb4Fhmvzxg==
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, Richard Weinberger
	<richard@nod.at>, Philipp Reisner <philipp.reisner@linbit.com>, Lars
 Ellenberg <lars.ellenberg@linbit.com>,
	=?utf-8?B?Q2hyaXN0b3BoIELDtmhtd2FsZGVy?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Alasdair Kergon
	<agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka
	<mpatocka@redhat.com>, Song Liu <song@kernel.org>, Yu Kuai
	<yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, "linux-m68k@lists.linux-m68k.org"
	<linux-m68k@lists.linux-m68k.org>, "linux-um@lists.infradead.org"
	<linux-um@lists.infradead.org>, "drbd-dev@lists.linbit.com"
	<drbd-dev@lists.linbit.com>, "nbd@other.debian.org" <nbd@other.debian.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
	"dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, Bart Van Assche
	<bvanassche@acm.org>, Stefan Hajnoczi <stefanha@redhat.com>, Damien Le Moal
	<dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>, Johannes Thumshirn
	<johannes.thumshirn@wdc.com>
Subject: Re: [PATCH 09/26] virtio_blk: remove virtblk_update_cache_mode
Thread-Topic: [PATCH 09/26] virtio_blk: remove virtblk_update_cache_mode
Thread-Index: AQHawHzWgIhsYEQ2yk+R6EXm0n/PkrHMv+EA
Date: Tue, 18 Jun 2024 01:39:59 +0000
Message-ID: <9485740f-56a2-45ae-9dea-4ee89ba9d937@nvidia.com>
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-10-hch@lst.de>
In-Reply-To: <20240617060532.127975-10-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|SJ2PR12MB8884:EE_
x-ms-office365-filtering-correlation-id: 1959c64a-710d-4577-02b2-08dc8f3790ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|7416011|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?V1JYZlpwOWhDY1dnU0ptcndEYlRZQ1llUUl6d2dwU2FBNWFBMURPdVZNUTlh?=
 =?utf-8?B?bFBiNHZaaXZwOXNxQTlCT1B5Z1hkUm5HcHpwemQ0RjlEV01sR0ZSSHNQbWJG?=
 =?utf-8?B?SjUwRFpzQnJxb1A3N09WS3hJeEE4NFJYVDR3UWtHdnJFU2pIMEtZR3puUjhp?=
 =?utf-8?B?dUJYQTB2RzNvbzZkTVhYSzNEYUxqWThJajFyakhDRE9mdm5ybis2cmg5TXNs?=
 =?utf-8?B?cFYrVXoyUThMVVNWc2VJcHRYKytLOEpuL0svQUZISkpRNzVIQkJYNEh6RGlC?=
 =?utf-8?B?cytLenJZRjZpdm9ZS2E4ZCswNmM1MVFPMkJVcXlxNmQ5eVN5SHJiOG53N1ll?=
 =?utf-8?B?bW51L3ZLbjl3VTRsUjVSRElGbndwOWhOczNtcTVTd004T3Zkc2tSOVJOSVd0?=
 =?utf-8?B?czBmUlVFejhDU1h5a3FPVHVRQjYvOXZhWUxqZ1hGVk94SGViVmxMWDlHNWRP?=
 =?utf-8?B?T0c4cnBsRjR2NWgwekFVd0hNaHRkUURQdlVnbUhITTM2MDk5WStxR0FDY3hv?=
 =?utf-8?B?OG5mMkw2MDFFSXZiNWZLdXJCZ0ZPZVNNS09PaStMN1pCTmZoMnZWc1Nva0hi?=
 =?utf-8?B?M1FINXBISDlNYUd6NUNrS1ZCemlFRGQzOWoyYVIyOGduREI2ZzBZcTBUTEg3?=
 =?utf-8?B?WTVxREY3ZFpTMGNNaGkyaHVWTjdGd25KZ3hKQTZPd3p6bk5rSVdPMlpRVllG?=
 =?utf-8?B?SHdUTlZESk1YVGVtR1B0ZW5JckwzdkdMUEd2UlV6Zy83a2xXVzdyalBCSEQz?=
 =?utf-8?B?Mkp4NWh4dWRkU2lzcFcyOEIvbS8wazJhZG10MWdsN2V2aUFZazliSUdLZ2ZW?=
 =?utf-8?B?cytJaTM0MldISUQvZkM0YytzWU5EbDZOWlNOWlRtREc3TUdZTFU1U1BSRXYy?=
 =?utf-8?B?MVZscWRoZHdBcEhSNFhBMXBaQTZOeUpLVHEwZWtlaHkrNTEyUFc5VXRCTXBQ?=
 =?utf-8?B?OFFKaTdvaWxZM2VEYjFyWitMbWlXWDBZdTZObThPb1RSNlV5OWt5NEYyQmsz?=
 =?utf-8?B?bkxDQnArUy9VYXNjWnNRRWdzVnAxVUM3MTRVY0RDZWhRVzhnWklscUx3UDQy?=
 =?utf-8?B?K01PUXdFZGdKT0JrL2VYYTdPN3pJZEdRSlN6RkM0WGJrNURDV0FNTlh5dHp3?=
 =?utf-8?B?UmUra0htTWZqZXI2QVlYbzBqY3dnWTF4UXJZelZUUldKbEV3RWFxa3B0c1lM?=
 =?utf-8?B?bVFOc0xGREJvUW1waW9EWWVwUjc2Y01BMHZlS0E3d2xxUG53NG1HQUlwTDFu?=
 =?utf-8?B?dmFyZWhQci9BQWQycG1MMDJ5YlRuby9qMW9MdWlJRUdyZ0tmckVSTDI4bnha?=
 =?utf-8?B?aDRoM0R4cVc4S2VlakZJSXhLQW0rek93M3ZRQkU4VjI0amh4UzhTeWdvN0J0?=
 =?utf-8?B?WjZxOENPS3k4T3JtSFdIblhpVDFsYXhXS1NtTlM2eTBTVzFOeWcwdm1QREVm?=
 =?utf-8?B?VndCM2lEV3ZYTDdaczZQNUM3ZFdDb2hKSjk2ckk2bGg5dXlHd21oYUduODJs?=
 =?utf-8?B?UTEweExoRGVhelpBNWN3ZE9JKzEyQVgvS1lhOFVGOWZzQi9JOHhEbHM3bHd2?=
 =?utf-8?B?dTdQOWZYY2Ftb3dDdnYwRHRCeWJVRnJrWHBObnR3RUk4Ym1WZ0NWSUptWHlH?=
 =?utf-8?B?R3h6clRYekEwQ28ySHFDcUIzemJxd1BtUmVRSDFPSnp5RE80NkZRVXJpZlZP?=
 =?utf-8?B?T29BdUkxTWRKbzFRQzRSUWxjcDF2d1czaFY4aFlmZU1SM0NSRGl5N3ZoZXZK?=
 =?utf-8?B?TVdpL3NaOVRaTi84U1l6U05JS3g1citxR2kycGF4MWJQS01tM2ZGNmpBbmx2?=
 =?utf-8?Q?ekWoc6MoiwyTCYyhobDlOIplg/9IlAzcu8eec=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9404.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(7416011)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFVLdGFHKzNDSnpJT0lyUXhmL2ZWN2R4cHFLRW9oZlIrSjAwcktTYU1ERTh1?=
 =?utf-8?B?ZlFFOHNEaW95RjZ2dm5DZVU3dVpWSHpNdUxLYkRNMnlZamEvbnNHSEFiazdN?=
 =?utf-8?B?YjNXUUhVSStNWjAwVEJpVjF3L1VLVW9veXp5bFF3dUU5N3hEOWVBdnhTYmk1?=
 =?utf-8?B?bmFsNmxsTDJleEZuUURtc1RQT1FjVlh5elp2d0JFZEY4UURrb214NFNDWlFU?=
 =?utf-8?B?R1BMNGhlZlN5N0dZbHJJVlJqa3hSaWxNTitMTlNUT2dEMmRDd1JDSm9qb1dw?=
 =?utf-8?B?bVVWS29VVnpGOCtVMnNXdXAyaER4ZWpWWGZoV28wdHFEaCtnWUpJMG05MDdE?=
 =?utf-8?B?VVpVZFRZQWtmUTVtV1BWZHJDTGdWTXFjTERXUEpQdjVFUFNVNVJPbExsK0Nl?=
 =?utf-8?B?RG9Cd21qZW5tN25OWW9USXZDR01FUnVabTJ3b0dvaGNhZzNseUJLUCtrVGlZ?=
 =?utf-8?B?ZG5WYVdYZEJiU2REaUZFZXkvQnJPeWc0VlhNc2RBOVpXZkp4U3NvSDdKRU9m?=
 =?utf-8?B?aE80Y0hLZ2hrbUU2ZmtFNGp3TGZhSnhFQW9DdlowbWk4Zll4U3Fra2NncHBh?=
 =?utf-8?B?cUlEMktwN2dYbytuSXZkTkk1aitRUUR5dVd3enZWWDBLWTZ3V3N5RVUrSmZy?=
 =?utf-8?B?Si83aWJCZThOdkVBVzV1TktCdnJrZms0Y2V3QklZOFZtWGZqZk1TcTJwTXJx?=
 =?utf-8?B?cVlVK3pBVE02V2d5UlB1b2xYUFZmUjNjVlArYUNUTmE5N3oyYkJzUnBWVWtK?=
 =?utf-8?B?WjdYZTZTMXJvQmVoalpIVGp2Nm4vaXpDWWJuMzlhdmxvK0ZWNTJiL1JsMFBG?=
 =?utf-8?B?dkg4MVdDeDZzRnJ5SlFIRVVQdzltMjR5d3Y2c0xNQjhuaERWWC9ZbzlhdUZq?=
 =?utf-8?B?UU5JTENSVDE5QWlyZXBkNXNQTk5iUEhraS9xei9NditlOUh4S3lSS1Q0cGhm?=
 =?utf-8?B?eEtsTzJHeU9HcmxPbFBTZXY4dVhFNUMwS3hUVDdXcTg1Z3hyRGR2T0JXeGlV?=
 =?utf-8?B?czltcmNya3ZRTEt1YmdHZFFhU29oVStZd1BpSlc5V29nK2x1QTBVdUZiVXk5?=
 =?utf-8?B?NnE3VURBLyt1UkVUOVN2VnpwcUFqM3lqY3E4TFdldGYwM3RPQVNiUm92TzNj?=
 =?utf-8?B?YUdrTGZ3QjFTcDQ1TXR3UEZPQndUQk1IeklWQkFQU0NJRkEyWXdQWXAxOFlK?=
 =?utf-8?B?UDhtY1d1Q1NZTnlCcXJYd0pIeFFWVDlLTVdZYUFtdkhPM1Nkblg0L3c4Wjc5?=
 =?utf-8?B?eU9OS2c0RHdteHRBSktvNW1SN2FjVWloUVE1ckU5eDNXUlVPVmRXODNpaFlK?=
 =?utf-8?B?eExHajQ3dWtORFVaRGRpeDRFdEpnODVqREovTVRFU1p6Y0V0NUMxaGQ5QVFH?=
 =?utf-8?B?TFF1Q203KzU5aGNUazhyU0dRSFRYaG5odG5rTUVTT29pQlBnRUVIUUpHVlVz?=
 =?utf-8?B?eTkzank0L0E4MUJ6RTFlT0wvU2Y3a1V3MUZmTWhNbVE2MDJsZHVFQUp1WE5z?=
 =?utf-8?B?QWJaNnZkSHpJbk15MkIwaGt2aGRsT0I2RUkyblpCcG5TSUw4eUp5M1JMWjE0?=
 =?utf-8?B?YWd1MFpMdDZSczlqUDZjbEluUlhUdGVKM3BPM0tyTEU4MTVLeHJJNld2NDBy?=
 =?utf-8?B?OXV0dksyL1o1T2ZLU202TGtvZXpXekNWSDdZUUt2bnFjSHNkZGVteFVYaHIz?=
 =?utf-8?B?RHlUOWZpR1plcDJ0V3VLZ1c1RW9Eejg0NitjTmNYeXY3eVpHVlFnZnhwbURF?=
 =?utf-8?B?K2o0d0Y5dlBOeEpIY0RDQm55Q1VQamF6czAwZWFMem1HS25WUXhUMFNhZ3hT?=
 =?utf-8?B?MW14Ynh2cm04dlBhU0c2elZEMXVaWDNka21mdHQxUFFGSFdFNjViSEFoYmYr?=
 =?utf-8?B?cHNxZ3pNYkcvaDN2UkdHRWcrQkZlbHFuS3VxMDJudE40TmxmcE82SzJ2REZs?=
 =?utf-8?B?WklQQUt4V2liSVlwMmgyYldjbEl0bk1YWENVMlVIa3lqUHhqNVhvL1NFYXRh?=
 =?utf-8?B?WnV6RTVSNVZ5SGkvUmZjdksrRVl0YTgvSU5QM0RuN3NpcGdOdC9IN25rRTVZ?=
 =?utf-8?B?SVBUT21zREdPT1crYS8wZFU5NWpGM2laQ3N5cVpPR2FXOTdVUThPTFhaTkdo?=
 =?utf-8?B?R0cvTGtFNHo1N08rNjh2SG5iM2pIWDFlN21Na0tGTkVuOWNQUkVaTFFKaDR5?=
 =?utf-8?Q?mjnEdybVF2VVfmKAZQqs+69/iGsijkVScSTB0Mb7+m8r?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4BE9555634EB14E9154B298C7604805@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1959c64a-710d-4577-02b2-08dc8f3790ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 01:39:59.2712
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xM0U1IDiJDmLjeW3IkomIb+gOMdS8yym0GH2AoZB03MuGNqhrEUxcxbdpwol8wts+jy2p0YsN9ZCPHVd/MbkFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8884

T24gNi8xNi8yNCAyMzowNCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6DQo+IHZpcnRibGtfdXBk
YXRlX2NhY2hlX21vZGUgYm9pbHMgZG93biB0byBhIHNpbmdsZSBjYWxsIHRvDQo+IGJsa19xdWV1
ZV93cml0ZV9jYWNoZS4gIFJlbW92ZSBpdCBpbiBwcmVwYXJhdGlvbiBmb3IgbW92aW5nIHRoZSBj
YWNoZQ0KPiBjb250cm9sIGZsYWdzIGludG8gdGhlIHF1ZXVlX2xpbWl0cy4NCj4NCj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWc8aGNoQGxzdC5kZT4NCj4gUmV2aWV3ZWQtYnk6IEJh
cnQgVmFuIEFzc2NoZTxidmFuYXNzY2hlQGFjbS5vcmc+DQo+IFJldmlld2VkLWJ5OiBTdGVmYW4g
SGFqbm9jemk8c3RlZmFuaGFAcmVkaGF0LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IERhbWllbiBMZSBN
b2FsPGRsZW1vYWxAa2VybmVsLm9yZz4NCj4gUmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNrZTxo
YXJlQHN1c2UuZGU+DQo+IFJldmlld2VkLWJ5OiBKb2hhbm5lcyBUaHVtc2hpcm48am9oYW5uZXMu
dGh1bXNoaXJuQHdkYy5jb20+DQoNCkxvb2tzIGdvb2QuDQoNClJldmlld2VkLWJ5OiBDaGFpdGFu
eWEgS3Vsa2FybmkgPGtjaEBudmlkaWEuY29tPg0KDQotY2sNCg0KDQo=

