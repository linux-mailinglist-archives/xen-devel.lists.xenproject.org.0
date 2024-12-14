Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4EC9F1DF4
	for <lists+xen-devel@lfdr.de>; Sat, 14 Dec 2024 11:06:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857332.1269679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMP1V-0006ij-E5; Sat, 14 Dec 2024 10:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857332.1269679; Sat, 14 Dec 2024 10:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMP1V-0006gK-9u; Sat, 14 Dec 2024 10:05:21 +0000
Received: by outflank-mailman (input) for mailman id 857332;
 Sat, 14 Dec 2024 10:05:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YvF0=TH=kaod.org=clg@ozlabs.org>)
 id 1tMP1T-0006gE-Tw
 for xen-devel@lists.xenproject.org; Sat, 14 Dec 2024 10:05:20 +0000
Received: from mail.ozlabs.org (mail.ozlabs.org [2404:9400:2221:ea00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e90c478c-ba02-11ef-a0d6-8be0dac302b0;
 Sat, 14 Dec 2024 11:05:18 +0100 (CET)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Y9MJf5d2dz4wj2;
 Sat, 14 Dec 2024 21:05:06 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y9MJ53k8qz4w2R;
 Sat, 14 Dec 2024 21:04:37 +1100 (AEDT)
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
X-Inumbo-ID: e90c478c-ba02-11ef-a0d6-8be0dac302b0
Message-ID: <3bdef0a1-df2e-400e-91ea-76c3196aead4@kaod.org>
Date: Sat, 14 Dec 2024 11:04:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 41/71] hw/net: Constify all Property
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Pavel Pisa
 <pisa@cmp.felk.cvut.cz>, Francisco Iglesias <francisco.iglesias@amd.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Stefan Weil <sw@weilnetz.de>,
 Bernhard Beschow <shentey@gmail.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Helge Deller <deller@gmx.de>, Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Sven Schnelle <svens@stackframe.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 Rob Herring <robh@kernel.org>, "open list:Allwinner-a10"
 <qemu-arm@nongnu.org>, "open list:e500" <qemu-ppc@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
 <20241213190750.2513964-46-richard.henderson@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20241213190750.2513964-46-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/13/24 20:07, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/net/allwinner-sun8i-emac.c  | 2 +-
>   hw/net/allwinner_emac.c        | 2 +-
>   hw/net/cadence_gem.c           | 2 +-
>   hw/net/can/xlnx-versal-canfd.c | 2 +-
>   hw/net/can/xlnx-zynqmp-can.c   | 2 +-
>   hw/net/dp8393x.c               | 2 +-
>   hw/net/e1000.c                 | 2 +-
>   hw/net/e1000e.c                | 2 +-
>   hw/net/eepro100.c              | 2 +-
>   hw/net/fsl_etsec/etsec.c       | 2 +-
>   hw/net/ftgmac100.c             | 4 ++--
>   hw/net/igb.c                   | 2 +-
>   hw/net/imx_fec.c               | 2 +-
>   hw/net/lan9118.c               | 2 +-
>   hw/net/lance.c                 | 2 +-
>   hw/net/lasi_i82596.c           | 2 +-
>   hw/net/mcf_fec.c               | 2 +-
>   hw/net/mipsnet.c               | 2 +-
>   hw/net/msf2-emac.c             | 2 +-
>   hw/net/mv88w8618_eth.c         | 2 +-
>   hw/net/ne2000-isa.c            | 2 +-
>   hw/net/ne2000-pci.c            | 2 +-
>   hw/net/npcm7xx_emc.c           | 2 +-
>   hw/net/npcm_gmac.c             | 2 +-
>   hw/net/opencores_eth.c         | 2 +-
>   hw/net/pcnet-pci.c             | 2 +-
>   hw/net/rocker/rocker.c         | 2 +-
>   hw/net/rtl8139.c               | 2 +-
>   hw/net/smc91c111.c             | 2 +-
>   hw/net/spapr_llan.c            | 2 +-
>   hw/net/stellaris_enet.c        | 2 +-
>   hw/net/sungem.c                | 2 +-
>   hw/net/sunhme.c                | 2 +-
>   hw/net/tulip.c                 | 2 +-
>   hw/net/virtio-net.c            | 2 +-
>   hw/net/vmxnet3.c               | 2 +-
>   hw/net/xen_nic.c               | 2 +-
>   hw/net/xgmac.c                 | 2 +-
>   hw/net/xilinx_axienet.c        | 2 +-
>   hw/net/xilinx_ethlite.c        | 2 +-
>   40 files changed, 41 insertions(+), 41 deletions(-)


For the ftgmac100,

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> 
> diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
> index cdae74f503..3f03060bf5 100644
> --- a/hw/net/allwinner-sun8i-emac.c
> +++ b/hw/net/allwinner-sun8i-emac.c
> @@ -829,7 +829,7 @@ static void allwinner_sun8i_emac_realize(DeviceState *dev, Error **errp)
>       qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
>   }
>   
> -static Property allwinner_sun8i_emac_properties[] = {
> +static const Property allwinner_sun8i_emac_properties[] = {
>       DEFINE_NIC_PROPERTIES(AwSun8iEmacState, conf),
>       DEFINE_PROP_UINT8("phy-addr", AwSun8iEmacState, mii_phy_addr, 0),
>       DEFINE_PROP_LINK("dma-memory", AwSun8iEmacState, dma_mr,
> diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c
> index c104c2588e..39c10426cf 100644
> --- a/hw/net/allwinner_emac.c
> +++ b/hw/net/allwinner_emac.c
> @@ -462,7 +462,7 @@ static void aw_emac_realize(DeviceState *dev, Error **errp)
>       fifo8_create(&s->tx_fifo[1], TX_FIFO_SIZE);
>   }
>   
> -static Property aw_emac_properties[] = {
> +static const Property aw_emac_properties[] = {
>       DEFINE_NIC_PROPERTIES(AwEmacState, conf),
>       DEFINE_PROP_UINT8("phy-addr", AwEmacState, phy_addr, 0),
>       DEFINE_PROP_END_OF_LIST(),
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 526739887c..3fce01315f 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -1784,7 +1784,7 @@ static const VMStateDescription vmstate_cadence_gem = {
>       }
>   };
>   
> -static Property gem_properties[] = {
> +static const Property gem_properties[] = {
>       DEFINE_NIC_PROPERTIES(CadenceGEMState, conf),
>       DEFINE_PROP_UINT32("revision", CadenceGEMState, revision,
>                          GEM_MODID_VALUE),
> diff --git a/hw/net/can/xlnx-versal-canfd.c b/hw/net/can/xlnx-versal-canfd.c
> index e148bd7b46..97fa46c4b3 100644
> --- a/hw/net/can/xlnx-versal-canfd.c
> +++ b/hw/net/can/xlnx-versal-canfd.c
> @@ -2042,7 +2042,7 @@ static const VMStateDescription vmstate_canfd = {
>       }
>   };
>   
> -static Property canfd_core_properties[] = {
> +static const Property canfd_core_properties[] = {
>       DEFINE_PROP_UINT8("rx-fifo0", XlnxVersalCANFDState, cfg.rx0_fifo, 0x40),
>       DEFINE_PROP_UINT8("rx-fifo1", XlnxVersalCANFDState, cfg.rx1_fifo, 0x40),
>       DEFINE_PROP_UINT8("tx-fifo", XlnxVersalCANFDState, cfg.tx_fifo, 0x20),
> diff --git a/hw/net/can/xlnx-zynqmp-can.c b/hw/net/can/xlnx-zynqmp-can.c
> index 58f1432bb3..61c104c18b 100644
> --- a/hw/net/can/xlnx-zynqmp-can.c
> +++ b/hw/net/can/xlnx-zynqmp-can.c
> @@ -1169,7 +1169,7 @@ static const VMStateDescription vmstate_can = {
>       }
>   };
>   
> -static Property xlnx_zynqmp_can_properties[] = {
> +static const Property xlnx_zynqmp_can_properties[] = {
>       DEFINE_PROP_UINT32("ext_clk_freq", XlnxZynqMPCANState, cfg.ext_clk_freq,
>                          CAN_DEFAULT_CLOCK),
>       DEFINE_PROP_LINK("canbus", XlnxZynqMPCANState, canbus, TYPE_CAN_BUS,
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index c0977308ba..e3ca11991b 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -931,7 +931,7 @@ static const VMStateDescription vmstate_dp8393x = {
>       }
>   };
>   
> -static Property dp8393x_properties[] = {
> +static const Property dp8393x_properties[] = {
>       DEFINE_NIC_PROPERTIES(dp8393xState, conf),
>       DEFINE_PROP_LINK("dma_mr", dp8393xState, dma_mr,
>                        TYPE_MEMORY_REGION, MemoryRegion *),
> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> index ab72236d18..ef0af31751 100644
> --- a/hw/net/e1000.c
> +++ b/hw/net/e1000.c
> @@ -1677,7 +1677,7 @@ static void pci_e1000_realize(PCIDevice *pci_dev, Error **errp)
>                                           e1000_flush_queue_timer, d);
>   }
>   
> -static Property e1000_properties[] = {
> +static const Property e1000_properties[] = {
>       DEFINE_NIC_PROPERTIES(E1000State, conf),
>       DEFINE_PROP_BIT("extra_mac_registers", E1000State,
>                       compat_flags, E1000_FLAG_MAC_BIT, true),
> diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
> index 843892ce09..e2b7576f67 100644
> --- a/hw/net/e1000e.c
> +++ b/hw/net/e1000e.c
> @@ -661,7 +661,7 @@ static PropertyInfo e1000e_prop_disable_vnet,
>                       e1000e_prop_subsys_ven,
>                       e1000e_prop_subsys;
>   
> -static Property e1000e_properties[] = {
> +static const Property e1000e_properties[] = {
>       DEFINE_NIC_PROPERTIES(E1000EState, conf),
>       DEFINE_PROP_SIGNED("disable_vnet_hdr", E1000EState, disable_vnet, false,
>                           e1000e_prop_disable_vnet, bool),
> diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
> index 20b22d8e49..b8cb8d5cf1 100644
> --- a/hw/net/eepro100.c
> +++ b/hw/net/eepro100.c
> @@ -2058,7 +2058,7 @@ static E100PCIDeviceInfo *eepro100_get_class(EEPRO100State *s)
>       return eepro100_get_class_by_name(object_get_typename(OBJECT(s)));
>   }
>   
> -static Property e100_properties[] = {
> +static const Property e100_properties[] = {
>       DEFINE_NIC_PROPERTIES(EEPRO100State, conf),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
> index d8076e7be4..764be2c6a2 100644
> --- a/hw/net/fsl_etsec/etsec.c
> +++ b/hw/net/fsl_etsec/etsec.c
> @@ -414,7 +414,7 @@ static void etsec_instance_init(Object *obj)
>       sysbus_init_irq(sbd, &etsec->err_irq);
>   }
>   
> -static Property etsec_properties[] = {
> +static const Property etsec_properties[] = {
>       DEFINE_NIC_PROPERTIES(eTSEC, conf),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 478356ee3e..4adc7fb10c 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -1254,7 +1254,7 @@ static const VMStateDescription vmstate_ftgmac100 = {
>       }
>   };
>   
> -static Property ftgmac100_properties[] = {
> +static const Property ftgmac100_properties[] = {
>       DEFINE_PROP_BOOL("aspeed", FTGMAC100State, aspeed, false),
>       DEFINE_NIC_PROPERTIES(FTGMAC100State, conf),
>       DEFINE_PROP_BOOL("dma64", FTGMAC100State, dma64, false),
> @@ -1415,7 +1415,7 @@ static const VMStateDescription vmstate_aspeed_mii = {
>       }
>   };
>   
> -static Property aspeed_mii_properties[] = {
> +static const Property aspeed_mii_properties[] = {
>       DEFINE_PROP_LINK("nic", AspeedMiiState, nic, TYPE_FTGMAC100,
>                        FTGMAC100State *),
>       DEFINE_PROP_END_OF_LIST(),
> diff --git a/hw/net/igb.c b/hw/net/igb.c
> index b92bba402e..ad0f748d82 100644
> --- a/hw/net/igb.c
> +++ b/hw/net/igb.c
> @@ -591,7 +591,7 @@ static const VMStateDescription igb_vmstate = {
>       }
>   };
>   
> -static Property igb_properties[] = {
> +static const Property igb_properties[] = {
>       DEFINE_NIC_PROPERTIES(IGBState, conf),
>       DEFINE_PROP_BOOL("x-pcie-flr-init", IGBState, has_flr, true),
>       DEFINE_PROP_END_OF_LIST(),
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 4ee6f74206..9b64968477 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -1222,7 +1222,7 @@ static void imx_eth_realize(DeviceState *dev, Error **errp)
>       qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
>   }
>   
> -static Property imx_eth_properties[] = {
> +static const Property imx_eth_properties[] = {
>       DEFINE_NIC_PROPERTIES(IMXFECState, conf),
>       DEFINE_PROP_UINT32("tx-ring-num", IMXFECState, tx_ring_num, 1),
>       DEFINE_PROP_UINT32("phy-num", IMXFECState, phy_num, 0),
> diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
> index 99e87b7178..237e9b97d5 100644
> --- a/hw/net/lan9118.c
> +++ b/hw/net/lan9118.c
> @@ -1304,7 +1304,7 @@ static void lan9118_realize(DeviceState *dev, Error **errp)
>       ptimer_transaction_commit(s->timer);
>   }
>   
> -static Property lan9118_properties[] = {
> +static const Property lan9118_properties[] = {
>       DEFINE_NIC_PROPERTIES(lan9118_state, conf),
>       DEFINE_PROP_UINT32("mode_16bit", lan9118_state, mode_16bit, 0),
>       DEFINE_PROP_END_OF_LIST(),
> diff --git a/hw/net/lance.c b/hw/net/lance.c
> index 269615b452..9ed9c94cff 100644
> --- a/hw/net/lance.c
> +++ b/hw/net/lance.c
> @@ -137,7 +137,7 @@ static void lance_instance_init(Object *obj)
>                                     DEVICE(obj));
>   }
>   
> -static Property lance_properties[] = {
> +static const Property lance_properties[] = {
>       DEFINE_PROP_LINK("dma", SysBusPCNetState, state.dma_opaque,
>                        TYPE_DEVICE, DeviceState *),
>       DEFINE_NIC_PROPERTIES(SysBusPCNetState, state.conf),
> diff --git a/hw/net/lasi_i82596.c b/hw/net/lasi_i82596.c
> index 183fab8712..248e3841db 100644
> --- a/hw/net/lasi_i82596.c
> +++ b/hw/net/lasi_i82596.c
> @@ -158,7 +158,7 @@ static void lasi_82596_instance_init(Object *obj)
>                                     DEVICE(obj));
>   }
>   
> -static Property lasi_82596_properties[] = {
> +static const Property lasi_82596_properties[] = {
>       DEFINE_NIC_PROPERTIES(SysBusI82596State, state.conf),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/hw/net/mcf_fec.c b/hw/net/mcf_fec.c
> index 037cd2028e..55bad4c069 100644
> --- a/hw/net/mcf_fec.c
> +++ b/hw/net/mcf_fec.c
> @@ -660,7 +660,7 @@ static void mcf_fec_instance_init(Object *obj)
>       }
>   }
>   
> -static Property mcf_fec_properties[] = {
> +static const Property mcf_fec_properties[] = {
>       DEFINE_NIC_PROPERTIES(mcf_fec_state, conf),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/hw/net/mipsnet.c b/hw/net/mipsnet.c
> index 31bbd6fb89..c9ef1beb7b 100644
> --- a/hw/net/mipsnet.c
> +++ b/hw/net/mipsnet.c
> @@ -266,7 +266,7 @@ static void mipsnet_sysbus_reset(DeviceState *dev)
>       mipsnet_reset(s);
>   }
>   
> -static Property mipsnet_properties[] = {
> +static const Property mipsnet_properties[] = {
>       DEFINE_NIC_PROPERTIES(MIPSnetState, conf),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c
> index d28fc6c570..8d9015f962 100644
> --- a/hw/net/msf2-emac.c
> +++ b/hw/net/msf2-emac.c
> @@ -546,7 +546,7 @@ static void msf2_emac_init(Object *obj)
>       sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
>   }
>   
> -static Property msf2_emac_properties[] = {
> +static const Property msf2_emac_properties[] = {
>       DEFINE_PROP_LINK("ahb-bus", MSF2EmacState, dma_mr,
>                        TYPE_MEMORY_REGION, MemoryRegion *),
>       DEFINE_NIC_PROPERTIES(MSF2EmacState, conf),
> diff --git a/hw/net/mv88w8618_eth.c b/hw/net/mv88w8618_eth.c
> index 96c65f4d46..ccb11512db 100644
> --- a/hw/net/mv88w8618_eth.c
> +++ b/hw/net/mv88w8618_eth.c
> @@ -371,7 +371,7 @@ static const VMStateDescription mv88w8618_eth_vmsd = {
>       }
>   };
>   
> -static Property mv88w8618_eth_properties[] = {
> +static const Property mv88w8618_eth_properties[] = {
>       DEFINE_NIC_PROPERTIES(mv88w8618_eth_state, conf),
>       DEFINE_PROP_LINK("dma-memory", mv88w8618_eth_state, dma_mr,
>                        TYPE_MEMORY_REGION, MemoryRegion *),
> diff --git a/hw/net/ne2000-isa.c b/hw/net/ne2000-isa.c
> index 26980e087e..1cd070d419 100644
> --- a/hw/net/ne2000-isa.c
> +++ b/hw/net/ne2000-isa.c
> @@ -79,7 +79,7 @@ static void isa_ne2000_realizefn(DeviceState *dev, Error **errp)
>       qemu_format_nic_info_str(qemu_get_queue(s->nic), s->c.macaddr.a);
>   }
>   
> -static Property ne2000_isa_properties[] = {
> +static const Property ne2000_isa_properties[] = {
>       DEFINE_PROP_UINT32("iobase", ISANE2000State, iobase, 0x300),
>       DEFINE_PROP_UINT32("irq",   ISANE2000State, isairq, 9),
>       DEFINE_NIC_PROPERTIES(ISANE2000State, ne2000.c),
> diff --git a/hw/net/ne2000-pci.c b/hw/net/ne2000-pci.c
> index 74773069c6..12fa579d22 100644
> --- a/hw/net/ne2000-pci.c
> +++ b/hw/net/ne2000-pci.c
> @@ -96,7 +96,7 @@ static void ne2000_instance_init(Object *obj)
>                                     &pci_dev->qdev);
>   }
>   
> -static Property ne2000_properties[] = {
> +static const Property ne2000_properties[] = {
>       DEFINE_NIC_PROPERTIES(PCINE2000State, ne2000.c),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
> index 7307a13400..f06e908d04 100644
> --- a/hw/net/npcm7xx_emc.c
> +++ b/hw/net/npcm7xx_emc.c
> @@ -845,7 +845,7 @@ static const VMStateDescription vmstate_npcm7xx_emc = {
>       },
>   };
>   
> -static Property npcm7xx_emc_properties[] = {
> +static const Property npcm7xx_emc_properties[] = {
>       DEFINE_NIC_PROPERTIES(NPCM7xxEMCState, conf),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/hw/net/npcm_gmac.c b/hw/net/npcm_gmac.c
> index 685905f9e2..1db29307d7 100644
> --- a/hw/net/npcm_gmac.c
> +++ b/hw/net/npcm_gmac.c
> @@ -912,7 +912,7 @@ static const VMStateDescription vmstate_npcm_gmac = {
>       },
>   };
>   
> -static Property npcm_gmac_properties[] = {
> +static const Property npcm_gmac_properties[] = {
>       DEFINE_NIC_PROPERTIES(NPCMGMACState, conf),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/hw/net/opencores_eth.c b/hw/net/opencores_eth.c
> index 2c0ebda100..003b452bc9 100644
> --- a/hw/net/opencores_eth.c
> +++ b/hw/net/opencores_eth.c
> @@ -743,7 +743,7 @@ static void qdev_open_eth_reset(DeviceState *dev)
>       open_eth_reset(d);
>   }
>   
> -static Property open_eth_properties[] = {
> +static const Property open_eth_properties[] = {
>       DEFINE_NIC_PROPERTIES(OpenEthState, conf),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
> index 6190b76916..83ba8cd949 100644
> --- a/hw/net/pcnet-pci.c
> +++ b/hw/net/pcnet-pci.c
> @@ -252,7 +252,7 @@ static void pcnet_instance_init(Object *obj)
>                                     DEVICE(obj));
>   }
>   
> -static Property pcnet_properties[] = {
> +static const Property pcnet_properties[] = {
>       DEFINE_NIC_PROPERTIES(PCIPCNetState, state.conf),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
> index 5e74acc969..efc20396aa 100644
> --- a/hw/net/rocker/rocker.c
> +++ b/hw/net/rocker/rocker.c
> @@ -1459,7 +1459,7 @@ static void rocker_reset(DeviceState *dev)
>       DPRINTF("Reset done\n");
>   }
>   
> -static Property rocker_properties[] = {
> +static const Property rocker_properties[] = {
>       DEFINE_PROP_STRING("name", Rocker, name),
>       DEFINE_PROP_STRING("world", Rocker, world_name),
>       DEFINE_PROP_MACADDR("fp_start_macaddr", Rocker,
> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> index bc56075c0d..064a73b6b4 100644
> --- a/hw/net/rtl8139.c
> +++ b/hw/net/rtl8139.c
> @@ -3410,7 +3410,7 @@ static void rtl8139_instance_init(Object *obj)
>                                     DEVICE(obj));
>   }
>   
> -static Property rtl8139_properties[] = {
> +static const Property rtl8139_properties[] = {
>       DEFINE_NIC_PROPERTIES(RTL8139State, conf),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
> index 180ba5c791..a853c30fa2 100644
> --- a/hw/net/smc91c111.c
> +++ b/hw/net/smc91c111.c
> @@ -788,7 +788,7 @@ static void smc91c111_realize(DeviceState *dev, Error **errp)
>       /* ??? Save/restore.  */
>   }
>   
> -static Property smc91c111_properties[] = {
> +static const Property smc91c111_properties[] = {
>       DEFINE_NIC_PROPERTIES(smc91c111_state, conf),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/hw/net/spapr_llan.c b/hw/net/spapr_llan.c
> index 8af33d91b6..d381c041db 100644
> --- a/hw/net/spapr_llan.c
> +++ b/hw/net/spapr_llan.c
> @@ -786,7 +786,7 @@ static target_ulong h_change_logical_lan_mac(PowerPCCPU *cpu,
>       return H_SUCCESS;
>   }
>   
> -static Property spapr_vlan_properties[] = {
> +static const Property spapr_vlan_properties[] = {
>       DEFINE_SPAPR_PROPERTIES(SpaprVioVlan, sdev),
>       DEFINE_NIC_PROPERTIES(SpaprVioVlan, nicconf),
>       DEFINE_PROP_BIT("use-rx-buffer-pools", SpaprVioVlan,
> diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
> index 9ebff296c4..4af1afa733 100644
> --- a/hw/net/stellaris_enet.c
> +++ b/hw/net/stellaris_enet.c
> @@ -497,7 +497,7 @@ static void stellaris_enet_realize(DeviceState *dev, Error **errp)
>       qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
>   }
>   
> -static Property stellaris_enet_properties[] = {
> +static const Property stellaris_enet_properties[] = {
>       DEFINE_NIC_PROPERTIES(stellaris_enet_state, conf),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/hw/net/sungem.c b/hw/net/sungem.c
> index 67087e9842..bcc7a18382 100644
> --- a/hw/net/sungem.c
> +++ b/hw/net/sungem.c
> @@ -1420,7 +1420,7 @@ static void sungem_instance_init(Object *obj)
>                                     DEVICE(obj));
>   }
>   
> -static Property sungem_properties[] = {
> +static const Property sungem_properties[] = {
>       DEFINE_NIC_PROPERTIES(SunGEMState, conf),
>       /* Phy address should be 0 for most Apple machines except
>        * for K2 in which case it's 1. Will be set by a machine
> diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
> index 0e6c655a5b..86f472fcbe 100644
> --- a/hw/net/sunhme.c
> +++ b/hw/net/sunhme.c
> @@ -177,7 +177,7 @@ struct SunHMEState {
>       uint16_t miiregs[HME_MII_REGS_SIZE];
>   };
>   
> -static Property sunhme_properties[] = {
> +static const Property sunhme_properties[] = {
>       DEFINE_NIC_PROPERTIES(SunHMEState, conf),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/hw/net/tulip.c b/hw/net/tulip.c
> index 9df3e17162..f35b58a88c 100644
> --- a/hw/net/tulip.c
> +++ b/hw/net/tulip.c
> @@ -1007,7 +1007,7 @@ static void tulip_instance_init(Object *obj)
>                                     &pci_dev->qdev);
>   }
>   
> -static Property tulip_properties[] = {
> +static const Property tulip_properties[] = {
>       DEFINE_NIC_PROPERTIES(TULIPState, c),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 6e8c51a2db..4fd1f9acca 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3985,7 +3985,7 @@ static const VMStateDescription vmstate_virtio_net = {
>       .dev_unplug_pending = dev_unplug_pending,
>   };
>   
> -static Property virtio_net_properties[] = {
> +static const Property virtio_net_properties[] = {
>       DEFINE_PROP_BIT64("csum", VirtIONet, host_features,
>                       VIRTIO_NET_F_CSUM, true),
>       DEFINE_PROP_BIT64("guest_csum", VirtIONet, host_features,
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index 8aa8c46228..f69547cad5 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -2471,7 +2471,7 @@ static const VMStateDescription vmstate_vmxnet3 = {
>       }
>   };
>   
> -static Property vmxnet3_properties[] = {
> +static const Property vmxnet3_properties[] = {
>       DEFINE_NIC_PROPERTIES(VMXNET3State, conf),
>       DEFINE_PROP_BIT("x-old-msi-offsets", VMXNET3State, compat_flags,
>                       VMXNET3_COMPAT_FLAG_OLD_MSI_OFFSETS_BIT, false),
> diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
> index 89487b49ba..5a5259150a 100644
> --- a/hw/net/xen_nic.c
> +++ b/hw/net/xen_nic.c
> @@ -555,7 +555,7 @@ static void xen_netdev_unrealize(XenDevice *xendev)
>   
>   /* ------------------------------------------------------------- */
>   
> -static Property xen_netdev_properties[] = {
> +static const Property xen_netdev_properties[] = {
>       DEFINE_NIC_PROPERTIES(XenNetDev, conf),
>       DEFINE_PROP_INT32("idx", XenNetDev, dev, -1),
>       DEFINE_PROP_END_OF_LIST(),
> diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
> index ffe3fc8dbe..6e0f96f485 100644
> --- a/hw/net/xgmac.c
> +++ b/hw/net/xgmac.c
> @@ -414,7 +414,7 @@ static void xgmac_enet_realize(DeviceState *dev, Error **errp)
>                                     s->conf.macaddr.a[0];
>   }
>   
> -static Property xgmac_properties[] = {
> +static const Property xgmac_properties[] = {
>       DEFINE_NIC_PROPERTIES(XgmacState, conf),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index faf27947b0..9d0c618e2f 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -996,7 +996,7 @@ static void xilinx_enet_init(Object *obj)
>       sysbus_init_mmio(sbd, &s->iomem);
>   }
>   
> -static Property xilinx_enet_properties[] = {
> +static const Property xilinx_enet_properties[] = {
>       DEFINE_PROP_UINT32("phyaddr", XilinxAXIEnet, c_phyaddr, 7),
>       DEFINE_PROP_UINT32("rxmem", XilinxAXIEnet, c_rxmem, 0x1000),
>       DEFINE_PROP_UINT32("txmem", XilinxAXIEnet, c_txmem, 0x1000),
> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> index bd81290808..9413731d20 100644
> --- a/hw/net/xilinx_ethlite.c
> +++ b/hw/net/xilinx_ethlite.c
> @@ -251,7 +251,7 @@ static void xilinx_ethlite_init(Object *obj)
>       sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
>   }
>   
> -static Property xilinx_ethlite_properties[] = {
> +static const Property xilinx_ethlite_properties[] = {
>       DEFINE_PROP_UINT32("tx-ping-pong", struct xlx_ethlite, c_tx_pingpong, 1),
>       DEFINE_PROP_UINT32("rx-ping-pong", struct xlx_ethlite, c_rx_pingpong, 1),
>       DEFINE_NIC_PROPERTIES(struct xlx_ethlite, conf),


