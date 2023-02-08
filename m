Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 276CA68E8AE
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 08:03:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491573.760746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPeT5-0005qz-8o; Wed, 08 Feb 2023 07:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491573.760746; Wed, 08 Feb 2023 07:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPeT5-0005pC-5N; Wed, 08 Feb 2023 07:02:11 +0000
Received: by outflank-mailman (input) for mailman id 491573;
 Wed, 08 Feb 2023 07:02:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pPeT3-0005p6-Bt
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 07:02:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f15d003-a77e-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 08:02:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7675.eurprd04.prod.outlook.com (2603:10a6:10:207::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 07:02:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 07:02:04 +0000
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
X-Inumbo-ID: 7f15d003-a77e-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wsh0GeiA1qZz7MArhe6UPagRq+PB2kk0pPcTf4QrQczRhxtzygcharlyKHx57aSkY2F7WvSW1EgwqzaNge0Cao2GshqrQgs48cuUkvF6dygGsZ3Dj+y6hLVVnJk1XWOgghKfS8Fkkfs3mNPFVJx71cA7LwhllvWwCjJiznluTXPO3EZDok3BFG7HaXEju8tZ8MueoGArhAd4DOOk3pcfNKw+Z02tMNVQk/WfEa2K6n7J1h34arFwMibR5CW1titzgISDXpzD0lpk/RrOC0ZA1hf7ZeBrs2fTdjJ/6KTq3rLd7pRNZr4fNC8PP749bGwZNej3EHbZL9+zNdrXjdEIMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gY1TRlj8K9y3EEs7dSAdirCHxY/e6l6kQYi59rctxco=;
 b=PpfhaThunQzjjspN6iUVGyeITOKzqEbddDHwcAhAim+jlk50jBZlmdPhit/XJEfrNfp6b9VdCBm2oOb+OGT8RvO0CWpueGy+DfPI16DoFdS5lsb0RSYab44/6RrNdauOZLSRQKxg9kLuM+7ffZFM8PQwJsWRJId9JD/+bg58QZEosjYaF+PIL8VCZhyqXSxI1ewfH66UuG0xzgGWQlRCAeauXGR4ly3RclTlvyEJvzdOo1ba9m915lJ/NqfHd6EoJY2T6AkF/U7zS1N/ihr9eA9gfzQr0JxAJRYMLwmH85/7oMO5ztVALyDypecAIfArs4BSSTosNXCl+j9ECiqfJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gY1TRlj8K9y3EEs7dSAdirCHxY/e6l6kQYi59rctxco=;
 b=WeD76y2fL05+ksDGloeNdUbjux+kYD9yYEO13Br9Gn3bZWIPwMTQxTtWaKszwvKe1yC3wXAWRgBXY8Yt5ahPgueTstj5UQsNvS9Z5FIjw1CvbyF+Sup7Veuv0QaV1GnPmJVp2e4Grpj1wpyuxBzpl8eoj7YJPsS6wApkbU/g8hN+n6NcarTaiG2swfZgV7vgxep8qmhrPjBNfUhfUWctVfBjyOTDBc/uX4Sc8vt6VHcBn8nakSWkges4Vy346ukGRVWqb7J0ZYRMkQCN34sdKdkqihw8lY03V+LUHgaJZXgTgKMmFwftLY3vNqBykOhfpgApt7066fwXdAce3u6BYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <920136c2-2c24-d851-fbda-ba7cd2c640ed@suse.com>
Date: Wed, 8 Feb 2023 08:02:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] Build system: Replace git:// and http:// with
 https://
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1675829866.git.demi@invisiblethingslab.com>
 <74c5389cb5adbd62154735a28f6c31ae1865b254.1675829867.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <74c5389cb5adbd62154735a28f6c31ae1865b254.1675829867.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: 191e42cc-937b-4d78-9093-08db09a26168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7rt3XtbqjdTsAMI/Uo2ilf+qvnBLBkon8FlacEZqq0qIFFOtCnQZV7sZX6pTByGyov/LKdbCZQD4/2IIYzyb/uDk4xoGGPWxJGCS1foWCcQdFYoveqQptZe4d6d1j17rBHImXDuynDqHF22Usk7U32T9crau8MhnKR/HdcANgwhWj6r5evD38QwMW4JMFw2Y7BpvKL2B7GSPFfTmidx9+SZr6eKkG8015TsEWXcdrlNMwREfUq3XASR/Juqb30qOUb+9hr0IY8ErOe+iiTNdW0wyGcII5R0L9g00G67wXy1IDombDCMGvIFwC1H01yjzieYQ5zZRMz7WoWW8YPEIrT0LJIDzss82Dv9rs1+MqRQNx7EDW4MtiDTKYvNpox/EUjpDKPbM1S2q60eGQXGQgt8ULMmoZNfMyzQ/3AOOICjJpmJTLoRfXi99jUSFiNIUTYgSr0amApibWTuFtI7tpETXFEU8VxsaM8dJxZEDmt933b1X35S8dclbdsFRQ84aeWIuplL3fB+/3Q0Lci4Pny4YXaQLRtk66w2RqOxIPgohZAR9pYu3N1NY7Sx/hyx7i+ZJDMgJyCMccSfJAevqhpTnXhqOIOaB5Zu9yIVIS4nfj0Jgkbk656uJcqIgJus0mury3EyiOPqW97VztcZRqfU3QBZlbBh0WivygcMWi6ZHiPH48yi9DuPHhaxesIK9/JgsSIm82x1oMglLmaD9yV0B4fzCf1j5XlBeRfAUsGdRxSc9rWn+DUnkTt0u18Co2pESE+ZkBVmAJSdVfjkU0Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199018)(5660300002)(86362001)(2906002)(8936002)(41300700001)(66946007)(8676002)(31696002)(4326008)(66476007)(6916009)(66556008)(36756003)(83380400001)(6666004)(6506007)(53546011)(26005)(186003)(6512007)(478600001)(6486002)(966005)(2616005)(38100700002)(316002)(54906003)(31686004)(84970400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDdCOTREKzZDY0tzTDdFakN6OUJHeXZ3Z0Z2ampVRVNBaXRNQTRvd3R4L2FH?=
 =?utf-8?B?dGFFQ05odDZJVjN2ZnJuMEc1ZVRuTVQxeE4xMnA4V0RGNm4wSFRScVRrQjRz?=
 =?utf-8?B?YWN2azd0Z2QzM0lKVVZWVGtseXEzYy9uMjFUdlJpQVhUTEh4c0REdkJGN0tk?=
 =?utf-8?B?N3dmLzdHVmloMm9meUhXVjNkTk8zQUZYd05CWTFybmpkcUIrNFordHl6bWhp?=
 =?utf-8?B?YzZDc043T1ZvU1FkMGpFdzlXdXZvVkFpc1JEVlN5Wmdlb0Y2TEZkRFM0MTBK?=
 =?utf-8?B?bHJkamJBZjJnYUJXT1pERjBzckt3NTVhS3NpZGNGTmRQemVSMVB3dWRuMVZn?=
 =?utf-8?B?TVFITXFOaWJzYUhoeThRcG9iaDErZUhXZStUdGJIOXZUOW44R2ErZ0xPeXpE?=
 =?utf-8?B?VHVmT0swTW81N0w1R1lvY3dDWnNkaTlMUWxSRmcwUnpydXBVSmJCeEV0SDhq?=
 =?utf-8?B?aEwra0c0QXlFcDRRbmZsajgzOVE3YVVZM1o3V3RzSG9PRGppa0RrbnM0N1o3?=
 =?utf-8?B?bHNxd2RRcmhXenVieU5UdXFaRkhoek1BdGZvbGpzeW1DUjdLcGlMYkZaTW9H?=
 =?utf-8?B?VFNQcCtWSWNKRGZnRTY2NGdpNUxvTEdERWVZZkFFcVpXeE9HZEVFbndBTXIx?=
 =?utf-8?B?REoxTUdiT0M2MXkrYng3Rks5THMrZEovSnhYWjJodzNvN25WblMyV1RBMFJC?=
 =?utf-8?B?NzI4bjZFb3NDZDh0cU00VkJBWGxJVnlMUFA2cjF0YW9QbjFNSzltckZjMzcr?=
 =?utf-8?B?UXdES1l4MDhGeS9ZbS9LL1l5eG4xY3JtdHFvYkxGTG5SakxtVCtzL0xaUUJL?=
 =?utf-8?B?ZHBPWnIxcG1LR2NDSjNhSTJMQnU2SThMZXFPZFV1TlRvNjRtVE9waStGT0tm?=
 =?utf-8?B?aGFpOFdEanVQbDF1K0lrSXlTU0xjQzBEdzczSmJUSFRIdWVPMEhJQkhMclhG?=
 =?utf-8?B?dnl0NTh0MXJXZmREZ2doU3hwb3VTYVU0NitnUFRXOTJtMkNOcWxZL3V3V0I5?=
 =?utf-8?B?a1JIeXNVMDRvN2RnUEYwdW5oS2RLQTE2c0R6ZlcxemtOWEpYeDZqVWxLdXNS?=
 =?utf-8?B?cjFzN21LVmJIckw4ZW41dkVoSHJFcmlYbW16Z0Y3WlI2Wi80dGh6K0hUMXZ6?=
 =?utf-8?B?MVFPTG5hcXV3NkdGZmhqQmQ2R2NRN0t0dmJmeU9xQy9Cam82a1RVdTBTWmZQ?=
 =?utf-8?B?b3B4WUhiWThxZGhlUnNOWjlrK0JtWFdlejN5eWt6YVV4UUVZT2dvYXB6aGRU?=
 =?utf-8?B?VytRUG5mdU5kdUtuY2kzUXl5Mm9ZV3dJeVcrRVp5TDZ4NmdHWHFPZDUzam9x?=
 =?utf-8?B?Ynh3a1p1Y3NMOXlGbnVCdjJkVkMvWHhBYStKOXQ2OFdXNWxvSElGSm42TnJJ?=
 =?utf-8?B?R2hWcklqMEhmYWxUVFdiT3ozbUFianlzSGVOZ2ZVcVJvS3BPbUZESnplUUhq?=
 =?utf-8?B?eU9SSzdabncvNWxJMm5BUFpLR2tHVERTcGZZTUZ6VnFIdFdBOFFCdVl2TXVh?=
 =?utf-8?B?cXk4cFdrUmd5Wk1HK3ZkbHFGSDNycDliS05ycHZ0dFExNDNxM0lZbG9GSVhr?=
 =?utf-8?B?bkpnWnBadkQvSk05Y2M2dm8xdzRIZnlQTGFzeXAyU2tsVWVsQmdKOExzRUJE?=
 =?utf-8?B?UC9DVnNuMTZvcXRrM0NSd0ovYUM5cGpQNFBNRFpUQkxvdURrUzJaWVVFaHZ5?=
 =?utf-8?B?eUw5VmJsMk9lK0pTYlBMbjN3ZUhGSUFlcTMrWFhvdWU5dk1CYVpMRGdMQmN4?=
 =?utf-8?B?U1BBbjM3U3QvSzhtZmVOSE45NDBTeW9ES2xCUUZERWZ0a3E4c2h3dGx3d2ha?=
 =?utf-8?B?U3FEMVFVZmJBWWpPK09zajJyTWNibmt4NmVtbCtwQjV1WE5mUWZ1MjlvcDJx?=
 =?utf-8?B?YnJHL2pJOFY5cElwcVRvNDZXTDY0ZG5Va1NxekcrZFhYUHB4ZE15UjQvcUZp?=
 =?utf-8?B?UllleWlCNWRjbGdRZGhoMXlKQWoxSnRPZG9FZjdLaTFEdlVkSU9tUGV6NTdV?=
 =?utf-8?B?T290WTU5L2JXY05KSFlEblc5ZG4xbDVKR3FSNXNoRERXYmpSZjlEMXUvNTk3?=
 =?utf-8?B?YkZ4YlRuWXMrbjFTVVZ2a0dsdkRrS2RXT2I0S2xMUjBsK3AwRHRJRjNXL0Q5?=
 =?utf-8?Q?rC4yQpCPjs4AvTAv0LEqSr7bc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 191e42cc-937b-4d78-9093-08db09a26168
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 07:02:04.3057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EeUdX7e/MjQwC4Eddj6NDnefKmKuUMzQBCCzh3w2K8sNdAZ6jWohLh05SdhAUP52xMa6RdoJHAwmm26lSVaSCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7675

On 08.02.2023 05:51, Demi Marie Obenour wrote:
> --- a/stubdom/grub.patches/10graphics.diff
> +++ b/stubdom/grub.patches/10graphics.diff
> @@ -1187,7 +1187,7 @@ diff -Naur grub-0.97.orig/stage2/graphics.c grub-0.97/stage2/graphics.c
>  + *  GNU General Public License for more details.
>  + *
>  + *  You should have received a copy of the GNU General Public License
> -+ *  along with this program; If not, see <http://www.gnu.org/licenses/>
> ++ *  along with this program; If not, see <https://www.gnu.org/licenses/>
>  + */

While this one may be seen as simply on the edge, ...

> --- a/tools/examples/xeninfo.pl
> +++ b/tools/examples/xeninfo.pl
> @@ -36,7 +36,7 @@ sub apiconnect
>  {
>  	foreach my $xenhost (keys %xenhosts)
>  	{
> -		my $xen = RPC::XML::Client->new("http://$xenhost:$xenhosts{$xenhost}{'port'}");
> +		my $xen = RPC::XML::Client->new("https://$xenhost:$xenhosts{$xenhost}{'port'}");
>  		my $session = $xen->simple_request("session.login_with_password", "user","");
>  		if (! $session)
>  		{

... this pretty clearly isn't part of the build system. And iirc Anthony
had put under question this change anyway.

> --- a/tools/firmware/etherboot/Makefile
> +++ b/tools/firmware/etherboot/Makefile
> @@ -5,9 +5,9 @@ include $(XEN_ROOT)/tools/Rules.mk
>  include Config
>  
>  ifeq ($(GIT_HTTP),y)
> -IPXE_GIT_URL ?= http://git.ipxe.org/ipxe.git
> +IPXE_GIT_URL ?= https://git.ipxe.org/ipxe.git
>  else
> -IPXE_GIT_URL ?= git://git.ipxe.org/ipxe.git
> +IPXE_GIT_URL ?= https://git.ipxe.org/ipxe.git
>  endif

When both URLs are the same now, why keep the ifeq()?

Jan

